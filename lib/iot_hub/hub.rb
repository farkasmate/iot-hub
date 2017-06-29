require 'iot_hub/device'

class Hub
  attr_reader :devices

  def initialize
    @devices = {}
  end

  def register(device)
    raise 'Not a Device' unless device.is_a? Device
    raise 'Already registered' if @devices.values.include? device # FIXME: Check ID

    index = @devices.values.count { |registered_device| registered_device.is_a? device.class }
    @devices["#{device.class.default_name} #{index}"] = device
  end
end

