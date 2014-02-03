class Databox::Integration < Databox::Client

  attr_accessor :name, :list, :date

  def initialize name, options={date: nil, id: nil}
    super()
    @name = name

    @date   = options[:date]  unless options[:date].nil?
    @token  = options[:id]    unless options[:id].nil?

    @list = []
  end

  def save
    if push(to_data).success?
      @list = []
      true
    else
      false
    end
  end

end

#### Widgets

#TODO: Add support for icons
class Databox::Messages < Databox::Integration

  def add message
    @list.push message
  end

  def to_data
    { key: "#{name}", value: list }
  end

end

#TODO: Add support for icons
class Databox::Pipeline < Databox::Integration

  def add message, value
    @list.push [message, value]
  end

  def to_data
    { key: "#{name}", value: list }
  end

end
