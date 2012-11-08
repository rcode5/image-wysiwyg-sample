#!/usr/bin/env ruby 
require 'data_mapper'
require 'sinatra'
require 'sinatra/config_file'
disable :run

root = File.expand_path(File.join(File.dirname(__FILE__), '..'))
Dir[File.join(root,"{lib,models}/**/*.rb")].each do |file|
  require file
end

set :environments, %w{development test production staging}
set :environment, ENV['RACK_ENV'] || :development

config_file File.join( [root, 'config', 'config.yml'] )

DataMapper::setup(:default, settings.database_url)

DataMapper.auto_upgrade!
require 'irb'
IRB.start
