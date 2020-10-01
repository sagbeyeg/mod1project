
class Cli 
    def initialize
    end


    def grabInput(msg)
    end

    def self.determinePlayer# #INTRO
        p 'Welcome to Sequence, (A)Create Account (B) Sign in'
        response = gets.chomp
        if(response == 'A')
            p 'Enter your name'
            name = gets.chomp
            p 'Enter your username'
            username = gets.chomp
            player = Player.create({ name: name , username: username })
            elsif(response == 'B')
            p 'Enter your username'
            username = gets.chomp
            player = Player.find_by(username: username)
            if(player == nil)
                p "That username didnt exist, but it's yours now! Whats your *og* name?"
                name = gets.chomp
                player = Player.create({name:name, username: username})
            end
        end
        player  
    end
end
