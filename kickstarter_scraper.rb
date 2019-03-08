require 'nokogiri'
require 'open-uri'

class Scraper 
  def show_books
    html = open('https://www.goodreads.com/choiceawards/best-of-the-best-2018')
    doc = Nokogiri::HTML(html)
    
    new_book = Book.new
    array = doc.css('.inlineblock.pollAnswer.resultShown').css('strong.uitext.result').text.split("\n")

    new_book.number_of_votes = separated_array = array.each_slice(5).to_a[1][1]
    new_book.previous_award = separated_array = array.each_slice(5).to_a[1][4]
    new_book.title = doc.css(".pollAnswer__bookLink").css("img").first["alt"].split(" by ")[0]
    new_book.author = doc.css(".pollAnswer__bookLink").css("img").first["alt"].split(" by ")[1]
  end 
end 