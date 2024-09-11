module Pages
  def profile_page
    @profile_page ||= ProfilePage.new
  end

  class ProfilePage < TestEvolve::Core::PageObject
    attr_reader :url
    element(:page_heading) { h1(text: 'Account') }
    element(:profile_tab_label) { button(text: 'Profile') }
    element(:profile_tab_label_active?) { button(text: 'Profile', data_active: 'true') }
    element(:profile_section_heading) { h1(text: 'Profile details') }
    element(:security_tab_label) { button(text: 'Security') }
    element(:security_tab_label_active?) { button(text: 'Security', data_active: 'true') }
    element(:security_section_heading) { h1(text: 'Security') }
    element(:subscription_tab_label) { button(text: 'Subscriptions') }
    element(:subscription_tab_label_active?) { button(text: 'Subscriptions', data_active: 'true') }
    element(:email_checkbox) { input(name: 'subscribeEmail') }
    element(:print_checkbox) { input(name: 'subscribePost') }
    element(:subscription_section_heading) { h1(text: /Subscription preferences/i) }
    element(:subscription_section_save_button) { button(text: 'Save') }
    # -- Flare Test Recorder --

    def initialize
      @url = "#{TestEvolve.environment['root_url']}account"
    end
    
    def visit
      goto @url
    end

    def wait_for_page_load
      TestEvolve.browser.h1(text: 'Account').wait_until(&:exists?)
    end

    def scan_for_accessibility
      TestEvolve.audit('profile_page')
    end
  end
end
