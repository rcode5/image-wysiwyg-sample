require 'json'
require 'rubygems'
require 'sinatra'
require 'haml'
require './colors'
configure do
  set :public_folder, Proc.new { File.join(root, "static") }
  enable :sessions
end

get '/' do
  haml :index
end

# json endpoint to return your image data
get '/attachable_images' do
  content_type :json
  images = 5.times.map do |x|
    ht = (x + 5) * 10
    foreground = Colors.rand_light_color
    background = Colors.rand_dark_color
    { file: "http://placehold.it/#{ht}/#{foreground}/#{background}",
      caption: "This image is #{ht}x#{ht} and uses colors ##{foreground} and ##{background}",
      foreground: foreground,
      background: background
    }
  end
  images.to_json
end
