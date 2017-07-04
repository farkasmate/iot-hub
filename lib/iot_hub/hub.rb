require 'iot_hub/device'

class Hub
  attr_reader :devices

  def initialize
    @devices = []
  end

  def register(device)
    raise ArgumentError.new('Object needs to be a Device to register.') unless device.is_a? Device
    raise ArgumentError.new('Device is already registered') if @devices.collect{ |device| device.id }.include? device.id

    @devices.push(device)
  end

  def deregister(device)
    raise ArgumentError.new('Object needs to be a Device to deregister.') unless device.is_a? Device
    raise ArgumentError.new('Device is not registered yet') unless @devices.collect{ |device| device.id }.include? device.id

    @devices.delete_if { |registered_device| registered_device.id == device.id }
  end
end

