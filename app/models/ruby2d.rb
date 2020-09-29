require 'ruby2d'
require_relative '../tools/main.rb'
require_relative 'Story.rb'
require_relative 'Player.rb'
require_relative 'AllChoices.rb'

player1 = Player.new('Ab')
ourStory = Story.new(player1)

set title: "Sequentia: An Interactive Story"

set width: 900
set height: 600

background = Image.new('img/title/parallax-forest-back-trees.png', width: 900, height: 550)
background = Image.new('img/title/parallax-forest-lights.png', width: 900, height: 550)
background = Image.new('img/title/parallax-forest-middle-trees.png', width: 900, height: 550)
background = Image.new('img/title/parallax-forest-front-trees.png', width: 900, height: 550)

Rectangle.new(
  x: 0, y: 470,
  width: 900, height: 130,
  color: 'black',
  z: 20
)

Rectangle.new(
  x: 0, y: 0,
  width: 900, height: 130,
  color: 'black',
  z: 20
)

class PlayerSelectScreen
    def initialize
      title_text = Text.new("SEQUENTIA", font: "fonts/Amatic-Bold.ttf", size: 72, y: 230, z: 160,  color: "black")
      title_text.x = (Window.width - title_text.width) / 2
  
      player_select_text = Text.new("AN INTERACTIVE STORY", font: "fonts/Amatic-Bold.ttf", size: 50, y: 300, color: "black")
      player_select_text.x = (Window.width - player_select_text.width) / 2
      
      enter_to_start
    end

    def opening_crawl
      title_text = Text.new("T E S T", font: "fonts/Amatic-Bold.ttf", size: 30, y: 100, z: 160,  color: "black")
      title_text.x = (Window.width - title_text.width) / 2
    end
end

def enter_to_start
  start_text = Text.new( "P R E S S   E N T E R",font: "fonts/Amatic-Bold.ttf", size: 35, y: 500, z: 160, color: "white")
  start_text.x = (Window.width - start_text.width) / 2
end

on :key_down do |event|
  if event.key == 'return'
    ourStory.story
  end
end

player_select_screen = PlayerSelectScreen.new

# on :key_down do |event|
#   case event.key
#   when 'left'
#     player_select_screen.move(:left)
#   when 'right'
#     player_select_screen.move(:right)
#   end
# end

show