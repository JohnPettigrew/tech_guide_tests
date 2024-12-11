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
    element(:features_heading) { div(id: 'overview').h2 }
    element(:features_items) { div(id: 'overview').lis }
    element(:features_categories_subheading) { div(id: 'overview').h3(text: 'Categories') }
    element(:features_categories_first_row_heading) { div(id: 'overview').divs(class: /_row_/).first.strong.text }
    element(:features_categories_first_row_value)  { div(id: 'overview').divs(class: /_row_/).first.ul.li.text }
    element(:features_categories_second_row_heading) { div(id: 'overview').divs(class: /_row_/)[1].strong.text }
    element(:features_categories_second_row_values)  { div(id: 'overview').divs(class: /_row_/)[1].ul.lis }
    element(:panel_review_heading) { div(id: 'trustedReviews').h2 }
    element(:panel_review_subheadings) { div(id: 'trustedReviews').h3s }
    element(:highs_items) { div(id: 'trustedReviews').section(class: /_summary_/).uls.first.lis }
    element(:lows_items) { div(id: 'trustedReviews').section(class: /_summary_/).uls[1].lis }
    element(:read_full_review_link) { div(id: 'trustedReviews').div(class: /_footer_/).a.href }
    element(:read_time) { div(id: 'trustedReviews').div(class: /_footer_/).div(class: /_readTime_/).text }
    element(:community_views_heading) { div(id: 'communityViews').h2(text: 'Community views') }
    element(:share_your_view_log_in_link) { div(id: 'communityViews').div(class: /_noticeText_/).a(text: 'log in') }
    element(:share_your_view_sign_up_link) { div(id: 'communityViews').div(class: /_noticeText_/).a(text: /create/) }
    element(:share_your_view_button) { div(id: 'communityViews').button(text: 'Share your view') }
    element(:learn_more_heading) { div(id: 'learnMore').h2 }
    element(:learn_more_articles) { div(id: 'learnMore').h3s }
    element(:learn_more_article_links) { div(id: 'learnMore').as }
    element(:questions_heading) { div(id: 'commonQuestions').h2 }
    element(:questions_question_names) { div(id: 'commonQuestions').h3s }

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
