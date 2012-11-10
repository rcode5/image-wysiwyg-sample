require 'json'
require 'rubygems'
require 'sinatra'
require 'haml'

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
    { file: "http://placehold.it/#{ht}/#{rand_light_color}/#{rand_dark_color}",
      caption: "This image is #{ht}x#{ht}"
    }
  end
  images.to_json
end
