require 'ruby2d'
require_relative 'GUIStory.rb'
require_relative 'Player.rb'
require_relative 'AllChoices.rb'

ourStory = nil

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
  attr_accessor :title_text, :player_select_text, :title_text, :start_text

    def initialize
      @title_text = Text.new("SEQUENTIA", font: "fonts/Amatic-Bold.ttf", size: 72, y: 230, z: 160,  color: "black")
      title_text.x = (Window.width - title_text.width) / 2
  
      @player_select_text = Text.new("AN INTERACTIVE STORY", font: "fonts/Amatic-Bold.ttf", size: 50, y: 300, color: "black")
      player_select_text.x = (Window.width - player_select_text.width) / 2
      
      @start_text = Text.new( "P R E S S   E N T E R",font: "fonts/Amatic-Bold.ttf", size: 35, y: 500, z: 160, color: "white")
      start_text.x = (Window.width - start_text.width) / 2
    end

    def remove_text
      title_text.remove
      player_select_text.remove
      start_text.remove
    end

    # def opening_crawl
    #   title_text = Text.new("T E S T", font: "fonts/Amatic-Bold.ttf", size: 30, y: 100, z: 160,  color: "black")
    #   title_text.x = (Window.width - title_text.width) / 2
    # end
end

  # start_text = Text.new( "P R E S S   E N T E R",font: "fonts/Amatic-Bold.ttf", size: 35, y: 500, z: 160, color: "white")
  # start_text.x = (Window.width - start_text.width) / 2


player_select_screen = PlayerSelectScreen.new

on :key_down do |event|
  if event.key == 'return' && !ourStory
    player_select_screen.remove_text
    player1 = Player.new('Ab')
    ourStory = GUIStory.new(player1)
  elsif event.key == 'a'
    ourStory.remove
    ourStory.grabInput('A')
  elsif event.key == 'b'
    ourStory.remove
    ourStory.grabInput('B')
  elsif event.key == 'return'
    ourStory.nextSelection
  end

end

# on :key_down do |event|
#   case event.key
#   when 'left'
#     player_select_screen.move(:left)
#   when 'right'
#     player_select_screen.move(:right)
#   end
# end

show