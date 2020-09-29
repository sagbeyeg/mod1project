class Choice
    attr_reader :question, :a_choice, :b_choice, :last_choiceID
    
    @@all = []
    
    def initialize(question, a_choice, b_choice, last_choiceID)
        @question = question
        @a_choice = a_choice
        @b_choice = b_choice
        @last_choiceID = last_choiceID
        @@all.push(self)
    end
    
    def self.all
        @@all
    end


end

