module Jekyll

  class TagGenerator < Generator
    safe true
    
    def generate(site)
      paginate(site, 'all')
      site.tags.keys.each do |tag|
        paginate(site, tag)
      end
    end

    def paginate(site, tag)
      posts = (tag == 'all') ? site.posts : site.tags[tag]
      posts = posts.find_all { |p| !p['hidden'] }
      posts.sort_by! {|p| -p.date.to_f}
      num_pages = TagPager.calculate_pages(posts, site.config['paginate'].to_i)
      
      (1..num_pages).each do |num_page|
        pager = TagPager.new(site, num_page, posts, tag, num_pages)
        dir = pager.paginate_dir(site, num_page)
        page = TagPage.new(site, site.source, dir, tag)
        page.data['section'] = 'other'
        if num_page == 1 and site.config['nav_tags'].include?(tag)
          page.data['in-nav'] = true
        end
        page.pager = pager
        site.pages << page
      end
    end
  end

  class TagPage < Page
    def initialize(site, base, dir, tag)
      @site = site
      @base = base
      @dir = dir
      @name = 'index.html'

      self.process(@name)
      self.read_yaml(File.join(base, '_layouts'), 'post-list.html')
      self.data['tag'] = tag
      self.data['title'] = TagPage.capitalize_first(tag)
    end

    def self.capitalize_first(x)
      y = x.dup
      y[0] = y[0].upcase
      y
    end
  end

  class TagPager < Jekyll::Paginate::Pager 
    attr_reader :tag

    def initialize(site, page, all_posts, tag, num_pages = nil)
      @tag = tag
      super site, page, all_posts, num_pages
      @root = paginate_root()
      @previous_page_path = paginate_path(site, @previous_page)
      @next_page_path = paginate_path(site, @next_page)
    end
    
    alias_method :original_to_liquid, :to_liquid

    def to_liquid
      liquid = original_to_liquid
      liquid['tag'] = @tag
      liquid['root'] = @root
      liquid
    end

    def paginate_path(site, num_page)
      return nil if num_page.nil?
      Jekyll::Paginate::Pager.ensure_leading_slash(paginate_dir(site, num_page))
    end

    def paginate_dir(site, num_page)
      return @root if num_page <= 1
      format = File.join(@root, site.config['paginate_path'])
      unless format.include?(":num")
        raise ArgumentError.new("Invalid pagination path: '#{format}'. It must include ':num'.")
      end
      format.sub(':num', num_page.to_s)
    end

    def paginate_root()
      return 'all' if @tag == 'all'
      slug = @tag.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
      "tag/#{slug}"
    end
  end

end
