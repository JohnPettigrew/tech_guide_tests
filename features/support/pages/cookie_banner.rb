module Pages
  def cookie_banner
    @cookie_banner ||= CookieBanner.new
  end

  class CookieBanner < TestEvolve::Core::PageObject
    element(:banner) { div(class: /_consentBanner_/) }
    element(:accept_button) { div(class: /_consentBanner_/).button(name: 'accept') }
    element(:reject_button) { div(class: /_consentBanner_/).button(name: 'reject') }
    element(:policy_link) { div(class: /_consentBanner_/).a(href: '/help/cookie-policy') }
    element(:script_tag) { script(id: '_next-pendo-init') }

    def wait_until_present(button)
      button.wait_until(&:exists?)
      button
    end

    def wait_until_closed
      banner.wait_while(&:present?)
    end
  end
end
