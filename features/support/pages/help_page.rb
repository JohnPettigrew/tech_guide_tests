module Pages
  def help_page
    @help_page ||= HelpPage.new
  end

  class HelpPage < TestEvolve::Core::PageObject
    element(:submitSearchButton) { button(name: "submit-search") }
    element(:qTextField) { text_field(name: "q") }
    element(:hero_title) { h1(text: 'Help and support for the Tech Guide') }
    element(:hero_text) { sections.first.ps }
    element(:search_field) { input(data_cy: 'search-input') }
    element(:search_button) { button(name: 'submit-search') }
    element(:search_filter_pills) { as(data_cy: 'active-filter') }
    element(:section_1) { div(id: 'what-is-tech-guide') }
    element(:section_1_articles) { div(id: 'what-is-tech-guide').articles(data_cy: 'policy-card') }
    element(:section_1_first_link) { div(id: 'what-is-tech-guide').as(class: /_outerWrapper_/).first }
    element(:section_2) { div(id: 'how-to-use') }
    element(:section_2_articles) { div(id: 'how-to-use').articles(data_cy: 'policy-card') }
    element(:section_3) { div(id: 'policies') }
    element(:section_3_articles) { div(id: 'policies').articles(data_cy: 'policy-card') }
    element(:search_results) { ol(data_cy: 'policies-results').as(class: /_outerWrapper_/) }

    attr_reader :url
    # -- Flare Test Recorder --
    # https://techguide.parkinsons.org.uk/help

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
