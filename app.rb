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
  # for a normal app, this should return a list of images pulled from 
  # a database or filesystem or other storage location
  #
  # for this demo, we return a random list of image pointers 
  # using placehold.it as our "repo"
  content_type :json
  images = 5.times.map do |x|
    ht = (x + 5) * 10
    foreground = Colors.rand_light_color
    background = Colors.rand_dark_color
    { file: "http://placehold.it/#{ht}/#{foreground}/#{background}",
      caption: "This image is #{ht}x#{ht} and uses colors ##{foreground} and ##{background}"
    }
  end
  images.to_json
end


post '/upload' do
  content_type :html
  # Here you'd need to add code to handle the image upload give that you've 
  # submitted the image via a multipart-form.  You might push the file to the 
  # filesystem or S3 or elsewhere

  # then return the data - jqueryupload looks for json in an html document (seems a bit odd...)
  #
  # as you can see, here we're not actually uploading anything, but simply returning another
  # fake response acting as if we've successfully uploaded the image.
  background = Colors.rand_light_color
  foreground = Colors.rand_dark_color

  '<html><body>%s</body></html>' % { :file => "http://placehold.it/300x50/#{foreground}/#{background}&text=uploaded",
    :caption =>'This image was uploaded at ' + Time.now.to_s,
    :status => 1
  }.to_json

end
