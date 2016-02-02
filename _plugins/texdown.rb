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

    @@inline_math_breaks = [
      "\\to",
      "\\iso",
      "\\subset",
      "\\subseteq",
      "\\supset",
      "\\supseteq",
    ]
    @@inline_math_re = /([^\$])(\$[^\$]+\$)([^\$])/m
    @@display_math_re = /\$\$[^\$]+\$\$/m
    
    def convert(input)
      output = texdown(input)
      
      # inline math
      output = output.gsub(@@inline_math_re) do
        left, math, right = $1, $2, $3
        # math = math.gsub(/(\s+#{Regexp.union(@@inline_math_breaks)})\s+([^\$])/m, "\\1$ $\\2")
        "#{left}{::nomarkdown}#{math}{:/}#{right}"
      end

      # display math
      output = output.gsub(@@display_math_re) do |math|
        "{::nomarkdown}\n#{math}\n{:/}"
      end

      return Kramdown::Document.new(output, :auto_ids => false, :parse_block_html => true).to_html
    end

    def texdown(input)
      processed, tag_hash = texdown_process(input, "", 0, Hash.new("???"))
      output = processed.gsub(/(\s)\@([\w\-]*)/) do
        "#{$1}<a href=\"\##{$1}\" class=\"ref\">[#{tag_hash[$2]}]</a>"
      end
      return output
    end

    @@environment_re = %r{
      (?:
        \$\$\s*                
        (?:\[([\w-]*)\])([^\$]+)  # labeled equation
        \$\$
      )
      |
      (?:
        ^((?:---)|(?:~~~)) \ *    # "---" starts environment, "~~~" starts enumerate
        (?:                       # meta info:
          ([\w\-\ \(\)]*)?        # - title (e.g. Theorem)
          (?:\[([\w\-]*)\])? \ *  # - tag  (e.g. #hilbert-basis)
        )                            
        (                         # body:
          (?:.*)                  # - possible first line
          (?:(?:\ {4}.*)|\n)*     # - lines indented by 4 spaces
        )
      )
    }x

    def texdown_process(input, label_pre, label_ind, tag_hash)
      output = input.gsub(@@environment_re) do
        eq_tag, eq_body, dashes, title, tag, body = [$1, $2, $3, $4, $5, $6].map do |x|
          (x.nil? || x.empty?) ? nil : x.strip()
        end
        
        is_eq = !eq_tag.nil?
        is_enum = dashes == "~~~"
        
        label = label_pre.dup

        if is_eq
          label_ind += 1
          label << "#{label_ind}"
          tag_hash[eq_tag] = label.dup
          next build_equation(eq_tag, eq_body, label)
        end

        if !tag.nil? or is_enum
          label_ind += 1
          label << "#{label_ind}"
          tag_hash[tag] = label.dup if !tag.nil?
        end

        body = body.gsub(/^\ {4}/, "") if !body.nil?
        
        if is_enum
          next build_enumerate(title, tag, body, label)
        end
       
        next_pre = tag.nil? ? label_pre : "#{label}."
        next_ind = tag.nil? ? label_ind : 0
        body, tag_hash = texdown_process(body, next_pre, next_ind, tag_hash)
        build_environment(title, tag, body, label)
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
      output << "#{body}\n</div>\n</div>\n\n"
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
      output << "#{body}\n</div>\n</div>\n\n"
      return output
    end

    def build_equation(tag, body, label)
      output =  "{::nomarkdown}<span id=#{tag}></span>{:/}\n\n" # two newlines is imperative
      output << "\$\$\n"
      output << "\\tag{#{label}}\n"
      output << body
      output << "\$\$\n\n"
    end
  end
end

