module Pages
  def catalogue_page
    @catalogue_page ||= CataloguePage.new
  end

  class CataloguePage < TestEvolve::Core::PageObject
    # -- Flare Test Recorder --
    # https://puk-tech-guide.vercel.app/catalogue

    def visit
      goto CATALOGUE_URL
    end

    def wait_for_page_load
      TestEvolve.browser.h1(text: 'Explore the catalogue').wait_until(&:exists?)
    end

    def scan_for_accessibility
      TestEvolve.audit('catalogue_page')
    end

  end
end
