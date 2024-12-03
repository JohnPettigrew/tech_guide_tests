module Pages
  def product_page(product_name:)
    @product_page ||= ProductPage.new(product_name: product_name)
  end

  class ProductPage < TestEvolve::Core::PageObject
    attr_reader :url

    element(:page_heading) { h1(class: /_productName_/, text: 'Parkinson’s ON') }
    element(:price_band_tag) { dl(class: /_productTags_/) dd(class: /_productPriceRating_/) }
    element(:company_name) { p(class: /_companyName_/) a.text }
    element(:last_updated_date) { p(class: /_updatedDate_/) }
    element(:product_description) { p(class: /_productDescription_/) }
    element(:overview_heading) { h2(text: 'Features') }

    def initialize(product_name: nil)
      @url = "#{TestEvolve.environment['root_url']}catalogue/#{product_name.to_s}"
    end
    
    def visit
      goto @url
    end

    def wait_for_page_load
      overview_heading.wait_until(&:exists?)
    end

    def scan_for_accessibility
      TestEvolve.audit('product_page')
    end

  end
end
