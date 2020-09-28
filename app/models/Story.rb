# require 'ruby2d'
require_relative 'Choice.rb'
# require 'ruby2d.rb'

class Story
	attr_reader :choices, :choice_ids

    def initialize(player)
        @player = player
		@choices = Choice.all
        @choice_ids = []
    end

    def gameOver?(choice)
        if(choice[:gameOver?])
            puts choice[:text]
            exit
        end
    end

    def level(index)
        choice = choices[index]

        puts choice.question 

        # on :key_down do |event|
        #     user_input  == 'A'
        #   end
        # on :key_up do |event|
        #     # A key was pressed
        #     user_input == 'B'
        #   end

        user_input = gets.chomp
        if(user_input == 'A')
            gameOver?(choice.a_choice)
            choice_ids.push(choice.a_choice[:id])
        elsif (user_input == 'B')
            gameOver?(choice.b_choice)
            choice_ids.push(choice.b_choice[:id])
        end
    end

    def selection(index) 
        if(choice_ids[index] == 'A')
             level(index + 1) ## INDEX + 1
        else(choice_ids[index] == 'B')
            level(index + 2)  ## INDEX + 2
        end
    end

    def story 
        level(0)     ## ['A']
        selection(0) ## ['A', 'A'] 
        selection(1) ## ['A', 'A', 'B']
    end    

end