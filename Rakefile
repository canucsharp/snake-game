task default: %w[snake:run]

namespace :snake do
	task :run do
		# require './snake.rb'
		ruby "snake.rb"
	end

  task :test do
    rspec "spec/snake_controllers_spec.rb"
  end
end
