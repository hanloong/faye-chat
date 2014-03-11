require 'faye'

Faye::WebSocket.load_adapter('thin')

chatty = Faye::RackAdapter.new(mount: '/faye', timeout: 25)
run chatty
