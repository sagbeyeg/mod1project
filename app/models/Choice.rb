require_relative 'Player.rb'

class Choice
    attr_reader :question, :a_choice, :b_choice, :last_choiceID
    attr_accessor :player

    @@all = []
   
    
    def initialize(question, a_choice, b_choice, last_choiceID)
        @question = question
        @a_choice = a_choice
        @b_choice = b_choice
        @last_choiceID = last_choiceID
        @player = player
        @@all.push(self)
    end
    


    def self.all
        @@all
    end


end

