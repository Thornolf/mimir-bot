# frozen_string_literal: true

require 'discordrb'
require 'dotenv'

class Mimir
  def perform
    Dotenv.load
    bot = Discordrb::Commands::CommandBot.new token: ENV['DISCORD_TOKEN'], prefix: '!'

    bot.command(
      :random,
      min_args: 0,
      max_args: 2,
      description: 'Generates a random number between 0 and 1, 0 and max or min and max.',
      usage: 'random [min/max] [max]') do |_event, min, max|
      if max
        rand(min.to_i..max.to_i)
      elsif min
        rand(0..min.to_i)
      else
        rand
      end
    end

    bot.command(:exit, help_available: false) do |event|
      break unless event.user.id.to_s == ENV['ID_OWNER']

      bot.send_message(event.channel.id, 'Bot is shutting down')
      exit
    end

    bot.run
  end
end

Mimir.new.perform
