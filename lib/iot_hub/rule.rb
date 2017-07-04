require 'iot_hub/device'

class Rule
  attr_reader :origin, :event, :target, :action

  def initialize(origin, event, target, action)
    raise ArgumentError.new('Origin and target parameters have to be Devices') unless origin.is_a? Device and target.is_a? Device
    raise ArgumentError.new('Event and action parameters have to be Symbols') unless event.is_a? Symbol and action.is_a? Symbol
    raise ArgumentError.new("Origin device doesn't have such event: #{event}") unless origin.class.events.include? event
    raise ArgumentError.new("Target device doesn't have such action: #{action}") unless target.class.actions.include? action

    @origin = origin
    @event = event
    @target = target
    @action = action
  end
end

