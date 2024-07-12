module Pages
  def home_page
    @home_page ||= HomePage.new
  end

  class HomePage < TestEvolve::Core::PageObject
    element(:hero_title) { h1(class: /_heroHeading_/) }
    element(:hero_text) { p(class: /_heroText_/) }
    element(:hero_image) { img(class: /_heroImage_/) }
    element(:hero_cta) { a(class: /_heroCta_/) }
    # -- Flare Test Recorder --
    # https://www.testevolve.com/element-capture

    def visit
      goto TECH_GUIDE_URL
    end
  end
end
