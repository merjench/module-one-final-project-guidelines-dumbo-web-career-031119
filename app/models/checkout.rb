require 'pry'

class Checkout < ActiveRecord::Base

  belongs_to :book  # returns book instance that was checked out at this time 

  belongs_to :user



  def can_be_instantiated_and_then_saved (name, author, price, subject, rating)
    book = Book.create(name: name, author: author, price: price, subject: subject, rating: rating)
    book.name = "This is a title."
    book.save
  end

 # # book1 = Book.create(name: "Educated", author: "Tara Westover", price: 18.50, subject: "Memoir", rating: 5)
 #  def can_be_created_with_a_hash_of_attributes(name, author, price, subject, rating)
 #  # Initialize a book and then and save it
 #  attributes = {
 #      name: "The Sting",
 #      author: "Another String",
 #      price: 11,
 #      subject: "subject_name",
 #      rating: 4
 #  }
 #  book = Book.new(attributes)
 #  book.save
 #  book
end
