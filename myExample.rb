require 'bundler/setup'
require 'ruby2d'
require 'slim'
require 'my_square.rb'
require 'snakeControls.rb'
require 'fieldControls.rb'

# Create a new shape
field = FieldController.new(3)

on :key_down do |event|
  field.moveSnakes(event.key)
end

# Set the window size
set width: 600, height: 600
set title: "Snake"

tick = 0

update do
  if tick % 60 == 0
    field.moveSnakesWithTick(tick)
  end
  tick += 1
end

# Show the window
show
