require 'pry'

class Book < ActiveRecord::Base

  has_many :checkouts
  has_many :users, through: :checkouts
  has_many :ratings


  def self.highest_rating
    self.maximum(:rating)
  end


  def self.most_popular_book
    self.where("rating = ?", self.highest_rating).first
  end



  def self.lowest_rating
    self.minimum(:rating)
  end

  def self.least_popular_book
    self.where("rating = ?", self.lowest_rating).first
  end

  def self.ratings_sum
    self.sum(:rating)
  end

  def self.popular_books
    books = self.all.select do |book|
      book.rating >= 5
    end
    books.each do |book|
      puts book.name
    end
    # self.where("rating >= ?", 5).each do |book|
    #   puts book.name
    # end
  end

  def self.shows_by_alphabetical_order
    self.order(:name)
  end


end
