# require 'ruby2d'
require_relative 'Choice.rb'
# require 'ruby2d.rb'

class Story
	attr_reader :choices, :choice_ids, :isGameOver

    def initialize(player)
        @player = player
		@choices = Choice.all
        @choice_ids = []
        @isGameOver = false
    end

    def gameOver?(choice)
        if(choice[:gameOver?])
            puts choice[:text]
            @isGameOver = true 
        end
    end

    def level(choice)

        puts choice.question 

        # on :key_down do |event|
        #     user_input  == 'A'
        #   end
        # on :key_up do |event|
        #     # A key was pressed
        #     user_input == 'B'
        #   end
        
        user_input = gets.chomp
        player_choice = (user_input.upcase == 'A') ? choice.a_choice : choice.b_choice
        gameOver?(player_choice)
        choice_ids.push(player_choice[:id])
    end

    def selection(choice_ID) 
        choices.map { |choice_object|
        if(choice_object.last_choiceID == choice_ID)
            level(choice_object)    
        end
    }

    end

    def story 
        level(choices[0]) ## ['00']
        current_selection = 0
        until @isGameOver == true do
            selection(choice_ids[current_selection])
            current_selection += 1
        end
    end    
end