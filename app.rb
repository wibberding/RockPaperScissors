require 'sinatra'
require_relative 'game'

configure do
  enable :sessions
  set :session_secret, "potato"
end

get '/' do
  unless session["game"]
    session["game"] = Game.new
  end
  @game = session["game"]
  erb :index
end

post '/rock' do
  session["game"].process_move('r')
  redirect "/"
end

post '/paper' do
  session["game"].process_move('p')
  redirect "/"
end

post '/scissors' do
  session["game"].process_move('s')
  redirect "/"
end

post '/reset' do
  session.clear
  redirect "/"
end
