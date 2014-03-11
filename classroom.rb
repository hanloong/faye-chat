require 'rubygems'
require 'sinatra'
require 'slim'
require 'faye'

Faye::WebSocket.load_adapter('thin')
use Faye::RackAdapter, mount: '/faye', timeout: 25

set :slim, layout: true

$chats = []

get '/' do
  slim :chatroom
end

post '/' do
  $chats << params[:message]
  slim :chatroom
end
