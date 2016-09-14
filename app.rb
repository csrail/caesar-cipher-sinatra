require 'sinatra'
require 'sinatra/reloader' if development?
require 'sass'

require_relative 'cipher'

helpers do
  def css(*stylesheets)
    stylesheets.map do |stylesheet|
      "<link rel=\"stylesheet\" href=\"/#{stylesheet}.css\">"
    end.join
  end
end

get '/style.css' do
  scss :style
end


    
get '/' do
  @encryption = nil
  
  erb :app, :locals => { :encrypted_message => @encryption,
                       }
end

post '/' do
  if params.empty?
    @encryption = ""
  else
    @encryption = cipher(params[:message], params[:shift_factor].to_i)
  end
  
  
  erb :app, :locals => { :encrypted_message => @encryption,
                       }
end


not_found do
  redirect to('/')
end