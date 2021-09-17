class Author
  attr_reader :books

  def initialize(author_data)
    @first_name = author_data[:first_name]
    @last_name  = author_data[:last_name]
    @books      = []
  end

  def name
    "#{@first_name} #{@last_name}"
  end

  def write(title, date)
    book = Book.new(
      {
        author_first_name: @first_name,
        author_last_name: @last_name,
        title: title,
        publication_date: date
        })

    # require "pry"; binding.pry
  end
  def publish(book)
    @books << book
    book
  end
end
