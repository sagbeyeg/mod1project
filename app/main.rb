require 'active_record'
require_relative 'models/Player.rb'
require_relative '../config/environment'
require_relative 'models/Story.rb'
require_relative 'models/Cli.rb'


player = Cli.determinePlayer
#if Player has Progress -> story.findWhereLeftOff  ELSE -> story.begin 
Choice.setPlayer(player)
Choice.create
Cli.assignPlayerToStory(player)




