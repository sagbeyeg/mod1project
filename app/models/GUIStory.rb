require 'ruby2d'
require_relative 'Choice.rb'
require 'ruby2d.rb'

class GUIStory
    attr_reader :choices, :choice_ids, :isGameOver,  :user_input
    attr_accessor  :current_selection, :start_text, :level_text
    def initialize(player)
        @player = player
		@choices = Choice.all
        @choice_ids = []
        @isGameOver = false
        @current_selection = 0
        @start_text = Text.new(choices[0].question, font: "fonts/Amatic-Bold.ttf", size: 15, y: 90, z: 160,  color: "white")
        start_text.x = (Window.width - start_text.width)  
        @level_text = nil
        @gameOver_text = nil

    end

    def gameOver?(choice)
        if(choice[:gameOver?])
            @gameOver_text = Text.new(choice[:text], font: "fonts/Amatic-Bold.ttf", size: 15, y: 90, z: 160,  color: "white")
            @isGameOver = true 
        end
    end
        

    def level(choice)
        p choice_ids
        @level_text = Text.new(choice.question, font: "fonts/Amatic-Bold.ttf", size: 15, y: 90, z: 160,  color: "white")
        level_text.x = (Window.width - level_text.width)  
        player_choice = (@user_input == 'A') ? choice.a_choice : choice.b_choice
        gameOver?(player_choice)
        choice_ids.push(player_choice[:id])
            
        # gameOver?(player_choice)
        # choice_ids.push(player_choice[:id])
    end
   

    def remove
        @start_text.remove
        if(level_text != nil)
            @level_text.remove
        end
    end


    def selection(choice_ID)
        p choice_ID
        choices.map { |choice_object|
        if(choice_object.last_choiceID == choice_ID)
            p choice_object
            level(choice_object)    
        end
    }
    end

    def firstLevel
        firstChoice = (user_input == "A") ? choices[1].question : choices[2].question
        @level_text = Text.new(firstChoice, font: "fonts/Amatic-Bold.ttf", size: 15, y: 90, z: 160,  color: "white")
        level_text.x = (Window.width - level_text.width)  
        player_choice = (@user_input == 'A') ? choices[0].a_choice : choices[0].b_choice
        choice_ids.push(player_choice[:id])
    end

    def nextSelection
        if(@current_selection == 0) 
            firstLevel
        else
            p choice_ids
            selection(choice_ids[@current_selection - 1 ])
        end
        @current_selection += 1
    end

    def grabInput(x)
        @user_input = x
    end


end