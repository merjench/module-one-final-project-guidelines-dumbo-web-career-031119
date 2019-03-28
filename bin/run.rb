
require_relative '../config/environment'
require 'pry'
system 'clear'
# $prompt = TTY::Prompt.new
$current_user
#
# def graph
#   puts "       .--.                   .---.
#    .---|__|           .-.     |~~~|
# .--|===|--|_          |_|     |~~~|--.
# |  |===|  |'\     .---!~|  .--|   |--|
# |%%|   |  |.'\    |===| |--|%%|   |  |
# |%%|   |  |\.'\   |   | |__|  |   |  |
# |  |   |  | \  \  |===| |==|  |   |  |
# |  |   |__|  \.'\ |   |_|__|  |~~~|__|
# |  |===|--|   \.'\|===|~|--|%%|~~~|--|
# ^--^---'--^    `-'`---^-^--^--^---'--'"
# end

puts "Welcome to YourBooks App!"

def prompt_method
  prompt = TTY::Prompt.new
end


def welcome
  system 'clear'
  prompt = prompt_method
  prompt.select("") do |welcome|
    welcome.choice "Sign Up", -> {sign_up}
    welcome.choice "Sign In", -> {sign_in}
  end
end

def sign_up
  system 'clear'
  prompt = prompt_method
  name = prompt.ask('What is your name?')
  bio = prompt.ask('What is your bio?')
  if User.find_by(name: name) != nil
    puts "Sorry, username is taken. Try again."
  else
    $current_user = User.create(name: name, bio: bio)
    puts "You have signed up and successfully logged in. Enjoy!"
    main_menu_option
  end
end

def update_bio
  system 'clear'
  prompt = prompt_method
  bio = prompt.ask('What is your new bio?')
  $current_user.update(bio: bio)
  main_menu_option
end

def delete_account
  prompt = prompt_method
  bio = prompt.ask('What is your new bio?')
  $current_user.delete
  # exit
end

def sign_in
  system 'clear'
  prompt = prompt_method
  name = prompt.ask('What is your name?', default: ENV['USER'])
  $current_user = User.find_by(name: name)
  if $current_user == nil
    puts "We don't have you in file, please try again"
  else
    puts "Welcome #{name}!"
    main_menu_option
  end
end


def main_menu_option
  # system 'clear'
  prompt = prompt_method
    main_menu_option = prompt.select("") do |menu|
    menu.choice "Today's Top Picks", -> {Book.popular_books}
    menu.choice "View All books", -> {all_current_books_list}
    menu.choice "View Checkout Books", -> {return_book}
    # menu.choice "Create New List", -> {create_new_book_list}
    # # x.choice "Titles You Saved", -> {user_saved_books}
    # # x.choice "Update a Book", -> {update_book}
    # x.choice "Remove a Book", -> {delete_book}
    # x.choice "User Menu", -> {user_menu}
    # menu.choice "Review a Book", -> {review_book}
    menu.choice "Update Your Bio", -> {update_bio}
    menu.choice "Checkout", -> {checkout}
    menu.choice "Exit", -> {quit}
    menu.choice "Delete Your Account", -> {delete_account}
    end
  end

  def checkout
    prompt = prompt_method
    book_name = prompt.select ("") do |menu|
      Book.shows_by_alphabetical_order.each do |book|
        menu.choice book.name
      end
    end
    book = Book.find_by(name: book_name)
    checkout = Checkout.create(user_id: $current_user.id, book_id: book.id)
  end


  def return_book
    if $current_user.books.count == 0
      puts "You don't have any books checked out"
      return
    end
    prompt = prompt_method
    book_name = prompt.select ("") do |menu|
      $current_user.books.each do |book|
        menu.choice book.name
      end
    end
    puts book_name
    book = Book.find_by(name: book_name)
    checkout = Checkout.find_by(user_id: $current_user, book_id: book.id)
    checkout.delete
    main_menu_option
  end

    # def popular_books
    #   Book.popular_books.each do |book|
    #     puts book.name
    #   end
    # end


  def all_current_books_list
    prompt = prompt_method

    prompt.select("") do |list|
      list.choice "Show by alphabetical Order", -> {Book.shows_by_alphabetical_order}
      list.choice "Search by book title", -> {book_title}
      list.choice "Search by author", -> {book_author}
      # list.choce "Search by price" -> {book_price},
    end
  end

#   puts welcome_page
# prompt = TTY::Prompt.new
#     if welcome_page == 'Sign Up'
#       if user.find_by(name: username) != nil
#         puts "Sorry, username is taken. Try again."
#       else current_user = User.create(name: username, email: email_address)
#         puts "You are signed up. Enjoy!"
#       end
#     elsif welcome_page == 'Sign In'
#         current_user == prompt.ask('What is your name?', default: ENV['USER'])
#       # if current_user == nil
#         puts "Welcome!"
#         sleep(5)
#         main_menu
#       end
#
#
#   def sign_in(name)
#   $current_user = User.find_by(name: name)
#   if $current_user == nil
#     puts "Your username or password is incorrect. Please try again."
#   end
# end
#

#   #
#   # hello_info = prompt.yes?('Would you like to view your current books?')
#
#   #







#
#   current_user = nil
#     if welcome_page == 'Sign Up'
#       if user.find_by(name: username) != nil
#         puts "Sorry, username is taken. Try again."
#       else current_user = User.create(name: username, email: email_address)
#         puts "You are signed up. Enjoy!"
#       end
#     elsif welcome_page == 'Sign Up'
#       current_user == User.find_by(name: username)
#       if current_user == nil
#         puts "Your Username is incorrect. Please try again."
#       end
#     end
#   end
# #


welcome
