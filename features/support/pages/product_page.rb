module Pages
  def product_page
    @product_page ||= ProductPage.new
  end

  class ProductPage < TestEvolve::Core::PageObject
    product_urls = {
      parkinsons_on: '',
      cue1plus: '' 
    }
    element(:trusted_review_heading) { h2(text: "Trusted Review") }
    # -- Flare Test Recorder --
    # https://puk-tech-guide.vercel.app/catalogue

    def visit(product_name: nil)
      if product_name.nil? 
        goto CATALOGUE_URL
      else 
        goto product_urls[product_name.to_sym]
      end
    end

    def wait_for_page_load(product_name:)
      TestEvolve.browser.h1(text: product_name).wait_until(&:exists?)
    end

    def scan_for_accessibility
      TestEvolve.audit('product_page')
    end

  end
end
