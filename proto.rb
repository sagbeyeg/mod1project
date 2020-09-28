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

    def level(index)
        puts choices[index].question
        user_input = gets.chomp
        if(user_input == 'A')
            choice_ids.push(choices[index].a_choice)
        elsif (user_input == 'B')
            choice_ids.push(choices[index].b_choice)
        
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

choiceA = Choice.new("Midnight. You’ve been out for a while and are finding your way back home. \n 
You don’t remember how you got here or where you came from, however, this forest seems familiar, \n
but you can’t be too sure. \n (A) You venture into the woods \n (B) You decide to head back home", 'A', 'B') ##the 0 index of storys.choices
choiceB = Choice.new("You went into the woods \n (A) You go further (B) You head back", 'A', 'B') ##Storys.choices index == 1
choiceC = Choice.new("You went home \n (A) You go further (B) You head back", "A", 'B') ## Storys.choices index == 2



ourStory = Story.new()

ourStory.story




## number system for choices will greatly reduce the layers of complexity 