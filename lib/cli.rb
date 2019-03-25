

def greet
  puts 'Welcome to YourBooks App, the best resource for audio books in the world!'
end

def run
  greet
  puts "Thinking about reading something but not sure what you are in the mood for? We can help you with that decision!"
  puts "Please enter a book genre to get started:"
  book_genre = gets.chomp
  # What could we put here to allow a user to type a response?
  #Boook.find_by(subject: subject_name)
end
