require 'rubygems'
require 'nokogiri'   
require 'open-uri' 

# On crée une méthode qui récupère tous les liens des mairies


def get_crypto_prices

# J'initialise mon Hash de crypto 
  crypto = Hash.new

  page_coin = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))

  names = page_coin.css('a[class="currency-name-container"]').map{|id| id.text.downcase.gsub(" ","-")}

  names.each {|result|
  tests = page_coin.xpath('//*[@id="id-' + result + '"]/td[5]/a').text

  print "#{result} : #{tests} \n "

=begin
  crypto[result] = page_coin.xpath('//*[@id="id-' + result + '"]/td[5]/a').text

  }

  crypto.each do|cur,price|
  puts "#{cur}: #{price}"
  end
=end 

end

get_crypto_prices
