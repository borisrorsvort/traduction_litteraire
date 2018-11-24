# --------------------------------------------------------------------------------------------------
# Helpers
# --------------------------------------------------------------------------------------------------

helpers do
  # Helpers are defined in and can be added to `helpers/custom_helpers.rb`.
  # In case you require helpers within `config.rb`, they can be added here.
end

activate :autoprefixer do |prefix|
  prefix.browsers = "last 2 versions"
end

page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false

# Use LiveReload
# activate :livereload

# Use Search Engine Sitemap
# set :url_root, data.config.site.root_url
# activate :search_engine_sitemap

# --------------------------------------------------------------------------------------------------
# Paths
# --------------------------------------------------------------------------------------------------

# set :css_dir,     'stylesheets'
# set :fonts_dir,   'fonts'
# set :images_dir,  'images'
# set :js_dir,      'javascripts'

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

activate :directory_indexes # Pretty URLs - See https://middlemanapp.com/advanced/pretty_urls/
activate :relative_assets
set :relative_links, true

page "/feed.xml", layout: false

# --------------------------------------------------------------------------------------------------
# Build configuration
# --------------------------------------------------------------------------------------------------
set :markdown_engine, :redcarpet
set :haml, { :format => :html5 }

configure :build do
  activate :minify_css
  activate :minify_javascript
  activate :gzip
  activate :asset_hash, ignore: [/images\/(.*\.png|.*\.svg)/]
end