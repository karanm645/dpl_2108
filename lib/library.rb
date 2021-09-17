class Library
  attr_reader :name,
              :books,
              :authors,
              :checked_out_books

  def initialize(name)
    @name    = name
    @books   = [] #available books
    @authors = []
    @checked_out_books = [] #unavailable books
    @checkout_count = Hash.new(0) #we put 0 so we could default to 0 because we are keeping track of it
  end

  def add_author(author)
    #dani's way below
    author.books.each do |book|
      @books << book
    end
    @authors << author
    #my way below
    # @authors << author
    # @books += author.books
  end

  #dani's way below
  def publication_time_frame_for(author)
    sorted_books = author.books.sort_by do |book|
      book.publication_year
    end
    {
      start: sorted_books.first.publication_year,
      end: sorted_books.last.publication_year
    }
  end

  #@books is available books in library
  def checkout(requested_book)
    if @books.include?(requested_book)
      @checked_out_books << requested_book
      @checkout_count[requested_book] += 1
      @books.delete(requested_book)
      true #if it is available it returns true and mvoes to unavailable)
    else
      false #if it isn't avalable (so in checked_out_books or doesnt even exists)
  end

  def return(checked_out_book)
    if @checked_out_books.include?(checked_out_book)
      @books << checked_out_books
      @checked_out_books.delete(checked_out_books)
  end
  #book can be key and the times its checked out can be the value
  def most_popular_book
    #the book to be my key and the ties checkout to be the value
    popular = ''
    max = 0
    @checkeout_count.each do |book, count|
      if count > max
        max = count
        popular = book
      end
    end
    popular #storing the book object
  end
end
