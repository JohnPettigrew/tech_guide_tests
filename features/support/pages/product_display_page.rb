module Pages
  def product_display_page
    @product_display_page ||= ProductDisplayPage.new
  end

  class ProductDisplayPage < TestEvolve::Core::PageObject
    element(:stylesHeadingMwbx6) { h1(class: "styles_heading__MwBX6") }
    # -- Flare Test Recorder --
    # https://puk-tech-guide.vercel.app/catalogue

    def visit
      goto CATALOGUE_URL
    end

  end
end
