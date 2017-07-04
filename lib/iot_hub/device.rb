class Device
  attr_reader :id

  def initialize(id)
    @id = id
  end

  def self.default_name
    'Generic Device'
  end
end

