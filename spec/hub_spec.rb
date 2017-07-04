require 'iot_hub/device'
require 'iot_hub/hub'

describe Hub do
  device1 = Device.new(1)
  device2 = Device.new(2)

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
      it 'raises ArgumentError' do
        hub = Hub.new
        hub.register(device1)
        expect { hub.register(device1) }.to raise_error(ArgumentError)
      end
    end

    context 'given nil' do
      it 'raises ArgumentError' do
        hub = Hub.new
        expect { hub.register(nil) }.to raise_error(ArgumentError)
      end
    end
  end

  describe '#deregister' do
    context 'given a registered device' do
      it 'deregisters the device' do
        hub = Hub.new
        hub.register(device1)
        hub.register(device2)
        hub.deregister(device1)
        expect(hub.devices.size).to eq(1)
        expect(hub.devices[0]).to eq(device2)
      end
    end

    context 'given an unknown device' do
      it 'raises ArgumentError' do
        hub = Hub.new
        hub.register(device1)
        expect { hub.deregister(device2) }.to raise_error(ArgumentError)
      end
    end

    context 'given nil' do
      it 'raises ArgumentError' do
        hub = Hub.new
        expect { hub.deregister(device1) }.to raise_error(ArgumentError)
      end
    end
  end

  describe '#connect' do
    context 'given two registered devices with valid event and action' do
      it 'creates a new rule' do
        hub = Hub.new
        hub.register(device1)
        hub.register(device2)
        hub.connect(device1, :DUMMY_EVENT, device2, :DUMMY_ACTION)
        expect(hub.rules.size).to eq(1)
      end
    end
  end
end

