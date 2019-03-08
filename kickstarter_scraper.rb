require 'nokogiri'
require 'pry'

def create_project_hash
  html = open('https://www.goodreads.com/choiceawards/best-of-the-best-2018')
    doc = Nokogiri::HTML(html)
    binding.pry
  
 
end