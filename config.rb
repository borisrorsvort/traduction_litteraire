# --------------------------------------------------------------------------------------------------
# Helpers
# --------------------------------------------------------------------------------------------------

helpers do
  # Helpers are defined in and can be added to `helpers/custom_helpers.rb`.
  # In case you require helpers within `config.rb`, they can be added here.
end


# --------------------------------------------------------------------------------------------------
# Extensions
# --------------------------------------------------------------------------------------------------

# Use LiveReload
activate :livereload

# Use Search Engine Sitemap
set :url_root, data.config.site.root_url
activate :search_engine_sitemap

# --------------------------------------------------------------------------------------------------
# Paths
# --------------------------------------------------------------------------------------------------

set :css_dir,     'stylesheets'
set :fonts_dir,   'fonts'
set :images_dir,  'images'
set :js_dir,      'javascripts'

activate :blog do |blog|
  blog.prefix = 'articles'
  blog.permalink = '{title}.html'
  blog.layout = 'articles'
  blog.sources   = '{id}-{title}.html'
  blog.tag_template = "/tag.html"
  blog.paginate = true
  blog.per_page = 10
  blog.page_link = "page/{num}"
end

sass_dir = 'source/stylesheets', 'bower_components'

after_configuration do
  @bower_config = JSON.parse(IO.read("#{root}/.bowerrc"))
  sprockets.append_path File.join "#{root}", @bower_config["directory"]
end

activate :bower # User Bower to manage vendor scripts
activate :directory_indexes # Pretty URLs - See https://middlemanapp.com/advanced/pretty_urls/
activate :relative_assets
set :relative_links, true

page "/feed.xml", layout: false

# --------------------------------------------------------------------------------------------------
# Build configuration
# --------------------------------------------------------------------------------------------------

configure :build do

  ignore 'stylesheets/vendor/*'
  ignore 'javascripts/vendor/*'
  activate :minify_css
  activate :minify_javascript
  activate :minify_html, {
    remove_quotes: false,
    remove_input_attributes: false
  }

  # Compress images (default)
  require "middleman-smusher"
  activate :smusher
  activate :gzip
  # Compress ALL images (advanced)
  # Before activating the below, follow setup instructions on https://github.com/toy/image_optim
  # activate :imageoptim do |options|
  #   options.pngout = false # set to true when pngout is also installed
  # end

  # Uniquely-named assets (cache buster)
  # Exception: svg & png in images folder because they need to be interchangeable by JS
  activate :asset_hash, ignore: [/images\/(.*\.png|.*\.svg)/]
end

activate :deploy do |deploy|
  deploy.method = :git
end
