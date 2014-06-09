class Jekyll::Converters::Markdown::TeXdown
  def initialize(config)
    require 'kramdown'
    @config = config
  rescue LoadError
    STDERR.puts 'You are missing a library required for Markdown. Please run:'
    STDERR.puts '  $ [sudo] gem install kramdown'
    raise FatalException.new("Missing dependency: kramdown")
  end

  def convert(i)
    # inline math
    i = i.gsub(/\$(.*?)\$/m) {|j| "{::nomarkdown}#{j}{:/}"}

    # display math
    i = i.gsub(/\\\[\s+(.*?)\s+\\\]/m){|j| "{::nomarkdown}#{j}{:/}"}

    # environments
    [["definition", "Definition"],
     ["definitions", "Definitions"],
     ["example", "Example"],
     ["examples", "Examples"],
     ["lemma", "Lemma"],
     ["proof", "Proof"],
     ["proposition", "Proposition"],
     ["remark", "Remark"],
     ["remarks", "Remarks"],
     ["theorem", "Theorem"]].each do |e|
      t = Regexp.quote(e[0])
      i = i.gsub(/\\begin\{#{t}\}\s*(.*?)\s*\\end\{#{t}\}/m,
                 "<div class=\"environment #{e[0]}\">\n\#\#\#\#\#\##{e[1]}\n\\1\n</div>")
    end
    
    Kramdown::Document.new(i, :auto_ids => false, :parse_block_html => true).to_html
  end
end
