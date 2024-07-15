module Pages
  def global_navbar
    @global_navbar ||= GlobalNavbar.new
  end

  class GlobalNavbar < TestEvolve::Core::PageObject
    element(:content) { header.div(class: /content/) }
    element(:logo) { header.a(data_cy: 'logo').svg }
    element(:menu) { header.nav(data_cy: 'nav-links').ul(class: /navList/)[1] }
    element(:menu_entry_1) { header.nav(data_cy: 'nav-links').ul(class: /navList/)[1].li[1] }
    element(:menu_entry_2) { header.nav(data_cy: 'nav-links').ul(class: /navList/)[1].li[2] }
    element(:menu_entry_3) { header.nav(data_cy: 'nav-links').ul(class: /navList/)[1].li[3] }
    element(:menu_entry_4) { header.nav(data_cy: 'nav-links').ul(class: /navList/)[1].li[4] }
    element(:main_puk_button) { header.li(class: /pukLink/) }

    def visit
      goto CATALOGUE_URL
    end
  end
end
