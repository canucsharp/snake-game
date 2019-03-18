class SnakeController
  def initialize(squares)
    @squares = squares
  end

  def self.sum(a, op)
    a.send(op,20) % 600
  end

  def self.moveStraight(head, tail)
    case head.dir
      when 'right'
        moveLeft(head, tail, :+, head.dir)
      when 'down'
        moveRight(head, tail, :+, head.dir)
      when 'left'
        moveLeft(head, tail, :-, head.dir)
      when 'up'
        moveRight(head, tail, :-, head.dir)
    end
  end

  def self.moveRight(head, tail, op, next_dir)
    tail.y = sum(head.y, op)
    tail.x = head.x
    tail.dir = next_dir
  end

  def self.turnRight(head, tail)
    if head.dir == 'right'
      moveRight(head, tail, :+, 'down')
    elsif head.dir == 'down'
      moveRight(head, tail, :-, 'left')
    elsif head.dir == 'left'
      moveRight(head, tail, :-, 'up')
    elsif head.dir == 'up'
      moveRight(head, tail, :+, 'right')
    end
  end

  def self.turnLeft(head, tail)
    if head.dir == 'right'
      moveLeft(head, tail, :-, 'up')
    elsif head.dir == 'down'
      moveLeft(head, tail, :+, 'right')
    elsif head.dir == 'left'
      moveLeft(head, tail, :+, 'down')
    elsif head.dir == 'up'
      moveLeft(head, tail, :-, 'left')
    end
  end

  def self.moveLeft(head, tail, op, next_dir)
    tail.x = sum(head.x, op)
    tail.y = head.y
    tail.dir = next_dir
  end

  def nextMove(key)
    head = @squares.first
    tail = @squares.pop
    @squares.unshift(tail)

    case key
    when 'right'
      self.class.turnRight(head, tail)
    when 'left'
      self.class.turnLeft(head, tail)
    else
      self.class.moveStraight(head, tail)
    end
  end

  def nextMoveWithTick(tick)
    new_square = if tick % 300 == 0
      @squares.last.dup
    end

    nextMove(nil)

    if new_square
      @squares << new_square
      new_square.add
    end
  end
end
