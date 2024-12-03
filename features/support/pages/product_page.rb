module Pages
  def product_page(product_name:)
    @product_page ||= ProductPage.new(product_name: product_name)
  end

  class ProductPage < TestEvolve::Core::PageObject
    attr_reader :url

    element(:page_heading) { h1(class: /_productName_/) }
    element(:back_button) { nav(class: /_navWrapper_/).button(text: 'Go back') }
    element(:breadcrumbs) { nav(class: /_navWrapper_/).lis  }
    element(:price_band_tag) { dl(class: /_productTags_/).dd(class: /_productPriceRating_/) }
    element(:company_name) { p(class: /_companyName_/).a.text }
    element(:last_updated_date) { p(class: /_updatedDate_/) }
    element(:product_description) { div(class: /_productDescription_/) }
    element(:image_gallery) { section(class: /_galleryWrapper_/) }
    element(:main_gallery_image) { section(class: /_galleryWrapper_/).button(class: /_activeImageWrapper_/) }
    element(:desktop_gallery_thumbnails) { section(class: /_desktopThumbnails_/).buttons(class: /_thumbButton_/) }
    element(:buy_button) { ul(class: /_productLinks_/).a(class: /_productLink_/) }
    element(:in_page_navbar) { nav(aria_label: 'On this page') }
    element(:in_page_navbar_items) { nav(aria_label: 'On this page').nav(id: 'on-this-page-sections').as }
    element(:features_heading) { div(id: 'overview').h2(text: 'Features') }
    element(:features_items) { div(id: 'overview').lis }
    element(:features_categories_subheading) { div(id: 'overview').h3(text: 'Categories') }
    element(:features_categories_first_row_heading) { div(id: 'overview').divs(class: /_row_/).first.strong.text }
    element(:features_categories_first_row_value)  { div(id: 'overview').divs(class: /_row_/).first.ul.li }
    element(:features_categories_second_row_heading) { div(id: 'overview').divs(class: /_row_/)[1].strong.text }
    element(:features_categories_second_row_values)  { div(id: 'overview').divs(class: /_row_/)[1].ul.lis }

    def initialize(product_name: nil)
      @url = "#{TestEvolve.environment['root_url']}catalogue/#{product_name.to_s}"
    end
    
    def visit
      goto @url
    end

    def wait_for_page_load
      page_heading.wait_until(&:exists?)
    end

    def scan_for_accessibility
      TestEvolve.audit('product_page')
    end

  end
end
