# require_relative 'Cli.rb'


# player = Cli.determinePlayer
# # story.player = player 
# # check player Progress 
# # if Player has Progress -> story.findWhereLeftOff  ELSE -> story.begin 
# # story = Story.new
 
# story = Story.create({isGameOver: false, lastChoice: '00'})

# story.player = player

# story.playerName

# intro = "You're running scared, you have no idea how you got here, where *here* even is, or why you're almost certain 
#     \nthat slowing down would mean your death. As you turn the corner you see... A pitch black wall? No...it's a dome 
#     \nreaching up so high that you'd mistaken it for the night sky. Do you? 
#     \n(A) Touch the dome, it could be dangerous, but you get the feeling that it could jog your memory
#     \n(B) Forget about the wall! Potential death is approaching! Run!"
# choice = Choice.new(intro, { id: '0A', gameOver?: false }, {id: '0B', gameOver?: false}, '00')


# #LEVEL 1 -> From intro, (A) you touch the dome
# choice_level1_0A = Choice.new("You touch the wall, and you don't die, yay! Instead your hand passes through  
#     the dome... What the heck?! The air feels humid on the other side. Do you? 
#     \n (A) Take a chance and find out what's on the other side of the dome, it can't be worse than almost certain 
#     \n     death, right?
#     \n (B) Forget about the wall! Potential death is approaching!",
# {id: '1A', gameOver?: false },
# {id: '1B', gameOver?: true, text: "You lost your only hope of escape! You died!\n GAME OVER! YOU LOST"}, '0A') 

# #LEVEL 2 -> From level 1, (A) you ran away from the dome
# choice_level2_0B = Choice.new("You step through the dome and you are greeted by the sight of a rainforest,
#     \n birds chirping, frogs croaking, towering trees and of course, humidity. You turn around and the dome
#     \n is gone, there is only forest as far as you can see. If you strain your ears you can hear the faint sound of...elevator music?
#     \n (A) Taking a chance has worked for you so far, you follow the music
#     \n (B) Why would there be music in a rainforest? That can't mean anything good for you, you head in the opposite direction", 
# { id: '2A', gameOver?: true, text: "You fell right into their trap! Let's hope the experiments don't hurt too badly. \nGAME OVER! YOU LOST!"}, 
# {id: '2B', gameOver?: false}, '1A')

# #LEVEL 3 -> From level 2, (B) you head away from the music
# choice_level2_1A = Choice.new("You step carefully in the opposite direction, well aware that any careless step could lead to death by 
#     \n anaconda, jaguar, or even centipede. You're only a few paces into your chosen path when you hear what sounds like someone 
#     \n crashing through the forest, heading in your direction!
#     \n (A) HIDE! You have no idea what's going on and they could be dangerous!
#     \n (B) They might know something about who you are or what's going on. You decide to wait for them, but you grab a heavy stick just
#     \n in case they aren't too friendly", 
# { id: '3A', gameOver?: true, text: "You slip into the dense undergrowth and your brushes against something. It's a snake! It bites you and you die \nGAME OVER! YOU LOST!"}, 
# { id: '3B', gameOver?: false}, '2B') 


# #LEVEL 4 -> From level 3, (B) you wait for the approaching person
# choice_level2_1B = Choice.new("The person approaches you panting but with a huge smile on their face, they say, 'I'm so glad a found you!', and reach out to hug you. Do you?
#  \n (A) Hit them! Clearly this is a trap!
#  \n (B) Permit the hug. Maybe you can trust them? A hug wouldn't hurt, you could use some comfort", 
# { id: '4A', gameOver?: true, text: "Oh no! You hit too hard! You've killed your only chance of escape \nGAME OVER! YOU LOST!"}, 
# { id: '4B', gameOver?: true, text: "As they hug you all your memories come rushing back! This is your partner! You're safe! \nGAME OVER! YOU WON!"}, '3B')

# #LEVEL 5 -> From level 4, (B) you permit the hug
# choice_level5 = Choice.new("As this person hugs you, your memories come flooding back! They are your partner and they've come to rescue you from Purgatory..?
#  \n Not the place between heaven and hell (although that might have been easier to escape), Purgatory is a sick game show that you were 'lucky' enough to be 
#  \n invited to.
#  \n (A) Hit them! Clearly this is a trap!
#  \n (B) Permit the hug. Maybe you can trust them? A hug wouldn't hurt, you could use some comfort", 
# { id: '4A', gameOver?: true, text: "Oh no! You hit too hard! You've killed your only chance of escape \nGAME OVER! YOU LOST!"}, 
# { id: '4B', gameOver?: false}, '3B')

 

# ## here we have on uneven amount of gameovers and it works ^-^


