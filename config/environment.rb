require 'bundler'
Bundler.require
# require 'pry'

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/development.db')
require_all 'app'
require_all 'lib'

# SINATRA_ACTIVESUPPORT_WARNING='false'
