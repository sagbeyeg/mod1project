require_relative 'Player.rb'

class Choice
    attr_reader :question, :a_choice, :b_choice, :last_choiceID
    
    @@player = nil
    @@all = []
   
    
    def initialize(question, a_choice, b_choice, last_choiceID)
        @question = question
        @a_choice = a_choice
        @b_choice = b_choice
        @last_choiceID = last_choiceID
        @@all.push(self)
    end
    
    def self.setPlayer(player)
        @@player = player
    end

    def self.player_name
        @@player.name
    end

    # choice.player_name to ref current player
    
    def self.create 
        intro = "\n\nPRESS S TO SAVE YOUR PROGRESS AT ANY LEVEL \nPRESS A TO SELECT CHOICE A \nPRESS B TO SELECT CHOICE B \n\nBEGIN
        You're running scared, you have no idea how you got here, where *here* even is, or why you're almost certain 
        that slowing down would mean your deathgit . As you turn the corner you see...a pitch black wall? No...
        it's a dome reaching up so high that you'd mistaken it for the night sky. Do you? 
        \n(A) Touch the dome, it could be dangerous, but you get the feeling that it could jog your memory
        \n(B) Forget about the wall! Potential death is approaching! Run!"
        choice = Choice.new(intro, { id: '0A', gameOver?: false }, 
        {id: '0B', gameOver?: true, text: "\n\nYou missed your only escape! You died!\n GAME OVER! YOU LOST"}, '00')


        #LEVEL 1 -> From intro, (A) you touch the dome
        choice_level1 = Choice.new("\n\nLEVEL 1
        You touch the wall, and you don't die, yay! Instead your hand passes through the dome...
        what the heck?! The air feels humid on the other side. Do you? 
        \n (A) Take a chance and find out what's on the other side of the dome, it can't be worse than almost certain 
        death, right?
        \n (B) Forget about the wall! Potential death is approaching!",
        {id: '1A', gameOver?: false },
        {id: '1B', gameOver?: true, text: "\n\nYou missed your only escape! You died!\n GAME OVER! YOU LOST"}, '0A') 

        #LEVEL 2 -> From level 1, (A) you ran away from the dome
        choice_level2 = Choice.new("\n\nLEVEL 2
        You step through the dome and you are greeted by the sight of a rainforest, birds chirping,
        frogs croaking, towering trees and of course, humidity. You turn around and the dome 
        is gone, there is only forest as far as you can see. If you strain your ears you can 
        hear the faint sound of...elevator music?
        \n (A) Taking a chance has worked for you so far, you follow the music
        \n (B) Why would there be music in a rainforest? That can't mean anything good for you, you head in the opposite direction", 
        { id: '2A', gameOver?: true, text: "\n\nYou fell right into their trap! Let's hope the experiments don't hurt too badly. \nGAME OVER! YOU LOST!"}, 
        {id: '2B', gameOver?: false}, '1A')

        #LEVEL 3 -> From level 2, (B) you head away from the music
        choice_level3 = Choice.new("\n\nLEVEL 3
        You step carefully in the opposite direction, well aware that any careless step could lead to 
        death by anaconda, jaguar, or even centipede. You're only a few paces into your chosen path 
        when you hear what sounds like someone crashing through the forest, heading in your direction!
        \n (A) HIDE! You have no idea what's going on and they could be dangerous!
        \n (B) They might know something about who you are or what's going on. You decide to wait for them, but you grab a heavy stick just
        in case they aren't too friendly", 
        { id: '3A', gameOver?: true, text: "\n\nYou slip into the dense undergrowth and your hand brushes against something. It's a snake! It bites you and you die! \nGAME OVER! YOU LOST!"}, 
        { id: '3B', gameOver?: false}, '2B') 


        #LEVEL 4 -> From level 3, (B) you wait for the approaching person
        choice_level4 = Choice.new("\n\nLEVEL 4
        The person approaches you panting but with a huge smile on their face, they say, '#{Choice.player_name.upcase}! 
        I looked everywhere! I'm so glad I found you!', and reach out to hug you. Do you?
        \n (A) Hit them! Clearly this is a trap!
        \n (B) Permit the hug. Maybe you can trust them? A hug wouldn't hurt, you could use some comfort", 
        { id: '4A', gameOver?: true, text: "\n\nOh no! You hit too hard! You've killed your only chance of escape! \nGAME OVER! YOU LOST!"}, 
        { id: '4B', gameOver?: false}, '3B')


        #LEVEL 5 -> From level 4, (B) you permit the hug
        choice_level5 = Choice.new("\n\nLEVEL 5
        As this person hugs you, your memories come flooding back! Unfortunately that has also causes 
        a blinding headache and as you reach up to clutch you head you... 
        \n (A) Feel blood dripping out of your nose
        \n (B) Feel blood dripping out of your ears", 
        { id: '5A', gameOver?: false}, 
        { id: '5B', gameOver?: true, text: "\n\nOh no! There was a reason why you didn't have these memories! It's too much! Too many lifetimes! You have a brain aneurism and die! \nGAME OVER! YOU LOST!"}, '4B')


        #LEVEL 6 -> From level 5, (B) you feel blood drip from your nose
        choice_level6 = Choice.new("\n\nFINAL LEVEL 
        You remember everything! Your life...no, their life, this body is only your host... The reason 
        you're here...your planet is dying and you are an envoy of your species meant to eradicate 
        all humans and claim this planet. You are their only hope for survival!
        \n (A) Use your newfound abilities to destroy all of Earth's human inhabitants.
        \n (B) Content yourself with a life on Earth and the guilt of betraying your entire species", 
        { id: '6A', gameOver?: false, text: "\n\nAs you gear up to destroy an entire species (not yours, of course), you begin to realize that you powers 
        are greater than you ever imagined. You need not be confined to mortal concerns, you are beyond death! \nGAME OVER! YOU WON! For now...
        Your journey awaits in SEQUENCE: THE EPILOGUE"}, 
        { id: '6B', gameOver?: true, text: "\n\nYou have condemned your species to death! Wow, you are cold-blooded! Unfortunately, several government were on your
        tail! You are caught and experimented on! \nGAME OVER! YOU LOST!"}, '5A')
    end

    def self.all
        @@all
    end


end

