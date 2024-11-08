module Pages
  def home_page
    @home_page ||= HomePage.new
  end

  class HomePage < TestEvolve::Core::PageObject
    attr_accessor :recent_product_name, :recent_product_url
    attr_reader :url

    element(:hero_section) { section(class: /_hero_/) }
    element(:hero_title) { section(class: /_hero_/).h1(class: /_heroHeading_/) }
    element(:hero_text) { section(class: /_hero_/).p(class: /_heroText_/) }
    element(:hero_image) { section(class: /_hero_/).imgs(class: /_heroImage_/) }
    element(:hero_cta) { section(class: /_hero_/).a(class: /_heroCta_/) }
    element(:content_wrapper) { section(class: /_wrapper_/) }
    element(:in_page_navbar) { nav(aria_label: 'On this page') }
    element(:in_page_navbar_title) { nav(aria_label: 'On this page').h2 }
    element(:in_page_navbar_explore_link) { a(href: /\#expl?oreCatalogue/) } # Regex on the div class because of a typo currently in the template
    element(:in_page_navbar_whats_new_link) { a(href: '#whatsNew') }
    element(:in_page_navbar_newsletter_link) { a(href: '#newsletter') }
    element(:explore_section) { div(id: /expl?oreCatalogue/) } # Regex on the div class because of a typo currently in the template
    element(:explore_section_title) { div(id: /expl?oreCatalogue/).h2 }
    element(:explore_section_cards) { div(id: /expl?oreCatalogue/).ul(class: /_cardContainer_/).lis }
    element(:explore_section_links) { div(id: /expl?oreCatalogue/).ul(class: /_cardContainer_/).as }
    element(:explore_section_catalogue_link) { div(id: /expl?oreCatalogue/).a(class: /_styledLink_/).href }
    element(:whats_new_section) { section(id: 'whatsNew') }
    element(:whats_new_section_title) { section(id: 'whatsNew').h2 }
    element(:whats_new_cards) { section(id: 'whatsNew').lis(class: /_card_/) }
    element(:whats_new_card_latest) { section(id: 'whatsNew').lis(class: /_card_/).first }
    element(:latest_product_card_name) { section(id: 'whatsNew').lis(class: /_card_/).first.div(class: /_cardTitle_/).text.gsub(/^(New listing|Recent review): /, '') } # Takes just the product-name portion of the card title
    element(:latest_product_card_link) { section(id: 'whatsNew').lis(class: /_card_/).first.a.href }
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

    def recent_product_leafname
      # Strips the first part of the URL off to leave just the product-name part (including the referral to the subsection, if present)
      @recent_product_url["#{TestEvolve.environment['root_url']}catalogue/".length..]
    end

    def scan_for_accessibility
      TestEvolve.audit('home_page')
    end
  end
end

