class Player
	attr_reader :name, :choice_id

	def initialize(name)
		@name = name
		@choice_ids = []
	end
end

class Choice
    attr_reader :question, :a_choice, :b_choice
    
    @@all = []
    
    def initialize(question, a_choice, b_choice)
        @question = question
        @a_choice = a_choice
        @b_choice = b_choice
        @@all.push(self)
    end
    
    def self.all
        @@all
    end


end


class Story
	attr_reader :choices, :choice_ids

	def initialize()
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
        selection(2)

    end





    

end


player1 = Player.new('Ab')

choice = Choice.new("Midnight. You’ve been out for a while and are finding your way back home. \n 
You don’t remember how you got here or where you came from, however, this forest seems familiar, \n
but you can’t be too sure. \n(A) You venture into the woods \n(B) You decide to head back home", 
{ id: 'A', gameOver?: false }, {id: 'B', gameOver?: true, text: 'You lost!'}) ##the 0 index of storys.choices

choice_storyline1_A = Choice.new("You went into the woods \n (A) You go further (B) You head back", 
{id: 'A', gameOver?: false }, {id: 'B', gameOver?: true, text: 'You lost!'}) ##Storys.choices index == 1

choice_storyline1_B = Choice.new("You went home \n (A) You go further (B) You head back", 
{ id: 'A', gameOver?: false }, {id: 'B', gameOver?: true, text: 'You lost!'}) ## Storys.choices index == 2



ourStory = Story.new()

ourStory.story




## number system for choices will greatly reduce the layers of complexity 