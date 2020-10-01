require_relative 'Cli.rb'


player = Cli.determinePlayer
# story.player = player 
# check player Progress 
# if Player has Progress -> story.findWhereLeftOff  ELSE -> story.begin 
# story = Story.new
Choice.create
Choice.setPlayer(player)
Cli.assignPlayerToStory(player)


## here we have on uneven amount of gameovers and it works ^-^


