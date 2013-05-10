require 'celluloid/autostart'
require 'wisper'
require "wisper/async/version"
require "wisper/async/listener"

module Wisper
  class ObjectRegistration
    attr_reader :async

    def initialize(listener, options)
      super(listener, options)
      @async = options.fetch(:async, false)
    end

    def broadcast(event, *args)
      method_to_call = map_event_to_method(event)
      if should_broadcast?(event) && listener.respond_to?(method_to_call)
        unless async
          listener.public_send(method_to_call, *args)
        else
          Async::Listener.new(listener, method_to_call).async.public_send(method_to_call, *args)
        end
      end
    end
  end
end

