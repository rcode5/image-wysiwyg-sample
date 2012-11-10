#!/usr/bin/env ruby 
require 'sinatra'
require './app'
root = File.expand_path(File.join(File.dirname(__FILE__), '..'))
Dir[File.join(root,"{lib,models}/**/*.rb")].each do |file|
  require file
end

disable :run
require 'irb'
IRB.start
