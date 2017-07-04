require 'iot_hub/device'

class Hub
  attr_reader :devices

  def initialize
    @devices = {}
  end

  def register(device)
    raise ArgumentError.new('Object needs to be a Device to register.') unless device.is_a? Device
    raise ArgumentError.new('Device is already registered') if @devices.values.collect{ |device| device.id }.include? device.id

    index = @devices.values.count { |registered_device| registered_device.is_a? device.class }
    @devices["#{device.class.default_name} #{index}"] = device
  end
end

