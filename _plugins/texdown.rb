module Jekyll
  class TeXdown < Converter
    safe true
    priority :low

    def matches(ext)
      ext =~ /^\.td$/i
    end

    def output_ext(ext)
      ".html"
    end

    def initialize(config)
      require 'kramdown'
    rescue LoadError
      STDERR.puts 'You are missing a library required for Markdown. Please run:'
      STDERR.puts '  $ [sudo] gem install kramdown'
      raise FatalException.new("Missing dependency: kramdown")
    end

    def convert(input)
      output = texdown(input)
      
      # inline math
      breaks = ["\\to", "\\iso", "\\subset", "\\subseteq", "\\supset", "\\supseteq"]
      output = output.gsub(/([^\$])(\$[^\$]+\$)([^\$])/m) do
        left, math, right = $1, $2, $3
        math = math.gsub(/(\s+#{Regexp.union(breaks)})\s+([^\$])/m, "\\1$ $\\2")
        "#{left}{::nomarkdown}#{math}{:/}#{right}"
      end

      # display math
      output = output.gsub(/\$\$[^\$]+\$\$/m) do |math|
        "{::nomarkdown}\n#{math}\n{:/}"
      end

      return Kramdown::Document.new(output, :auto_ids => false, :parse_block_html => true).to_html
    end

    def texdown(input)
      processed, tag_hash = texdown_process(input, "", 0, Hash.new("???"))
      output = processed.gsub(/#([\w-]+)/) do
        "<a href=\"\##{$1}\" class=\"ref\">[#{tag_hash[$1]}]</a>"
      end
      return output
    end

    @@texdown_re = %r{
      (?:
        \$\$\s*(?:\#([\w-]+))([^\$]+)\$\$
      )
      |
      (?:
        ^((?:---)|(?:~~~)) \ *   # "---" starts environment, "~~~" starts enumerate
        (?:                      # meta info:
          ([\w\-\ \(\)]*)?        # - title (e.g. Theorem)
          (?:\[([\w\-]*)\])? \ *  # - tag  (e.g. #hilbert-basis)
        )                            
        (                        # body:
          (?:.*)?                # - possible first line
          (?:(?:\ {4}.*)|\n)*    # - lines indented by 4 spaces
        )
      )
    }x

    def texdown_process(input, label_pre, label_ind, tag_hash)
      output = input.gsub(@@texdown_re) do
        eq_tag, eq_inner, dashes, title, tag, inner = [$1, $2, $3, $4, $5, $6].map do |x|
          (x.nil? || x.empty?) ? nil : x.strip()
        end
        eq = !eq_tag.nil?
        enum = dashes == "~~~"
        
        label = label_pre.dup

        if eq
          label_ind += 1
          label << "#{label_ind}"
          tag_hash[eq_tag] = label.dup
          next build_equation(eq_tag, eq_inner, label)
        end

        if !tag.nil? or enum
          label_ind += 1
          label << "#{label_ind}"
          tag_hash[tag] = label.dup if !tag.nil?
        end

        stripped = inner.gsub(/^\ {4}/, "")
        
        if enum
          next build_enumerate(title, tag, stripped, label)
        end
       
        next_pre = tag.nil? ? label_pre : "#{label}."
        next_ind = tag.nil? ? label_ind : 0
        body, tag_hash = texdown_process(stripped, next_pre, next_ind, tag_hash)
        build_environment(title, tag, body.strip(), label)
      end
      
      return output, tag_hash
    end

    def build_environment(title, tag, body, label)
      output = "<div class=\"environment\""
      output << " id=\"#{tag}\" " if !tag.nil?
      output << ">\n"
      output << "<div class=\"environment__body\">\n"
      output << "<div class=\"environment__header\">\n"
      output << "{::nomarkdown}#{label}. {:/}" if !tag.nil?
      output << "#{title}." if !title.nil?
      output << "\n</div>\n"
      output << "#{body}\n</div>\n</div>\n"
      return output
    end

    def build_enumerate(title, tag, body, label)
      output = "<div class=\"enumerate\""
      output << " id=\"#{tag}\" " if !tag.nil?
      output << ">\n"
      output << "<div class=\"enumerate__label\">\n"
      output << "{::nomarkdown}(#{label}){:/}"
      output << "\n</div>\n"
      output << "<div class=\"enumerate__body\">\n"
      output << "<div class=\"enumerate__header\">\n"
      output << "#{title}." if !title.nil?
      output << "\n</div>\n"
      output << "#{body}\n</div>\n</div>\n"
      return output
    end

    def build_equation(tag, inner, label)
      output =  "{::nomarkdown}<span id=#{tag}></span>{:/}\n\n" # two newlines is imperative
      output << "\$\$\n"
      output << "\\tag{#{label}}\n"
      output << inner
      output << "\$\$\n"
    end
  end
end

