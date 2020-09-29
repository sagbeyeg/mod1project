require 'ruby2d'
require_relative 'Choice.rb'
require 'ruby2d.rb'

class Story
    attr_reader :choices, :choice_ids, :isGameOver,  :user_input
    attr_accessor :p_selection, :current_selection, :ourStory
    def initialize(player)
        @player = player
		@choices = Choice.all
        @choice_ids = []
        @isGameOver = false
        @p_selection = 0
        @current_selection = 0
    end

    def gameOver?(choice)
        if(choice[:gameOver?])
            puts choice[:text]
            @isGameOver = true 
        end
    end
        

    def level(choice)
 
        title_text = Text.new(choice.question, font: "fonts/Amatic-Bold.ttf", size: 30, y: 80, z: 160,  color: "white")
        title_text.x = (Window.width - title_text.width) / 2
        
        if(user_input == 'A') 
            puts user_input
            player_choice = choice.a_choice
            user_input = nil

            gameOver?(player_choice)
            choice_ids.push(player_choice[:id])
        elsif(user_input == 'B') 
            player_choice = choice.b_choice
            user_input = nil

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
    
    def increaseSelection 
        current_selection += 1
        current_selection
    end
    
    def ourStory
        @ourStory = Story.new
    end

    def selectionCheck 
        if p_selection  == current_selection - 1 
            p_selection += 1 
            return true
        else 
            return false
        end
    end

    def grabInput(x)
        user_input = x
    end

    def story 
        if current_selection == 0
            level(choices[0]) ## ['00']
        end

      
      
        if(selectionCheck == true)
            selection(choice_ids[current_selection])
        end
       
    end    

end

on :key_down do |event|
    if(event.key == 'a') 
        ourStory.increaseSelection
        ourStory.grabInput('A')
        ourStory.story
        
    elsif(event.key == 'b') 
        ourStory.increaseSelection
        ourStory.grabInput('B')
        ourStory.story
   end
end