require 'ruby2d'
require_relative 'Choice.rb'
require 'ruby2d.rb'

class GUIStory
    attr_reader :choices, :choice_ids, :isGameOver,  :user_input
    attr_accessor  :current_selection
    def initialize(player)
        @player = player
		@choices = Choice.all
        @choice_ids = []
        @isGameOver = false
        @current_selection = 0
    end

    def gameOver?(choice)
        if(choice[:gameOver?])
            puts choice[:text]
            @isGameOver = true 
        end
    end
        

    def level(choice)
        puts choice
        p choice.question
        title_text = Text.new(choice.question, font: "fonts/Amatic-Bold.ttf", size: 15, y: 80, z: 160,  color: "white")
        title_text.x = (Window.width - title_text.width) / 2

        if(@user_input == 'A') 
            player_choice = choice.a_choice

            gameOver?(player_choice)
            choice_ids.push(player_choice[:id])
        elsif(@user_input == 'B') 
            player_choice = choice.b_choice

            gameOver?(player_choice)
            choice_ids.push(player_choice[:id])
        end
               
        # gameOver?(player_choice)
        # choice_ids.push(player_choice[:id])
    end


    def selection(choice_ID)
        choices.map { |choice_object|
        if(choice_object.last_choiceID == choice_ID)
            level(choice_object)    
        end
    }
    end
    def firstLevel
        firstChoice = (user_input == "A") ? choices[1].question : choices[2].question
        title_text = Text.new(firstChoice, font: "fonts/Amatic-Bold.ttf", size: 15, y: 80, z: 160,  color: "white")
        title_text.x = (Window.width - title_text.width) / 2
        if(@user_input == 'A') 
            player_choice = choices[0].a_choice
        elsif(@user_input == 'B') 
            player_choice = choices[0].b_choice
        end
        choice_ids.push(player_choice[:id])

    end

    def nextSelection
        if(@current_selection == 0) 
            firstLevel
        else
            selection(choice_ids[@current_selection - 1 ])
        end
        p choice_ids
        @current_selection += 1
    end

    def grabInput(x)
        @user_input = x
    end

    def begin
        title_text = Text.new(choices[0].question, font: "fonts/Amatic-Bold.ttf", size: 15, y: 80, z: 160,  color: "white")
        title_text.x = (Window.width - title_text.width) / 2
    end    

end

