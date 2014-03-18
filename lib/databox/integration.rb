class Databox::Integration < Databox::Client

  attr_accessor :name, :list, :set_item, :date

  def initialize name, options={date: nil, id: nil}
    super()
    @name = name

    @date   = options[:date]  unless options[:date].nil?
    @token  = options[:id]    unless options[:id].nil?

    @list = []
    @set_item = nil
  end

  def save
    if push(to_data).success?
      @list = []
      @set_item = nil
      true
    else
      false
    end
  end

end

class Databox::Messages < Databox::Integration

  def add message, icon
    @list.push [message, icon]
  end

  def to_data
    [
      { key: "#{name}", value: list.map(&:first)           },
      { key: "#{name}@icons", value: list.map{|e| e[1] }   },
    ]
  end

end

#TODO: Add support for icons
#TODO: Add support for changes
class Databox::Pipeline < Databox::Integration

  def add message, value
    @list.push [message, value]
  end

  def to_data
    [
      { key: "#{name}@labels", value: list.map(&:first)     },
      { key: "#{name}@values", value: list.map{|e| e[1] }   },
    ]
  end

end




#TODO: Add support for icons
#TODO: Add support for changes
class Databox::Funnel < Databox::Pipeline; end;
class Databox::Pie < Databox:: Pipeline; end;



class Databox::Progress < Databox::Integration

  def add *args
    raise "Progress does not support add!"
  end

  def set message, max, value
    @set_item = [message, max, value]
  end

  def to_data
    [
      { key: "#{name}@label",     value: @set_item.first },
      { key: "#{name}@max_value", value: @set_item[1] },
      { key: "#{name}",           value: @set_item.last },
    ]
  end

end



class Databox::BigNumber < Databox::Integration
  def set number, date=nil
    date ||= @date
    @set_item = [number, date]
  end

  def to_data
    out = {key: name, value: @set_item.first}
    out.merge!({date: @set_item[1]}) unless @set_item[1].nil?
    out
  end
end



class Databox::LineChart < Databox::Integration

  def add value, date=nil
    date ||= @date
    @list.push [value, date]
  end

  def to_data
    @list.map do |i|
      out = {key: name, value: i.first}
      out.merge!({date: i[1]}) unless i[1].nil?
      out
    end
  end
end

class Databox::BarChart < Databox::LineChart; end;

class Databox::Compare < Databox::LineChart; end;

class Databox::Interval < Databox::LineChart; end;
