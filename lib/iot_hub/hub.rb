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
end

