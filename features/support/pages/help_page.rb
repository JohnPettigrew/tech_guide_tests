module Pages
  def help_page
    @help_page ||= HelpPage.new
  end

  class HelpPage < TestEvolve::Core::PageObject
    attr_reader :url
    # -- Flare Test Recorder --
    # https://techguide.parkinsons.org.uk/help
    # https://www.testevolve.com/element-capture

    def initialize
      @url = "#{TestEvolve.environment['root_url']}help"
    end
    
    def visit
      goto @url
    end

    def wait_for_page_load
      TestEvolve.browser.h1(text: 'Help and support for the Tech Guide').wait_until(&:exists?)
    end

    def scan_for_accessibility
      TestEvolve.audit('help_page')
    end
  end
end
