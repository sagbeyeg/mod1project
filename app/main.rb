require  'active_record'
require_relative 'models/Player.rb'
require_relative '../config/environment'
# require_relative 'models/Story.rb'
# require_relative 'models/AllChoices.rb'

p 'name'
name = gets.chomp

p 'id'
id = gets.chomp

player = Player.create({ name: name , LastChoice_ID: id})
# story = Story.new
 
p player.inspect
# story.story