require  'active_record'

class Player < ActiveRecord::Base

	@@playerName = ''

	def self.find_user(username)
		Player.all.map { |player| 
		if(player.username == username)
			player
		end
		}
	end

	def self.playerName
        @@playerName
    end

	def self.playerName=(playerName)	
        @@playerName = playerName
    end
end
