module Pages
  def cookie_banner
    @cookie_banner ||= CookieBanner.new
  end

  class CookieBanner < TestEvolve::Core::PageObject
    element(:accept_button) { div(class: /_consentBanner_/).button(name: 'accept') }
    element(:reject_button) { div(class: /_consentBanner_/).button(name: 'reject') }

    def wait_until_present(button)
      button.wait_until(&:exists?)
      button
    end
  end
end
