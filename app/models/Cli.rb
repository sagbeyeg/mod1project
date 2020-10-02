
class Cli 

    def self.grabInput(msg)
        puts msg
        gets.chomp
    end

    def self.allUsernames
        Player.all.map { |player| player.username}
    end

    def self.determinePlayer# #INTRO
        response = grabInput("\n\nWELCOME TO SEQUENCE! Select an option! \n(A)Create Account (B) Sign in")
        if(response == 'A')
            name = grabInput("\nEnter your name")
            username = grabInput("\nEnter your username")
            until (allUsernames.include?(username) == false) do
                username = grabInput("\nEnter your username")
            end
            player = Player.create({ name: name , username: username })
            elsif(response == 'B')
            username = grabInput("\nEnter your username")
            player = Player.find_by(username: username)
            if(player == nil)
                name = grabInput("\nThat username didnt exist, but it's yours now! Whats your *og* name?")
                player = Player.create({name:name, username: username})
            end
        end
        player  
    end

    def self.assignPlayerToStory(player)
        story = Story.create({isGameOver: false, lastChoice: '00'})
        story.player = player
        playerHasProgress?(story)
    end


    def self.playerHasProgress?(story)
        if(story.player.deaths == nil)
            story.player.deaths = 0
        end

        if(story.player.LastChoice_ID == nil)
            story.story
        else
            response = grabInput('(A) Continue where you left off or (B) start from the beginning?')
            (response == 'A') ? story.startFrom(story.player.LastChoice_ID) : story.story    
        end

    end
    
end
