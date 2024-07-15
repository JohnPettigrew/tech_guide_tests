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
    element(:menu_entry_1_highlighted) { header.nav(data_cy: 'nav-links').a(href: '/', class: /isActive/) }
    element(:menu_entry_2_highlighted) { header.nav(data_cy: 'nav-links').a(href: '/catalogue', class: /isActive/) }
    element(:menu_entry_3_highlighted) { header.nav(data_cy: 'nav-links').a(href: '/learn', class: /isActive/) }
    element(:menu_entry_4_highlighted) { header.nav(data_cy: 'nav-links').a(href: '/help', class: /isActive/) }
    element(:main_puk_button) { header.nav(data_cy: 'nav-links').li(class: /pukLink/) }
    element(:log_in_button) { header.nav(data_cy: 'nav-links').button(text: /Log\s?in/) }
    element(:sign_up_button) { header.nav(data_cy: 'nav-links').button(text: /Sign up/i) }

    def visit
      goto CATALOGUE_URL
    end
  end
end
