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

