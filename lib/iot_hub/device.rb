class Device
  attr_reader :id

  def initialize(id)
    @id = id
  end

  def self.default_name
    'Generic Device'
  end

  def self.events
    [ :DUMMY_EVENT ]
  end

  def self.actions
    [ :DUMMY_ACTION ]
  end
end

