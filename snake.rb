require 'bundler/setup'
require 'ruby2d'
require './lib/snake_square.rb'
require './lib/snake_controller.rb'
require './lib/snakes_field.rb'

# Create a new field
snakes_field = SnakesField.new(3)

on :key_down do |event|
  snakes_field.moveSnakes(event.key)
end

# Set the window size
set width: 600, height: 600
set title: "Snake"

tick = 0

update do
  if tick % 60 == 0
    snakes_field.moveSnakesWithTick(tick)
  end
  tick += 1
end

# Show the window
show
