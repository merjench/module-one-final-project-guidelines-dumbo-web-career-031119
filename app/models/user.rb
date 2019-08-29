require 'pry'

class User < ActiveRecord::Base
  has_many :checkouts
  has_many :books, through: :checkouts
  
# add_review and user_review not activated
  has_many :reviews

  def add_review(book, rating,  content)
    Review.new(self, book, rating, content)
  end


  def user_review
    Checkout.all.select do |review|
    review.user == self
    end
  end

  def find_by_multiple_attributes(name, author, subject)
    Book.find_by(name: name , author: author, subject: subject)
  end

  def delete_a_book
    Book.create(name: "any name")
    book = Book.find_by(name: "any name")
    book.delete
  end

  def delete_all_books_at_once
    10.times do |i|
      Book.create(name: "Book_#{i}")
    end
    Book.delete_all
  end

end
