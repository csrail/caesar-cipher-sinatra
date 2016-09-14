require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/flash'

require_relative 'cipher'

get '/' do
  if params.empty?
    encryption = ""
  else
    response = "Your encrypted message:"
    encryption = cipher(params[:message], params[:shift_factor].to_i)
  end
  
  
    
  erb :app, :locals => { :encrypted_message => encryption,
                         :response          =>  response
                       }
end


not_found do
  redirect to('/')
end