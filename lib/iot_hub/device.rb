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

  def action(action_name)
    case action_name
    when :DUMMY_ACTION
      :NOT_IMPLEMENTED
    else
      raise ArgumentError.new('Undefined action')
    end
  end
end

