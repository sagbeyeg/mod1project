
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






choice = Choice.new("Midnight. You’ve been out for a while and are finding your way back home. \n 
You don’t remember how you got here or where you came from, however, this forest seems familiar, \n
but you can’t be too sure. \n(A) You venture into the woods \n(B) You decide to head back home", 
{ id: 'A', gameOver?: false }, {id: 'B', gameOver?: true, text: 'You lost!'}) ##the 0 index of storys.choices

choice_storyline1_A = Choice.new("You went into the woods \n (A) You go further (B) You head back", 
{id: 'A', gameOver?: false }, {id: 'B', gameOver?: false, text: 'You lost!'}) ##Storys.choices index == 1

choice_storyline1_B = Choice.new("You went home \n (A) You go further (B) You head back", 
{ id: 'A', gameOver?: false }, {id: 'B', gameOver?: true, text: 'You lost!'}) ## Storys.choices index == 2




ourStory.story


## number system for choices will greatly reduce the layers of complexity 