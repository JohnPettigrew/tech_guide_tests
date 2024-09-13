module Pages
  def home_page
    @home_page ||= HomePage.new
  end

  class HomePage < TestEvolve::Core::PageObject
    attr_accessor :recent_product_name, :recent_product_url, :recent_product_leafname
    attr_reader :url

    element(:hero_section) { section(class: /_hero_/) }
    element(:hero_title) { section(class: /_hero_/).h1(class: /_heroHeading_/) }
    element(:hero_text) { section(class: /_hero_/).p(class: /_heroText_/) }
    element(:hero_image) { section(class: /_hero_/).img(class: /_heroImage_/) }
    element(:hero_cta) { section(class: /_hero_/).a(class: /_heroCta_/) }
    element(:content_wrapper) { section(class: /_wrapper_/) }
    element(:in_page_navbar) { nav(aria_label: 'On this page') }
    element(:in_page_navbar_title) { nav(aria_label: 'On this page').h3 }
    element(:key_benefits_link) { a(href: '#keyBenefits') }
    element(:whats_new_link) { a(href: '#whatsNew') }
    element(:newsletter_link) { a(href: '#newsletter') }
    element(:benefits_section) { section(id: 'keyBenefits') }
    element(:benefits_section_title) { section(id: 'keyBenefits').h2 }
    element(:benefits_section_subheadings) { section(id: 'keyBenefits').h3s }
    element(:benefits_section_text_blocks) { section(id: 'keyBenefits').ps }
    element(:benefits_section_images) { section(id: 'keyBenefits').images }
    element(:benefits_section_links) { section(id: 'keyBenefits').as }
    element(:whats_new_section) { section(id: 'whatsNew') }
    element(:whats_new_section_title) { section(id: 'whatsNew').h2 }
    element(:whats_new_section_subheadings) { section(id: 'whatsNew').h3s }
    element(:latest_review_list) { section(id: 'whatsNew').ol(class: /_resultsList_/) }
    element(:latest_review_card) { section(id: 'whatsNew').ol(class: /_resultsList_/).article(data_cy: 'product-card') }
    element(:latest_review_card_name) { section(id: 'whatsNew').ol(class: /_resultsList_/).article(data_cy: 'product-card').h4.text }
    element(:latest_review_card_link) { section(id: 'whatsNew').ol(class: /_resultsList_/).a(data_cy: 'product-info-link').href }
    element(:latest_product_list) { section(id: 'whatsNew').div(class: /_products_/).ul }
    element(:latest_product_card) { section(id: 'whatsNew').div(class: /_products_/).ul.li.a }
    element(:newsletter_section) { section(id: 'newsletter') }
    element(:newsletter_section_title) { section(id: 'newsletter').h2 }
    element(:email_address_label) { section(id: 'newsletter').form.label.div(text: 'Email') }
    element(:email_address_field) { section(id: 'newsletter').form.text_field(name: 'emailAddress') }
    element(:password_label) { section(id: 'newsletter').form.label.div(text: 'Password') }
    element(:password_field) { section(id: 'newsletter').form.text_field(name: 'password') }
    element(:email_subscription_checkbox_label) { section(id: 'newsletter').form.span(text: 'Get the email updates') }
    element(:email_subscription_checkbox) { section(id: 'newsletter').form.checkbox(name: 'subscribeEmail') }
    element(:print_subscription_checkbox_label) { section(id: 'newsletter').form.span(text: 'Get the print edition') }
    element(:print_subscription_checkbox) { section(id: 'newsletter').form.checkbox(name: 'subscribePost') }
    element(:signup_button) { section(id: 'newsletter').form.button(type: 'submit') }
    element(:newsletter_signed_up_text) { section(id: 'newsletter').p(text: 'You are now signed in to your account.') }

    def initialize
      @url = TestEvolve.environment['root_url']
    end
    
    def visit
      goto @url
    end

    def wait_for_page_load
      hero_title.wait_until(&:exists?)
    end

    def heading2(text:)
      TE.browser.h2(text: text)
    end

    def scan_for_accessibility
      TestEvolve.audit('home_page')
    end
  end
end

