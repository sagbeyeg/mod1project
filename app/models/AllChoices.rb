intro = "Midnight. You’ve been out for a while and are finding your way back home. \n
You don’t remember how you got here or where you came from, however, this forest seems familiar, \n
but you can’t be too sure. \n(A) You venture into the woods \n(B) You decide to head back home"


choice = Choice.new(intro, { id: 'A', gameOver?: false }, {id: 'B', gameOver?: false}) ##the 0 index of storys.choices

choice_storyline1_A = Choice.new("You went into the woods \n (A) You go further (B) You head back", 
{id: 'A', gameOver?: false }, {id: 'B', gameOver?: false, text: 'You lost!'}) ##Storys.choices index == 1

choice_storyline1_B = Choice.new("You went home \n (A) You go further (B) You head back", 
{ id: 'A', gameOver?: false }, {id: 'B', gameOver?: true, text: 'You lost!'}) ## Storys.choices index == 2

