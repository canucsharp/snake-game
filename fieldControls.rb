class FieldController
  def initialize(n)
    @number_of_snakes = n
    @snakes = []
    (0..n).each do |i|
      pos_y = ((i*20)+i*20)
      s = MySquare.new(x:0,y:pos_y,size:20,color:'red', dir:'right')
      @snakes << SnakeController.new([s])
    end
  end

  def moveSnakes(key)
    @snakes.each {|s| s.nextMove(key)}
  end

  def moveSnakesWithTick(t)
    @snakes.each {|s| s.nextMoveWithTick(t)}
  end
end
