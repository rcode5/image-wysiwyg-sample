# dev hint: shotgun login.rb
require 'json'
require 'rubygems'
require 'sinatra'
require 'haml'

configure do
  set :public_folder, Proc.new { File.join(root, "static") }
  enable :sessions
end

helpers do
  def username
    session[:identity] ? session[:identity] : 'Hello stranger'
  end
end

before '/secure/*' do
  if !session[:identity] then
    session[:previous_url] = request['REQUEST_PATH']
    @error = 'Sorry guacamole, you need to be logged in to do that'
    halt erb(:login_form)
  end
end

get '/' do
  haml :index
end

get '/attachable_images' do
  # json endpoint to return your image data
  content_type :json
  images = 5.times.map do |x|
    ht = (x + 5) * 10
    { file: "http://placehold.it/#{ht}x#{ht}",
      caption: "The image height is #{ht}"
    }
  end
  images.to_json
end

get '/login/form' do 
  erb :login_form
end

post '/login/attempt' do
  session[:identity] = params['username']
  where_user_came_from = session[:previous_url] || '/'
  redirect to where_user_came_from 
end

get '/logout' do
  session.delete(:identity)
  erb "<div class='alert alert-message'>Logged out</div>"
end


get '/secure/place' do
  erb "This is a secret place that only <%=session[:identity]%> has access to!"
end
