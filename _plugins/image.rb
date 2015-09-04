# stolen from Dan Eden
module Jekyll
  class ImageTag < Liquid::Tag
    @url = nil
    @caption = nil
    @class = nil

    IMAGE_URL_WITH_CLASS_AND_CAPTION = /(\w+)(\s+)([^\s]+)(\s+)"(.*?)"/i
    IMAGE_URL_WITH_CAPTION = /([^\s]+)(\s+)"(.*?)"/i
    IMAGE_URL_WITH_CLASS = /(\w+)(\s+)([^\s]+)/i
    IMAGE_URL = /([^\s]+)/i

    def initialize(tag_name, markup, tokens)
      super
      if markup =~ IMAGE_URL_WITH_CLASS_AND_CAPTION
        @class   = $1
        @url     = $3
        @caption = $5
      elsif markup =~ IMAGE_URL_WITH_CAPTION
        @url     = $1
        @caption = $3
      elsif markup =~ IMAGE_URL_WITH_CLASS
        @class = $1
        @url   = $3
      elsif markup =~ IMAGE_URL
        @url = $1
      end
    end

    def render(context)
      source = "<figure"
      if @class
        source += " class=\"#{@class}\""
      end
      source += ">\n"
      source += "<img src=\"#{@url}\"/>\n"
      if @caption
        @caption = Kramdown::Document.new(@caption).to_html 
        source += "<figcaption>#{@caption}</figcaption>\n"
      end
      source += "</figure>\n"
      return source
    end
  end
end

Liquid::Template.register_tag('image', Jekyll::ImageTag)
