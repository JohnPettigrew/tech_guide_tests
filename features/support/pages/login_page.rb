module Pages
  def login_page
    @login_page ||= LoginPage.new
  end

  class LoginPage < TestEvolve::Core::PageObject
    attr_reader :url

    element(:page_heading) { h1(text: 'Sign in to Parkinson\'s UK Tech Guide') } 
    element(:email_field) { text_field(id: 'identifier-field') }
    element(:password_field) { text_field(id: 'password-field') }
    element(:continue_button) { button(text: 'Continue') }

    def initialize
      @url = "#{TestEvolve.environment['root_url']}account/login"
    end
    
    def visit
      goto @url
    end

    def wait_for_page_load
      page_heading.wait_until(&:exists?)
    end

    def scan_for_accessibility
      TestEvolve.audit('login_page')
    end
  end
end
