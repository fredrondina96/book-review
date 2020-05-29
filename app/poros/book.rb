class Book

  def self.load_book_info(book_title)
    resp = Faraday.get('http://openlibrary.org/search.json') do |req|
      req.params['title'] = book_title
    end
    data = JSON.parse(resp.body, symbolize_names: true)
    book = Book.new(data[:docs].first)
  end

  attr_reader :title, :author, :publisher
  def initialize(book_info)
    @title = book_info[:title_suggest]
    @author = book_info[:author_name]
    @publisher = book_info[:publisher]
  end
end
