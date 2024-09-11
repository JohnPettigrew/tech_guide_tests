module Pages
  def profile_page
    @profile_page ||= ProfilePage.new
  end

  class ProfilePage < TestEvolve::Core::PageObject
    attr_reader :url
    element(:profile_tab_label) { button(text: 'Profile') }
    element(:security_tab_label) { button(text: 'Security') }
    element(:subscription_tab_label) { button(text: 'Subscriptions') }
    element(:email_checkbox) { input(name: 'subscribeEmail') }
    element(:print_checkbox) { input(name: 'subscribePost') }
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
