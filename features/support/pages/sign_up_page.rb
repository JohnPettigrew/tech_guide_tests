module Pages
  def sign_up_page
    @sign_up_page ||= SignUpPage.new
  end

  class SignUpPage < TestEvolve::Core::PageObject
    attr_reader :url, :random_email, :random_password

    element(:page_heading) { h1(text: 'Create your account') } 
    element(:email_field) { text_field(name: 'emailAddress') }
    element(:password_field) { text_field(name: 'password') }
    element(:continue_button) { button(text: 'Sign up') }
    element(:password_short_message) { p(text: 'Your password must contain 8 or more characters.') }

    def initialize
      @url = "#{TestEvolve.environment['root_url']}account/register"
      random = RandomGenerator.new
      @random_email = random.email
      @random_password = random.password
    end
    
    def visit
      goto @url
    end

    def wait_for_page_load
      page_heading.wait_until(&:exists?)
    end

    def scan_for_accessibility
      TestEvolve.audit('sign_up_page')
    end
  end
end
