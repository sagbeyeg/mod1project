require  'active_record'

class Player < ActiveRecord::Base

	@@playerName = ''

	def name 
		self.name
	end

	def self.playerName
        @@playerName
    end

	def self.playerName=(playerName)	
        @@playerName = playerName
    end
end
