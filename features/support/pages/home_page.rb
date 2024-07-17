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
    element(:benefits_heading) { section(class: /_wrapper_/).h2(class: /_heading_/) }
    # -- Flare Test Recorder --
    # https://www.testevolve.com/element-capture

    def visit
      goto TECH_GUIDE_URL
    end

    def benefits_subheading(text)
      content_wrapper.div(class: /card/).h3(text: text)
    end

    def benefits_text_block(text)
      content_wrapper.div(class: /card/).p(text: text)
    end
  end
end
