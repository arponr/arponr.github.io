class Jekyll::Converters::Markdown::TeXdown
  def initialize(config)
    require 'kramdown'
    @config = config
    @environments = {
      "align"       => [nil,           "Eq."],
      "definition"  => ["Definition",  "Df."],
      "definitions" => ["Definitions", "Df."],
      "equation"    => [nil,           "Eq."],
      "example"     => ["Example",     "Ex."],
      "examples"    => ["Examples",    "Ex."],
      "lemma"       => ["Lemma",       "Lm."],
      "proof"       => ["Proof",       "Pf."],
      "proposition" => ["Proposition", "Pr."],
      "remark"      => ["Remark",      "Rm."],
      "remarks"     => ["Remarks",     "Rm."],
      "theorem"     => ["Theorem",     "Th."],
    }
  rescue LoadError
    STDERR.puts 'You are missing a library required for Markdown. Please run:'
    STDERR.puts '  $ [sudo] gem install kramdown'
    raise FatalException.new("Missing dependency: kramdown")
  end

  def handle_environments(input, refnum, refs)
    input = input.gsub(%r{
      \\begin\{(#{Regexp.union(@environments.keys)})\}\s*
      (?:\[\s*(.*?)\s*\])?\s*
      (?:\{\s*(.*?)\s*\})?\s*
      (.*?)\s*
      \\end\{\1\}
    }mx) do
      env, title, ref, content = $1, $2, $3, $4
      env_name, env_label = @environments[env]
      is_eqn = env_name.nil?
      has_title = !title.nil?
      has_ref = !ref.nil?

      output = ""

      if is_eqn
        type = has_ref ? env : "#{env}*" 
        output << "{::nomarkdown}<span id=#{$3}></span>{:/}" if has_ref
        output << "\\[\n\\begin{#{type}}\n"
        if has_ref
          output << "\\tag{#{refnum}}\n"
          refs[ref] = "#{env_label} #{refnum}"
          refnum += 1
        end
        output << "#{$content}\n\\end{#{type}}\n\\]\n"
      else
        output << "<div "
        output << "id=\"#{ref}\" " if has_ref
        output << "class=\"environment #{env}\">\n"
        output << "\#" * 6
        if has_ref
          output << "#{refnum}. "
          refs[ref] = "#{env_label} #{refnum}"
          refnum += 1
        end
        output << "#{env_name}"
        output << (has_title ? " (#{title})\n": "\n")
        content, refnum, refs = handle_environments(content, refnum, refs)
        output << "\n#{content}\n</div>"
      end
      output
    end
    [input, refnum, refs]
  end

  def convert(input)
    # environments
    input, refnum, refs = handle_environments(input, 1, Hash.new("???"))

    #references
    input = input.gsub(/\\ref\{(.*?)\}/m) {"<a href=\"\##{$1}\">#{refs[$1]}</a>"}
    
    # inline math
    input = input.gsub(/\$(.*?)\$/m) {|j| "{::nomarkdown}#{j}{:/}"}

    # display math
    input = input.gsub(/\\\[\s+(.*?)\s+\\\]/m) {|j| "{::nomarkdown}#{j}{:/}"}

    Kramdown::Document.new(input, :auto_ids => false, :parse_block_html => true).to_html
  end
end
