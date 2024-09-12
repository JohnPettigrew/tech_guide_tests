require 'debug'

module Pages
  def global_navbar
    @global_navbar ||= GlobalNavbar.new
  end

  class GlobalNavbar < TestEvolve::Core::PageObject
    element(:content) { header.div(class: /content/) }
    element(:logo) { header.a(data_cy: 'logo').svg }
    element(:menu) { header.nav(data_cy: 'nav-links') }
    element(:menu_entry_1) { header.nav(data_cy: 'nav-links').a(href: '/') }
    element(:menu_entry_2) { header.nav(data_cy: 'nav-links').a(href: '/catalogue') }
    element(:menu_entry_3) { header.nav(data_cy: 'nav-links').a(href: '/learn') }
    element(:menu_entry_4) { header.nav(data_cy: 'nav-links').a(href: '/help') }
    element(:menu_entry_1_highlighted?) { header.nav(data_cy: 'nav-links').a(href: '/', class: /isActive/) }
    element(:menu_entry_2_highlighted?) { header.nav(data_cy: 'nav-links').a(href: '/catalogue', class: /isActive/) }
    element(:menu_entry_3_highlighted?) { header.nav(data_cy: 'nav-links').a(href: '/learn', class: /isActive/) }
    element(:menu_entry_4_highlighted?) { header.nav(data_cy: 'nav-links').a(href: '/help', class: /isActive/) }
    element(:main_puk_button) { header.nav(data_cy: 'nav-links').li(class: /pukLink/) }
    element(:main_puk_button_link) { header.nav(data_cy: 'nav-links').li(class: /pukLink/).a.href }
    element(:log_in_button) { header.nav(data_cy: 'nav-links').li(text: /Log\s?in/i) }
    element(:sign_up_button) { header.nav(data_cy: 'nav-links').li(text: /Sign up/i) }
    element(:sign_out_button) { header.nav(data_cy: 'nav-links').li(text: /Sign out/i) }
    element(:my_profile_button) { header.nav(data_cy: 'nav-links').li(text: /My profile/i) }

    def visit
      raise "You can't visit the global navbar as a page object"
    end
  end
end
