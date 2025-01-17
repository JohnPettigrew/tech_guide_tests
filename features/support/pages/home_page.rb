module Pages
  def home_page
    @home_page ||= HomePage.new
  end

  class HomePage < TestEvolve::Core::PageObject
    attr_accessor :interesting_product_name, :interesting_product_url
    element(:hero_title) { h1(class: /_heroHeading_/) }
    element(:hero_text) { p(class: /_heroText_/) }
    element(:hero_image) { img(class: /_heroImage_/) }
    element(:hero_cta) { a(class: /_heroCta_/) }
    element(:content_wrapper) { section(class: /_wrapper_/) }
    element(:latest_review_list) { ol(class: /_resultsList_/) }
    element(:latest_review_card) { article(data_cy: 'product-card') }
    element(:latest_review_card_name) { article(data_cy: 'product-card').h4.text }
    element(:latest_review_card_link) { ol(class: /_resultsList_/).a(class: /_outerWrapper_/).href } # Don't really like this because it's different to the way we select the card itself, but I can't get the #parent selector to do anything useful, and the anchor tag is parent to the article. That's how Cygnet have got the link to span the whole card.
    element(:latest_product_list) { div(class: /_products_/).ul }
    element(:latest_product_card) { div(class: /_products_/).ul.li.a }
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

    def text_block_starting_with(text)
      content_wrapper.p(text: /\A#{text}/)
    end
  end
end

