require 'rubygems'
require 'sinatra'

disable :run

root = ::File.dirname(__FILE__)
require ::File.join( root, 'app' )

# setup static serving
use Rack::Static, :urls => [ "/images", "/stylesheets", "/javascripts"], :root => File.join(root, 'public')

run BryantStreetStudios.new
