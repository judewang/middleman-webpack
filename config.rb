###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
#
# With no layout
page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false

# With alternative layout
# page "/path/to/file.html", layout: :otherlayout

# Proxy pages (http://middlemanapp.com/basics/dynamic-pages/)
# proxy "/this-page-has-no-template.html", "/template-file.html", locals: {
#  which_fake_page: "Rendering a fake page with a local variable" }

###
# Helpers
###

# Methods defined in the helpers block are available in templates
# helpers do
#   def some_helper
#     "Helping"
#   end
# end

# General configuration

Slim::Engine.options[:pretty] = true

# Run webpack with external_pipeline

activate :external_pipeline,
  name: :webpack,
  command: build? ? 'npm run webpack' : 'npm run webpack-dev-server',
  source:  '.webpack',
  latency: 0

# Reload the browser automatically whenever files change
configure :development do
  activate :livereload
end

# Build-specific configuration
configure :build do

  case ENV['TARGET'].to_s.downcase
  when 'staging'
    activate :asset_hash
  else
    set :build_dir, 'dist'
  end

end

# Deploy configurations
case ENV['TARGET'].to_s.downcase
when 'staging'
  activate :deploy do |deploy|
    deploy.deploy_method = :git
    deploy.commit_message = ENV['MESSAGE'].to_s
  end
else
  activate :deploy do |deploy|
    deploy.deploy_method = :git
    deploy.branch = 'static'
    deploy.commit_message = ENV['MESSAGE'].to_s
  end
end
