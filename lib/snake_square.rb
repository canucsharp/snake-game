class SnakeSquare < Square
  attr_accessor :dir

  def initialize(params)
    @dir = params[:dir]
    super
  end
end
