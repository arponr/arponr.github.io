module Jekyll
  class TagIndex < Page
    def initialize(site, base, dir, tag)
      @site = site
      @base = base
      @dir = dir
      @name = 'index.html'
      self.process(@name)
      self.read_yaml(File.join(base, '_layouts'), 'post-list.html')
      self.data['tag'] = tag
      self.data['title'] = tag.capitalize
      if site.config['nav_tags'].include?(tag)
        self.data['in-nav'] = true
      end
    end
  end
  class TagGenerator < Generator
    safe true
    def generate(site)
      dir = 'tag'
      site.tags.keys.each do |tag|
        slug = tag.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
        site.pages << TagIndex.new(site, site.source, File.join(dir, slug), tag)
      end
    end
  end
end
