require_relative 'Cli.rb'


player = Cli.determinePlayer
#if Player has Progress -> story.findWhereLeftOff  ELSE -> story.begin 
Choice.setPlayer(player)
Choice.create
Cli.assignPlayerToStory(player)




