require_relative '../config/environment'

ActiveRecord::Migration.check_pending!


prompt = TTY::Prompt.new

prompt.ask('What is your name?', default: ENV['USER'])


# binding.pry

# cli = CommandLineInterface.new
# cli.greet




run
