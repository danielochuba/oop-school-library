require_relative 'student'
require_relative 'classroom'
require_relative 'capitalize'
require_relative 'nameable'
require_relative 'decorator'
require_relative 'trim'
require_relative 'book'
require_relative 'rental'
require_relative 'person'
require_relative 'teacher'

class App
  def initialize
    @classrooms = []
    @people = []
    @books = []
    @rentals = []
    @teachers = []
    @students = []
  end

  def create_teacher
    print 'Enter Teacher name:'
    name = gets.chomp

    print 'Enter Teacher age:'
    age = gets.chomp.to_i

    puts 'Enter Teacher specialization:'
    specialization = gets.chomp

    teacher = Teacher.new(specialization, age, name)
    @teachers.push(teacher)
    @people.push(teacher)
    puts 'Teacher created!  '
  end

  def list_teacher
    @teachers.each do |teacher|
      puts "#{teacher.name} - #{teacher.age} #{teacher.specialization}"
    end
  end

  def create_book
    print 'Enter Book title:'
    title = gets.chomp

    print 'Enter Book author:'
    author = gets.chomp

    book = Book.new(title, author)
    @books.push(book)
    puts 'Book created!  '
  end

  def list_book
    if @books.empty?
      puts 'No books to list  '
    else
      @books.each_with_index do |(book, _index), i|
        puts "#{i + 1}) Title: \"#{book.title}\", Author: #{book.author}"
      end
    end
  end

  def create_student
    print 'Enter Student name:'
    name = gets.chomp

    print 'Enter Student age:'
    age = gets.chomp.to_i

    print 'has parent permission? (y/n)'
    parent_permission = gets.chomp.downcase
    parent_permission = parent_permission == 'y'

    student = Student.new(parent_permission, age, name)
    @students.push(student)
    @people.push(student)
    puts 'Student created!  '
  end

  def create_person
    puts 'Do you want to create a student or a teacher? (s/t)'
    choice = gets.chomp
    if choice == 's'
      create_student
    elsif choice == 't'
      create_teacher
    else
      puts 'Invalid choice  '
    end
  end

  def display_options
    puts 'Options:'
    puts '1. List all books'
    puts '2. List all people'
    puts '3. Create a person'
    puts '4. Create a book'
    puts '5. Create a rental'
    puts '6. List rentals for a person'
    puts '7. Exit'
  end

  def list_people
    if @people.empty?
      puts 'No people to list'
    else
      @people.each_with_index do |(person, _index), i|
        if person.instance_of?(Student)
          puts "#{i + 1}) (Student) Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
        elsif person.instance_of?(Teacher)
          puts "#{i + 1}) (Teacher) Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
        end
      end
    end
  end

  def process_choice(choice)
    case choice
    when 1
      list_book
    when 2 then list_people
    when 3 then create_person
    when 4 then create_book
    when 5 then create_rental
    when 6 then list_rental
    when 7
      exit
    else
      puts 'Invalid choice'
    end
  end

  def create_rental
    puts 'Select a book from the following list by number'
    list_book
    book_response = gets.chomp.to_i
    selected_book = @books[book_response - 1]

    puts 'Select a person from the following list by number '
    list_people
    people_response = gets.chomp.to_i
    selected_person = people_response - 1.to_i

    puts 'Enter Rental date [YYYY-MM-DD]:'
    rental_date = gets.chomp.to_s

    rental = @people[selected_person].add_rental(selected_book, rental_date)
    @rentals.push(rental)
    puts 'Rental created!  '
  end

  def list_rental
    puts 'Select a person from the following list by id to see their rentals'
    list_people
    people_response = gets.chomp.to_i

    @rentals.each do |rental|
      if rental.person.id == people_response
        puts "Date: #{rental.date}, Book: #{rental.book.title} by #{rental.book.author}"
      end
    end
  end
end
