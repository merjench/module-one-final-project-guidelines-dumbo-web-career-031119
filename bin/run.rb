
require_relative '../config/environment'
require 'pry'
# system 'clear'
require 'colorize'
# $prompt = TTY::Prompt.new

$current_user

def graph
  puts "       .--.                 .---.
   .---|__|         .-.     |~~~|
.--|===|--|_        |_|     |~~~|--.
|  |===|  |'\    .---!~|  .--|   |--|
|%%|   |  |.'\   |===| |--|%%|   |  |
|%%|   |  |\.'\   |   | |__|  |   |  |
|  |   |  | \  \  |===| |==|  |   |  |
|  |   |__|  \.'\ |   |_|__|  |~~~|__|
|  |===|--|   \.'\|===|~|--|%%|~~~|--|
^--^---'--^    `-'`---^-^--^--^---'--'"
# .colorize(:red)
end

puts "Welcome to YourBooks App!"

def prompt_method
  prompt = TTY::Prompt.new
end


def welcome
  graph
  # system 'clear'
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
    welcome
    return
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
  account = prompt.ask('Are you sure you want to delete your account?')
      # do |y|
    # y.choice "Yes", -> {good_bye}
    $current_user.delete
    # y.choice "No", -> {main_menu_option}
  end
# end


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
    menu.choice "Return a Book", -> {return_book}
    # menu.choice "Create New List", -> {create_new_book_list}
    # # x.choice "Titles You Saved", -> {user_saved_books}
    # # x.choice "Update a Book", -> {update_book}
    # x.choice "Remove a Book", -> {delete_book}
    # x.choice "User Menu", -> {user_menu}
    # menu.choice "Review a Book", -> {review_book}
    menu.choice "Update Your Bio", -> {update_bio}
    menu.choice "Checkout", -> {checkout}
    menu.choice "Delete Your Account", -> {delete_account}
    menu.choice "Exit", -> {quit}
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
    main_menu_option
  end


  def return_book
    if $current_user.books.count == 0
      puts "You don't have any books checked out"
      main_menu_option
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


  def all_current_books_list
    prompt = prompt_method

    prompt.select("") do |list|
      list.choice "Show by alphabetical Order", -> {Book.shows_by_alphabetical_order}
      list.choice "Search by book title", -> {book_title}
      list.choice "Search by author", -> {book_author}
      # list.choce "Search by price" -> {book_price},
    end
  end

  def find_book_by_title(name)
    Book.all.find_by(name: name)
  end

  def book_title
    prompt = prompt_method

  end





welcome
