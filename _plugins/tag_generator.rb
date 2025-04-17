module Jekyll
    class TagPageGenerator < Generator
      safe true
      
      def generate(site)
        # Collect all unique tags
        all_tags = []
        
        site.posts.docs.each do |post|
          if post.data['tags']
            # Handle both array and space-separated string formats
            tags = post.data['tags'].is_a?(Array) ? post.data['tags'] : post.data['tags'].split(' ')
            all_tags.concat(tags)
          end
        end
        
        all_tags.uniq!
        
        # Create a page for each tag
        all_tags.each do |tag|
          site.pages << TagPage.new(site, tag)
        end
      end
    end
    
    class TagPage < Page
      def initialize(site, tag)
        @site = site
        @base = site.source
        @dir = 'tags'
        @name = "#{tag.downcase.gsub(' ', '-')}.html"
        
        self.process(@name)
        self.read_yaml(File.join(@base, '_layouts'), 'tag.html')
        self.data['tag'] = tag
        self.data['title'] = "Posts tagged with #{tag}"
      end
    end
  end