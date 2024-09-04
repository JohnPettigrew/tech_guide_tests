module Pages
  def home_page
    @home_page ||= HomePage.new
  end

  class HomePage < TestEvolve::Core::PageObject
    element(:newsletterLink) { a(href: "#newsletter") }
    element(:whatsnewLink) { a(href: "#whatsNew") }
    element(:stylesHeadingFrjur) { h2(class: "styles_heading__FRJUr") }
    element(:whatsnewLink) { a(href: "#whatsNew") }
    element(:keybenefitsLink) { a(href: "#keyBenefits") }
    element(:newsletterLink) { a(href: "#newsletter") }
    element(:whatsnewLink) { a(href: "#whatsNew") }
    element(:keybenefitsLink) { a(href: "#keyBenefits") }
    element(:stylesTitleAql9o) { h3(class: "styles_title__aqL9O") }
    element(:stylesContentM6jixDiv) { div(class: "styles_content__m6jIx") }
    element(:stylesHeadingBlht) { h2(class: "styles_heading__bLHt_") }
    element(:stylesHeadingW8dw0) { h2(class: "styles_heading__W8DW0") }
    attr_accessor :recent_product_name, :recent_product_url
    element(:hero_section) { section(class: /_hero_/) }
    element(:hero_title) { section(class: /_hero_/).h1(class: /_heroHeading_/) }
    element(:hero_text) { section(class: /_hero_/).p(class: /_heroText_/) }
    element(:hero_image) { section(class: /_hero_/).img(class: /_heroImage_/) }
    element(:hero_cta) { section(class: /_hero_/).a(class: /_heroCta_/) }
    element(:content_wrapper) { section(class: /_wrapper_/) }
    element(:benefits_section) { section(id: 'keyBenefits') }
    element(:whats_new_section) { section(id: 'whatsNew') }
    element(:latest_review_list) { section(id: 'whatsNew').ol(class: /_resultsList_/) }
    element(:latest_review_card) { section(id: 'whatsNew').ol(class: /_resultsList_/).article(data_cy: 'product-card') }
    element(:latest_review_card_name) { section(id: 'whatsNew').ol(class: /_resultsList_/).article(data_cy: 'product-card').h4.text }
    element(:latest_review_card_link) { section(id: 'whatsNew').ol(class: /_resultsList_/).a(data_cy: 'product-info-link').href }
    element(:latest_product_list) { section(id: 'whatsNew').div(class: /_products_/).ul }
    element(:latest_product_card) { section(id: 'whatsNew').div(class: /_products_/).ul.li.a }
    element(:newsletter_section) { section(id: 'newsletter') }
    # -- Flare Test Recorder --
  # https://techguide.parkinsons.org.uk/#newsletter
  # https://techguide.parkinsons.org.uk/#whatsNew
  # https://techguide.parkinsons.org.uk/
    # https://www.testevolve.com/element-capture

    def visit
      goto TECH_GUIDE_URL
    end

    def wait_for_page_load
      TestEvolve.browser.h1(text: 'Welcome to the Parkinson’s UK Tech Guide').wait_until(&:exists?)
    end

    def heading2(text)
      TE.browser.h2(text: text)
    end

    def subheading(text)
      TE.browser.h3(text: text)
    end

    def text_block_starting_with(text)
      content_wrapper.p(text: /\A#{text}/)
    end
  end
end

