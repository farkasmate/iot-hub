require 'iot_hub/device'

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

    @rules[origin.id] ||= {}
    @rules[origin.id][event] ||= {}
    @rules[origin.id][event][target.id] ||= []

    raise ArgumentError.new('Rule is already present') if @rules[origin.id][event][target.id].include? action

    @rules[origin.id][event][target.id].push(action)
  end
end

