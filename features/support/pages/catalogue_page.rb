module Pages
  def catalogue_page
    @catalogue_page ||= CataloguePage.new
  end

  class CataloguePage < TestEvolve::Core::PageObject
    attr_reader :url

    element(:hero_title) { h1(text: 'Explore the catalogue') }
    element(:hero_text) { sections.first.ps }
    element(:key_filters) { div(class: /_suggestions_/).ul.lis }
    element(:search_field) { input(data_cy: 'search-input') }
    element(:search_button) { button(name: 'submit-search') }
    element(:filters_button) { button(data_cy: 'filter-results') }
    element(:filters_modal) { dialog(data_cy: 'filter-modal') }
    element(:filters_option_free) { dialog(data_cy: 'filter-modal').fieldset(data_cy: 'facet-price-rating').input(value: 'free') }
    element(:apply_filters_button) { button(text: 'Apply these choices') }
    element(:reset_filters_button) { a(data_cy: 'reset-filters') }
    element(:search_filter_pills) { as(data_cy: 'active-filter') }
    element(:search_filter_pill_labels) { as(data_cy: 'active-filter').map(&:text) }
    element(:results_summary) { aside(class: /_searchResultsHeader_/) }
    element(:product_cards) { ol(data_cy: 'products-results').lis }
    element(:product_card_links) { ol(data_cy: 'products-results').as(data_cy: 'product-info-link').map(&:href) }

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
