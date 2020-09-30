require_relative 'models/Player.rb'
require_relative 'models/Story.rb'
require_relative 'models/AllChoices.rb'
player1 = Player.new('o')

story = Story.new(player1)

story.story