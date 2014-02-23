require 'celluloid/autostart'
require 'wisper'
require "wisper/async/version"
require "wisper/async/listener"

module Wisper
  class ObjectRegistration
    attr_reader :async

    alias_method :old_initialize, :initialize

    def initialize(listener, options)
      @async = options.delete(:async) { false }
      old_initialize(listener, options)
    end

    def broadcast(event, publisher, *args)
      method_to_call = map_event_to_method
      if should_broadcast?(event) && listener.respond_to?(method_to_call) && publisher_in_scope?(publisher)
        unless async
          listener.public_send(method_to_call, *args)
        else
          Async::Listener.new(listener, method_to_call).async.public_send(method_to_call, *args)
        end
      end
    end
  end
end

