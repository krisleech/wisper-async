require 'spec_helper'

class MyService
  include Wisper

  def execute
    broadcast('success', self)
  end
end

# help me...
$global = nil

class MyListener
  def success(command)
    $global = Thread.current.object_id
  end
end

describe Wisper do

  it 'broadcasts event in different thread' do
    listener = MyListener.new

    command = MyService.new

    command.add_listener(listener, :async => true)

    command.execute
    sleep(1) # seriously...
    $global.should_not == Thread.current.object_id
  end
end
