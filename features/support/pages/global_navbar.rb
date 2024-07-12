module Pages
  def global_navbar
    @global_navbar ||= GlobalNavbar.new
  end

  class GlobalNavbar < TestEvolve::Core::PageObject
    # element(:logo) { svg(xpath: "body/header[1]/div[1]/a[1]/svg[1]") }
    element(:main_puk_button) { a(href: PARKINSONS_UK_URL) }

    def logo
      TE.browser.header.a(data_cy: /logo/)
    end

    def main_puk_link
      TE.browser.header.nav.li(class: /pukLink/)
    end
  end
end
