#The environment variable DATABASE_URL should be in the following format:
# => postgres://{user}:{password}@{host}:{port}/path
configure :production, :development do
	db = URI.parse(ENV['DATABASE_URL'] || 'postgres://localhost/mydb')

	ActiveRecord::Base.establish_connection(
			:adapter => db.scheme == 'postgres' ? 'postgresql' : db.scheme,
			:host     => db.host,
			:username => db.user,
			:password => db.password,
			:database => db.path[1..-1],
			:encoding => 'utf8'
	)
end

# ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../../Gemfile', __FILE__)

# require 'bundler/setup' if File.exists?(ENV['BUNDLE_GEMFILE'])

# # Require gems we care about
# require 'rubygems'

# require 'uri'
# require 'pathname'

# require 'pg'
# require 'active_record'
# require 'logger'

# require 'sinatra'
# require "sinatra/reloader" if development?

# require 'erb'


# # Some helper constants for path-centric logic
# APP_ROOT = Pathname.new(File.expand_path('../../', __FILE__))

# APP_NAME = APP_ROOT.basename.to_s

# configure :production, :development do
#   # By default, Sinatra assumes that the root is the file that calls the configure block.
#   # Since this is not the case for us, we set it manually.
#   set :root, APP_ROOT.to_path
#   # See: http://www.sinatrarb.com/faq.html#sessions
#   enable :sessions
#   set :session_secret, ENV['SESSION_SECRET'] || 'this is a really big secret shhhhh'

#   # Set the views to
#   set :views, File.join(Sinatra::Application.root, "app", "views")
# end

# # Set up the controllers and helpers
# Dir[APP_ROOT.join('app', 'controllers', '*.rb')].each { |file| require file }
# Dir[APP_ROOT.join('app', 'helpers', '*.rb')].each { |file| require file }

# # Set up the database and models
# require APP_ROOT.join('config', 'database')