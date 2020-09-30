class Player
	attr_accessor :name

	@@playerName = ''

	def initialize(name)
		@name = name
	end

	def self.playerName
        @@playerName
    end

	def self.playerName=(playerName)	
        @@playerName = playerName
    end
end
