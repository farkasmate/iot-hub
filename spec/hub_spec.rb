require 'device'
require 'hub'

describe Hub do
  device1 = Device.new
  device2 = Device.new

  describe '#register' do
    context 'given a valid device' do
      it 'registers the device' do
        hub = Hub.new
        hub.register(device1)
        expect(hub.devices.size).to eq(1)
      end
    end

    context 'given two devices' do
      it 'registers both devices' do
        hub = Hub.new
        hub.register(device1)
        hub.register(device2)
        expect(hub.devices.size).to eq(2)
      end
    end

    context 'given the same device twice' do
      it 'raise an exception' do
        hub = Hub.new
        hub.register(device1)
        expect { hub.register(device1) }.to raise_error('Already registered')
      end
    end

    context 'given nil' do
      it 'raise an exception' do
        hub = Hub.new
        expect { hub.register(nil) }.to raise_error('Not a Device')
      end
    end
  end
end

