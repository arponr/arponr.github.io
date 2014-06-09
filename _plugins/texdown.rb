class Jekyll::Converters::Markdown::TeXdown
  def initialize(config)
    require 'kramdown'
    @config = config
    @env = {
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

  def environments(i, n, refs)
    i = i.gsub(%r{
      \\begin\{(#{Regexp.union(@env.keys)})\}\s*
      (?:\[\s*(.*?)\s*\])?\s*
      (?:\{\s*(.*?)\s*\})?\s*
      (.*?)\s*
      \\end\{\1\}
    }xm) do
      e = @env[$1]
      j = ""
      if e[0].nil?
        u = $3.nil? ? "#{$1}*" : $1
        j << "{::nomarkdown}<span id=#{$3}></span>{:/}" unless $3.nil?
        j << "\\[\n\\begin{#{u}}\n"
        unless $3.nil?
          j << "\\tag{#{n}}\n"
          refs[$3] = "#{e[1]} #{n}"
          n += 1
        end
        j << "#{$4}\n\\end{#{u}}\n\\]\n"
      else
        j << "<div "
        j << "id=\"#{$3}\" " unless $3.nil?
        j << "class=\"environment #{$1}\">\n"
        j << "\#" * 6
        unless $3.nil?
          j << "#{n}. "
          refs[$3] = "#{e[1]} #{n}"
          n += 1
        end
        j << "#{e[0]}"
        j << ($2.nil? ? "\n" : " (#{$2})\n")
        c, n, refs = environments($4, n, refs)
        j << "\n#{c}\n</div>"
      end
      j
    end
    [i, n, refs]
  end

  def convert(i)
    # environments
    i, n, refs = environments(i, 1, Hash.new("???"))

    #references
    i = i.gsub(/\\ref\{(.*?)\}/m) {"<a href=\"\##{$1}\">#{refs[$1]}</a>"}
    
    # inline math
    i = i.gsub(/\$(.*?)\$/m) {|j| "{::nomarkdown}#{j}{:/}"}

    # display math
    i = i.gsub(/\\\[\s+(.*?)\s+\\\]/m) {|j| "{::nomarkdown}#{j}{:/}"}

    Kramdown::Document.new(i, :auto_ids => false, :parse_block_html => true).to_html
  end
end
