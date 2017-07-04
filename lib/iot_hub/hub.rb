require 'iot_hub/device'
require 'iot_hub/rule'

class Hub
  attr_reader :devices, :rules

  def initialize
    @devices = []
    @rules = []
  end

  def register(device)
    raise ArgumentError.new('Object needs to be a Device to register') unless device.is_a? Device
    raise ArgumentError.new('Device is already registered') if @devices.collect{ |device| device.id }.include? device.id

    @devices.push(device)
  end

  def deregister(device)
    raise ArgumentError.new('Object needs to be a Device to deregister') unless device.is_a? Device
    raise ArgumentError.new('Device is not registered yet') unless @devices.collect{ |device| device.id }.include? device.id

    @devices.delete_if { |registered_device| registered_device.id == device.id }
  end

  def connect(origin, event, target, action)
    raise ArgumentError.new('Origin and target parameters have to be Devices') unless origin.is_a? Device and target.is_a? Device
    raise ArgumentError.new('Origin device is not registered yet') unless @devices.collect{ |device| device.id }.include? origin.id
    raise ArgumentError.new('Target device is not registered yet') unless @devices.collect{ |device| device.id }.include? target.id

    rule = Rule.new(origin, event, target, action)
    @rules.each { |rule|
      raise ArgumentError.new('Rule is already present') if rule.origin == origin and rule.event == event and rule.taget == target and rule.action == action
    }
    @rules.push(rule)
  end
end

