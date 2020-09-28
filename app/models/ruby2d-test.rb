require 'ruby2d'

set title: "Sequentia: An Interactive Story"

set width: 800
set height: 600

background = Image.new('images/parallax-forest-back-trees.png', width: 800, height: 600)
background = Image.new('images/parallax-forest-lights.png', width: 800, height: 600)
background = Image.new('images/parallax-forest-middle-trees.png', width: 800, height: 600)
background = Image.new('images/parallax-forest-front-trees.png', width: 800, height: 600)

class PlayerSelectScreen
    def initialize
      title_text = Text.new('SEQUENTIA', size: 72, y: 40, color: 'black')
      title_text.x = (Window.width - title_text.width) / 2
  
      player_select_text = Text.new('AN INTERACTIVE STORY', size: 32, y: 120, color: 'black')
      player_select_text.x = (Window.width - player_select_text.width) / 2

    #   Square.new(
    #     x: 250, y: 150,
    #     size: 125,
    #     color: 'white',
    #     z: 100
    #   )

    end
end

player_select_screen = PlayerSelectScreen.new

show