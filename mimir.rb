# frozen_string_literal: true

# This simple bot responds to every "Ping!" message with a "Pong!"

require 'discordrb'
require 'dotenv'

Dotenv.load
bot = Discordrb::Bot.new token: ENV['DISCORD_TOKEN']

puts "This bot's invite URL is #{bot.invite_url}."
puts 'Click on it to invite it to your server.'

# This method call adds an event handler that will be called on any message that exactly contains the string "Ping!".
# The code inside it will be executed, and a "Pong!" response will be sent to the channel.
bot.message(content: 'Ping!') do |event|
  event.respond 'Pong!'
end

# This method call has to be put at the end of your script, it is what makes the bot actually connect to Discord. If you
# leave it out (try it!) the script will simply stop and the bot will not appear online.
bot.run