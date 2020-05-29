class Review

  def self.load_reviews(title)
    book_title = title.sub(/ /, '+')
    resp = Faraday.get('https://api.nytimes.com/svc/books/v3/reviews.json?') do |req|
      req.params['api-key'] = ENV['NY_TIMES_API_KEY']
      req.params['title'] = book_title
    end
    data = JSON.parse(resp.body, symbolize_names: true)
    binding.pry
  end

end
