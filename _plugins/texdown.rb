class Jekyll::Converters::Markdown::TeXdown
  def initialize(config)
    require 'kramdown'
    @config = config
    @environments = {
      "align"       => [nil,           "Eq.", false],
      "definition"  => ["Definition",  "Df.", true],
      "definitions" => ["Definitions", "Df.", true],
      "equation"    => [nil,           "Eq.", false],
      "example"     => ["Example",     "Ex.", true],
      "examples"    => ["Examples",    "Ex.", true],
      "lemma"       => ["Lemma",       "Lm.", true],
      "notation"    => ["Notation",    "Nt.", false],
      "proof"       => ["Proof",       "Pf.", false],
      "proposition" => ["Proposition", "Pr.", true],
      "remark"      => ["Remark",      "Rm.", true],
      "remarks"     => ["Remarks",     "Rm.", true],
      "theorem"     => ["Theorem",     "Th.", true],
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
      env_name, env_label, env_num = @environments[env]
      is_eqn = env_name.nil?
      has_title = !title.nil?
      has_ref = !ref.nil?

      output = ""

      if is_eqn
        type = (has_ref || env_num) ? env : "#{env}*" 
        output << "{::nomarkdown}<span id=#{$3}></span>{:/}" if has_ref
        output << "\\[\n\\begin{#{type}}\n"
        if has_ref || env_num
          refnum += 1
          output << "\\tag{#{refnum}}\n"
        end
        if has_ref
          refs[ref] = "#{env_label} #{refnum}"
        end
        output << "#{content}\n\\end{#{type}}\n\\]\n"
      else
        output << "<div "
        output << "id=\"#{ref}\" " if has_ref
        output << "class=\"environment #{env}\">\n"
        output << "\#" * 6
        if has_ref || env_num
          refnum += 1
          output << "#{refnum}. "
        end
        if has_ref
          refs[ref] = "#{env_label} #{refnum}"
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
    input, refnum, refs = handle_environments(input, 0, Hash.new("???"))

    #references
    input = input.gsub(/\\ref\{(.*?)\}/m) {"<a href=\"\##{$1}\">#{refs[$1]}</a>"}
    
    # inline math
    breaks = ["\\to", "\\iso"]
    input = input.gsub(/\$.*?\$/m) do |j|
      j = j.gsub(/(\s+#{Regexp.union(breaks)})\s+([^\$])/m, "\\1$ $\\2")
      "{::nomarkdown}#{j}{:/}"
    end

    # display math
    input = input.gsub(/\\\[.*?\\\]/m) {|j| "{::nomarkdown}#{j}{:/}"}

    Kramdown::Document.new(input, :auto_ids => false, :parse_block_html => true).to_html
  end
end
