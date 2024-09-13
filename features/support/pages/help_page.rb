module Pages
  def help_page
    @help_page ||= HelpPage.new
  end

  class HelpPage < TestEvolve::Core::PageObject
    attr_reader :url

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
    element(:transparency_statement_hero_title) { h1(text: 'How do we stay impartial?') }
    element(:transparency_statement_content_summary) { section(class: /_hero_/).p(class: /_summary_/) }
    element(:transparency_statement_content) { section(class: /_hero_/).ps(class: nil) }

    def initialize
      @url = "#{TestEvolve.environment['root_url']}help"
    end
    
    def visit
      goto @url
    end

    def wait_for_page_load
      hero_title.wait_until(&:exists?)
    end

    def wait_for_transparency_statement_page_load
      transparency_statement_hero_title.wait_until(&:exists?)
    end

    def scan_for_accessibility
      TestEvolve.audit('help_page')
    end
  end
end
