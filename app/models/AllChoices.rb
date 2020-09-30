
intro = "Midnight. You’ve been out for a while and are finding your way back home. \n
You don’t remember how you got here or where you came from, however, this forest seems familiar, \n
but you can’t be too sure. \n(A) You venture into the woods \n(B) You run back home"
choice = Choice.new(intro, { id: '0A', gameOver?: false }, {id: '0B', gameOver?: false}, '00')



choice_level1_0A = Choice.new("You went into the woods \n(A) You go further (B) You head back", 
{id: '1A', gameOver?: false },
{id: '1B', gameOver?: false}, '0A') 


choice_level1_0B = Choice.new("You ran back home home \n(A) Make lunch (B) Go to sleep", 
{ id: '2A', gameOver?: false }, 
{id: '2B', gameOver?: true, text: 'You sleep, ya lose!'}, '0B')


choice_level2_1A = Choice.new("Further into the woods you go, you now see a fox \n(A) Fight Fox (B)Ignore Fox", 
{ id: '3A', gameOver?: true, text: "Dont fight animals! You lose"}, 
{ id: '3B', gameOver?: true, text: 'Dont ignore animals! You lose'}, '1A')

choice_level2_1B = Choice.new("After going into the woods you decide to head back home, on the way home you see a ghost \n(A) Fight Ghost (B) Ignore Ghost", 
{ id: '4A', gameOver?: true, text: "You lose(Dont fight ghost)!"}, 
{ id: '4B', gameOver?: false}, '1B')

choice_level2_2A = Choice.new("Lunch was great! Now what? \n(A) Go to sleep (B) Take a nap",
 {id: '5A', gameOver?: true, text: 'You sleep, ya lose!'}, 
 {id: '5B', gameOver?: true, text: 'You sleep, ya lose!'}, '2A')

 choice_level3_4B = Choice.new("You ignored that Ghost good! Now what? \n(A) Go to sleep (B) Take a nap",  
 {id: '6A', gameOver?: true, text: 'You sleep, ya lose!'}, 
 {id: '6B', gameOver?: true, text: 'You sleep, ya lose!'}, '4B')

 

## here we have on uneven amount of gameovers and it works ^-^


