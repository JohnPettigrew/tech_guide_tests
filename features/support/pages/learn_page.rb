module Pages
  def learn_page
    @learn_page ||= LearnPage.new
  end

  class LearnPage < TestEvolve::Core::PageObject
    attr_reader :url

    element(:hero_title) { h1(text: 'Learn more about technology \& Parkinson\'s') }
    element(:hero_text) { sections.first.ps }
    element(:search_field) { input(data_cy: 'search-input') }
    element(:search_button) { button(name: 'submit-search') }
    element(:search_filter_pills) { as(data_cy: 'active-filter') }
    element(:search_results) { ol(data_cy: 'resources-results').as(class: /_outerWrapper_/).map(&:href) }
    element(:articles) { ol(id: 'article-results').articles(data_cy: 'resource-card') }
    element(:freezing_article) { article(data_slug: 'what-is-freezing-of-gait') }
    element(:freezing_article_card_link) { a(aria_label: 'What is freezing of gait?') }
    element(:apps_article) { article(data_slug: 'what-is-an-app-a-beginner-s-guide') }
    element(:apps_article_card_link) { a(aria_label: 'What is an app? A beginner’s guide') }
    element(:apps_article_hero_title) { h1(text: 'What is an app? A beginner’s guide') }
    element(:apps_article_content_summary) { section(class: /_hero_/).p(class: /_summary_/) }
    element(:apps_article_content) { section(class: /_hero_/).ps(class: nil) }

    def initialize
      @url = "#{TestEvolve.environment['root_url']}learn"
    end
    
    def visit
      goto @url
    end

    def wait_for_page_load
      hero_title.wait_until(&:exists?)
    end

    def wait_for_apps_article_page_load
      apps_article_hero_title.wait_until(&:exists?)
    end

    def scan_for_accessibility
      TestEvolve.audit('learn_page')
    end
  end
end
