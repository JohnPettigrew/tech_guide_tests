module Pages
  def login_page
    @login_page ||= LoginPage.new
  end

  class LoginPage < TestEvolve::Core::PageObject
    element(:email_field) { text_field(id: 'identifier-field') }
    element(:password_field) { text_field(id: 'password-field') }
    element(:continue_button) { button(text: 'Continue') }
    # -- Flare Test Recorder --
  # https://techguide.parkinsons.org.uk/account/login/factor-one
  # https://techguide.parkinsons.org.uk/account/login
    def visit
      goto LOGIN_URL
    end

    def wait_for_page_load
      TestEvolve.browser.h1(text: 'Sign in to Parkinson\'s UK Tech Guide').wait_until(&:exists?)
    end

    def scan_for_accessibility
      TestEvolve.audit('login_page')
    end
  end
end
