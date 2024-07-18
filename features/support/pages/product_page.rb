module Pages
  def product_page
    @product_page ||= ProductPage.new
  end

  class ProductPage < TestEvolve::Core::PageObject
    element(:trusted_review_heading) { h2(text: "Trusted Review") }
    # -- Flare Test Recorder --
    # https://puk-tech-guide.vercel.app/catalogue

    def visit
      goto CATALOGUE_URL
    end

  end
end
