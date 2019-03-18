require 'bundler/setup'
require 'ruby2d'
require './lib/snake_square.rb'
require './lib/snake_controller.rb'

RSpec.describe SnakeController, "#initialize" do
  context "New snake" do
    it "can it create a new snake?" do
      snake = []
      s = SnakeSquare.new(x:0,y:20,size:20, color:'red', dir:'right')
      snake << SnakeController.new([s])
      expect(snake.size).to eq 1
    end
  end
end

RSpec.describe SnakeController, "#moveRight" do
  context "Move snake to the right" do
    it "can it move to the right" do
      s = SnakeSquare.new(x:0,y:0,size:20,color:'red', dir:'right')
      s2 = SnakeSquare.new(x:0,y:20,size:20,color:'red', dir:'right')
      op = "+"
      dir = "right"
      SnakeController.moveRight(s,s2, op, dir)
      expect(s2.y).to eq 20
      expect(s2.x).to eq 0
    end
  end
end

RSpec.describe SnakeController, "#moveLeft" do
  context "Move snake to the left" do
    it "can it move to the left" do
      s = SnakeSquare.new(x:0,y:0,size:20,color:'red', dir:'right')
      s2 = SnakeSquare.new(x:0,y:20,size:20,color:'red', dir:'right')
      op = "+"
      dir = "left"
      SnakeController.moveLeft(s,s2, op, dir)
      expect(s2.x).to eq 20
      expect(s2.y).to eq 0
    end
  end
end

RSpec.describe SnakeController, "#sum" do
  context "sum a val to the snake" do
    it "can the sum be made?" do
      s = SnakeSquare.new(x:0,y:0,size:20,color:'red', dir:'right')
      s2 = SnakeSquare.new(x:0,y:0,size:20,color:'red', dir:'right')
      op = "+"
      s2.y = SnakeController.sum(s.y, op)

      expect(s2.y).to eq 20
    end
  end
end

RSpec.describe SnakeController, "#turnRight" do
  context "Move snake to the turn right" do
    it "can it move to the right" do
      s = SnakeSquare.new(x:0,y:0,size:20,color:'red', dir:'right')
      s2 = SnakeSquare.new(x:0,y:20,size:20,color:'red', dir:'right')
      SnakeController.turnRight(s,s2)
      expect(s2.y).to eq 20
      expect(s2.x).to eq 0
    end
  end
end

RSpec.describe SnakeController, "#turnLeft" do
  context "Move snake to the turn left" do
    it "can it move to the left" do
      s = SnakeSquare.new(x:0,y:0,size:20,color:'red', dir:'right')
      s2 = SnakeSquare.new(x:0,y:20,size:20,color:'red', dir:'right')
      SnakeController.turnLeft(s,s2)
      expect(s2.x).to eq 580
      expect(s2.y).to eq 0
    end
  end
end

RSpec.describe SnakeController, "#moveStraight" do
  context "Move snake in straight line" do
    it "can it go straight?" do
      s = SnakeSquare.new(x:0,y:0,size:20,color:'red', dir:'right')
      s2 = SnakeSquare.new(x:0,y:20,size:20,color:'red', dir:'right')
      SnakeController.moveStraight(s,s2)
      expect(s2.x).to eq 20
      expect(s2.y).to eq 0
    end
  end
end

RSpec.describe SnakeController, "#nextMove" do
  context "snakes next movement" do
    it "can the snake make a move?" do
      snakes = []
      s = SnakeSquare.new(x:0,y:0,size:20,color:'red', dir:'right')
      s2 = SnakeSquare.new(x:0,y:20,size:20,color:'red', dir:'right')
      snakes << SnakeController.new([s])
      snakes << SnakeController.new([s2])
      tail = snakes.pop
      snakes.unshift(tail)
      expect(snakes[0]).to eq tail
    end
  end
end

RSpec.describe SnakeController, "#nextMoveWithTick" do
  context "snakes next movement with timer" do
    it "can the snake make a move with timer?" do
      snakes = []
      s = SnakeSquare.new(x:0,y:0,size:20,color:'red', dir:'right')
      s2 = SnakeSquare.new(x:0,y:20,size:20,color:'red', dir:'right')
      snakes << SnakeController.new([s])
      snakes << SnakeController.new([s2])
      tick = 5

      new_square = if tick % 300 == 0
        snakes.last.dup
      end

      if new_square
        snakes << new_square
        new_square.add
      end
      size = snakes.size

      expect(snakes[size]).to eq new_square
    end
  end
end
