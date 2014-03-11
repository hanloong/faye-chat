require 'rubygems'
require 'sinatra'
require 'slim'

set :slim, layout: true

$chats = []

get '/' do
  slim :chatroom
end

post '/' do
  $chats << params[:message]
  slim :chatroom
end
