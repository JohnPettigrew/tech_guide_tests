require 'debug'

module Pages
  def global_navbar
    @global_navbar ||= GlobalNavbar.new
  end

  class GlobalNavbar < TestEvolve::Core::PageObject
    element(:content) { header.div(class: /content/) }
    element(:logo) { header.a(data_cy: 'logo').svg }
    element(:menu) { header.nav(data_cy: 'nav-links') }
    element(:home_link) { header.nav(data_cy: 'nav-links').a(href: '/') }
    element(:home_link_highlighted) { header.nav(data_cy: 'nav-links').a(href: '/', class: /isActive/) }
    element(:catalogue_link) { header.nav(data_cy: 'nav-links').a(href: '/catalogue') }
    element(:catalogue_link_highlighted) { header.nav(data_cy: 'nav-links').a(href: '/catalogue', class: /isActive/) }
    element(:learn_link) { header.nav(data_cy: 'nav-links').a(href: '/learn') }
    element(:learn_link_highlighted) { header.nav(data_cy: 'nav-links').a(href: '/learn', class: /isActive/) }
    element(:help_link) { header.nav(data_cy: 'nav-links').a(href: '/help') }
    element(:help_link_highlighted) { header.nav(data_cy: 'nav-links').a(href: '/help', class: /isActive/) }
    element(:main_puk_button) { header.nav(data_cy: 'nav-links').li(class: /pukLink/) }
    element(:main_puk_button_link) { header.nav(data_cy: 'nav-links').li(class: /pukLink/).a.href }
    element(:log_in_button) { header.nav(data_cy: 'nav-links').a(text: /Log\s?in/i) }
    element(:sign_up_button) { header.nav(data_cy: 'nav-links').a(text: /Sign up/i) }
    element(:sign_out_button) { header.nav(data_cy: 'nav-links').button(text: /Sign out/i) }
    element(:my_profile_button) { header.nav(data_cy: 'nav-links').a(text: /My profile/i) }

    def visit
      raise "You can't visit the global navbar as a page object"
    end
  end
end
