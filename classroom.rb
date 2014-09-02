require 'rubygems'
require 'sinatra'
require 'slim'
require 'faye'
require 'faye/redis'

Faye::WebSocket.load_adapter('thin')
use Faye::RackAdapter,
            mount: '/faye',
            timeout: 25,
            engine: {
              type: Faye::Redis,
              host: 'localhost',
              port: 6379
            }

set :slim, layout: true

get '/' do
  slim :index
end

get '/room' do
  slim :chatroom, locals: {room: params[:room], username: params[:username] }
end
