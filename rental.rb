require_relative 'person'
require_relative 'book'

class Rental
  attr_accessor :date, :person
  attr_reader :book

  def initialize(date, book, person)
    @date = date

    @book = book
    book.rentals << self

    @person = person
    person.rentals << self
  end


  def book=(book)
    @book = Book
    book.rentals.push(self) unless book.rentals.include?(self)
  end
end
