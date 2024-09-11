module Pages
  def catalogue_page
    @catalogue_page ||= CataloguePage.new
  end

  class CataloguePage < TestEvolve::Core::PageObject
    attr_reader :url
    # -- Flare Test Recorder --
    # https://puk-tech-guide.vercel.app/catalogue

    def initialize
      @url = "#{TestEvolve.environment['root_url']}catalogue"
    end
    
    def visit
      goto @url
    end

    def wait_for_page_load
      TestEvolve.browser.h1(text: 'Explore the catalogue').wait_until(&:exists?)
    end

    def scan_for_accessibility
      TestEvolve.audit('catalogue_page')
    end

  end
end
