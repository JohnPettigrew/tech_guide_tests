module Pages
  def home_page
    @home_page ||= HomePage.new
  end

  class HomePage < TestEvolve::Core::PageObject
    element(:hero_title) { h1(class: /_heroHeading_/) }
    element(:hero_text) { p(class: /_heroText_/) }
    element(:hero_image) { img(class: /_heroImage_/) }
    element(:hero_cta) { a(class: /_heroCta_/) }
    element(:content_wrapper) { section(class: /_wrapper_/) }
    # -- Flare Test Recorder --
    # https://www.testevolve.com/element-capture

    def visit
      goto TECH_GUIDE_URL
    end

    def heading2(text)
      TE.browser.h2(text: text)
    end

    def subheading(text)
      TE.browser.h3(text: text)
    end

    def text_block(text)
      content_wrapper.p(text: text)
    end

    def latest_review_list
      TE.browser.ol(class: /_resultsList_/)
    end

    def latest_review_card
      TE.browser.article(data_cy: "product-card")
    end

    def latest_product_list
      TE.browser.div(class: /_products_/).ul
    end
  end
end
