module Pages
  def help_page
    @help_page ||= HelpPage.new
  end

  class HelpPage < TestEvolve::Core::PageObject
    # -- Flare Test Recorder --
    # https://www.testevolve.com/element-capture

    def visit
      goto HELP_URL
    end
  end
end
