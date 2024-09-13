module Pages
  def catalogue_page
    @catalogue_page ||= CataloguePage.new
  end

  class CataloguePage < TestEvolve::Core::PageObject
    attr_reader :url

    element(:hero_title) { h1(text: 'Explore the catalogue') }

    def initialize
      @url = "#{TestEvolve.environment['root_url']}catalogue"
    end
    
    def visit
      goto @url
    end

    def wait_for_page_load
      hero_title.wait_until(&:exists?)
    end

    def scan_for_accessibility
      TestEvolve.audit('catalogue_page')
    end

  end
end
