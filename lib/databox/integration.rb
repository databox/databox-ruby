class Databox::Integration < Databox::Client

  def initialize id=nil
    super()
    @token = id unless id.nil?
  end

end
