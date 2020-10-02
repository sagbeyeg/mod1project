require_relative 'Choice.rb'

class Story < ActiveRecord::Base
    belongs_to :player

    def choices 
        Choice.all
    end

    def gameOver?(choice)
        if(choice[:gameOver?])
            if(choice[:id] == '6A')
                puts choice[:text]
            else
                puts choice[:text]
                puts "Wow #{self.player.username} you've died #{self.player.deaths + 1}"

                Player.create({name: self.player.name, username: self.player.username, LastChoice_ID: nil, deaths: self.player.deaths + 1})
                Player.destroy_by(id: self.player.id)
            end
            
            self.isGameOver = true 
        end
    end

    def grabInput(msg)
        puts msg
        gets.chomp
    end

    def level(choice)
        user_input = grabInput(choice.question)
        gameSaved?(user_input)
        player_choice = (user_input.upcase == 'A') ? choice.a_choice : choice.b_choice
        gameOver?(player_choice)
        self.lastChoice = player_choice[:id]
    end

    def gameSaved?(user_input)
        if(user_input == 'S')
            Player.create({name: self.player.name, username: self.player.username, LastChoice_ID: self.lastChoice})
            Player.destroy_by(id: self.player.id)
            exit 
        end
    end

    def selection(choice_ID) 
        choices.map { |choice_object|
        if(choice_object.last_choiceID == choice_ID)
            level(choice_object)    
        end
    }
    end

    def startFrom(id)
        selection(id)
        until self.isGameOver == true do
            selection(lastChoice)
        end
    end

    def story 
        level(choices[0]) ## ['00']
        until self.isGameOver == true do
            selection(lastChoice)
        end
    end    
end

