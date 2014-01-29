class Databox::Messages < Databox::Integration

  attr_accessor :name, :list

  def initialize name, id=nil
    @name, @list = name, []
    super(id)
  end

  def add message, icon=nil
    @list.push message
  end

  def save
    if push(to_data).success?
      @list = []
      true
    else
      false
    end
  end

  #TODO: icons
  def to_data
    { key: "#{name}", value: list }
  end

end
