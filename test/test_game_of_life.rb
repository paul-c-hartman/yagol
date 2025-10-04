require 'yaml'
require_relative '../src/game_of_life'

# Stub (turn into mock)
WindowClass, GameOfLife::Window = GameOfLife::Window, Class.new # To redefine entire class instead of adding to it # rubocop:disable Style/ParallelAssignment,Naming/ConstantName
module GameOfLife
  class Window
    attr_reader :called

    def initialize(**)
      @called = {}
      @window = WindowClass.new(**)
    end

    def method_missing(...) = @called[store(...)] = @window.send(...)

    def respond_to_missing?(...) = @window.respond_to?(...)

    private

    def store(first_arg = nil, *args, **kwargs, &block)
      [
        first_arg, args, kwargs, block
      ]
    end
  end
end

opts = YAML.load_file('../cfg/main.yml')
game = GameOfLife.new(**opts)

# Just to see what we're working with
game.show
puts
pp game.window.called
