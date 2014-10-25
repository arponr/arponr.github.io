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
      breaks = ["\\to", "\\iso"]
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
      processed, tag_hash = texdown_process(input, "", Hash.new("???"))
      output = processed.gsub(/#([\w-]+)/) do
        "<a href=\"\##{$1}\">(#{tag_hash[$1]})</a>"
      end
      return output
    end

    def texdown_process(input, label_prefix, tag_hash)
      index = 0
      output = input.gsub(%r{
        (?:
           \$\$\s*(?:\#([\w-]+))([^\$]+)\$\$
        )
        |
        (?:
           ^--\s*                           # "--" starts environment
           (?:                              # optional environment meta info:
              (.*?)?\s*                     #   - type (e.g. Definition)
              (?:\((.*?)\))?\s*             #   - desc (e.g. Hilbert Basis Thm)
              (?:\#([\w-]+))?               #   - tag  (e.g. #hilbert-basis)
           :)?\s*                           #   - ending with ":"
           (                                # body:
              (?:.*)                        #   - first line
              (?:(?:\n[[:blank:]]+.*)|\n)*  #   - subsequent (indented) lines
           )
        )
      }x) do
        index += 1
        label = "#{label_prefix}#{index}"
        eq_tag, eq_inner, type, desc, tag, inner = [$1, $2, $3, $4, $5, $6, $7].map do |x|
          x.nil? || x.empty? ? nil : x.strip()
        end

        if !eq_tag.nil?
          tag_hash[eq_tag] = label
          next build_equation(eq_tag, eq_inner, label)
        end
        if !tag.nil?
          tag_hash[tag] = label
        end
        stripped = inner.strip().gsub(/^[[:blank:]]{,3}/, "")
        body, tag_hash = texdown_process(stripped, "#{label}.", tag_hash)
        build_environment(type, desc, tag, body.strip(), label)
      end
      return output, tag_hash
    end

    def build_environment(type, desc, tag, body, label)
      output = ""
      output << "<div "
      if !tag.nil?
        output << "id=\"#{tag}\" "
      end
      output << "class=\"environment"
      if !type.nil?
        dashed = type.downcase.gsub(/[[:blank:]]/, "-")
        output << " #{dashed}"
      end
      output << "\">\n"

      output << "<div class=\"environment_label\">\n"
      output << "{::nomarkdown}#{label}.{:/}"
      output << "\n</div>\n"

      output << "<div class=\"environment_body\">\n"
      output << "<div class=\"environment_header\">\n"
      if !type.nil? || !desc.nil?
        if tag == "preimage-injective"
          puts type.length
        end
        if !type.nil?
          output << "#{type}"
        end
        if !desc.nil?
          output << " (#{desc})"
        end
        output << "."
      end
      output << "\n</div>\n"

      output << "#{body}\n</div>\n</div>\n"
      return output
    end

    def build_equation(tag, inner, label)
      output = ""
      output << "{::nomarkdown}<span id=#{tag}></span>{:/}\n\n" # two newlines is imperative
      output << "\$\$\n"
      output << "\\tag{#{label}}\n"
      output << inner
      output << "\$\$\n"
    end
  end
end
