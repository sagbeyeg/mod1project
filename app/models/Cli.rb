
class Cli 

    def self.grabInput(msg)
        puts msg
        gets.chomp
    end

    def self.allUsernames
        Player.all.map { |player| player.username}
    end

    def self.determinePlayer# #INTRO
        response = grabInput('Welcome to Sequence, (A)Create Account (B) Sign in')
        if(response == 'A')
            name = grabInput('Enter your name')
            username = grabInput('Enter your username')
            until (allUsernames.include?(username) == false) do
                username = grabInput('Enter your username')
            end
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

    def self.assignPlayerToStory(player)
        p player.LastChoice_ID
        story = Story.create({isGameOver: false, lastChoice: '00'})
        story.player = player
        p story.player
        playerHasProgress?(story)
    end

    def self.playerHasProgress?(story)
        if(story.player.LastChoice_ID != nil)
            response = grabInput('(A) Continue where you left off or (B) start from the beginning?')
            if (response == 'A')  
                story.startFrom(story.player.LastChoice_ID) 
            else
                story.player.LastChoice_ID = '00'
                story.story
            end
        else
            story.story
        end

    end
    
end
