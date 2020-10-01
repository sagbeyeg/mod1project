require_relative 'Choice.rb'


class Story < ActiveRecord::Base
    
    # checkIfProgressSaved

    # findWhereLeftOff 
    # Player.lastChoice_ID -> map through Choice.all and find the Choice that has the same last choice ID 


    def gameOver?(choice)
        if(choice[:gameOver?])
            puts choice[:text]
            @isGameOver = true 
        end
    end

    def level(choice)

        puts choice.question 
        user_input = gets.chomp
        player_choice = (user_input.upcase == 'A') ? choice.a_choice : choice.b_choice
        gameOver?(player_choice)
        lastChoice = player_choice[:id]
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
        until @isGameOver == true do
            selection(lastChoice)
        end
    end    
end

