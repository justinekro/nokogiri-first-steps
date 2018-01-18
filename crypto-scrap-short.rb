require 'rubygems'
require 'nokogiri'   
require 'open-uri' 

# On crée une méthode qui récupère tous les liens des mairies
def get_crypto_prices

  page_coin = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))

# On récupère les noms de currency et on les stocke dans un nouveau tableau en les modifiant

  names = page_coin.css('a[class="currency-name-container"]').map{|id| id.text.downcase.gsub(" ","-").gsub(".","-")}

# On récupère les prix et on les stocke dans un tableau
  prices = page_coin.css("a[class=price]").map{|crypto| crypto.text.downcase}
  crypto_rates = Hash[names.zip(prices)]
  puts crypto_rates
end

# On excécute
get_crypto_prices

