# frozen_string_literal: true

module PageTitleHelper
  def site_title
    data.config.site.title
  end

  def title_separator
    data.config.site.title_separator
  end

  def render_page_title
    current_page.data.title + title_separator + site_title
  end
end
