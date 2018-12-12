# frozen_string_literal: true

module MetaTagHelper
  # Sets the page meta description and keywords, which can be composed by either
  #   a) data in config.yml (which is sitewide), or
  #   b) data set in the FrontMatter of each page

  def meta_keywords
    keywords = current_page.data.meta_keywords || data.config.site.meta_keywords
    keywords.join(', ')
  end

  def meta_description
    current_page.data.meta_description || data.config.site.meta_description
  end
end
