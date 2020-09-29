require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end

player1 = Player.new('Ab')
ourStory = Story.new(player1)