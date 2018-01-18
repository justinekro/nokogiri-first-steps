require 'rubygems'
require 'nokogiri'   
require 'open-uri' 

# On crée une méthode qui récupère tous les liens des mairies
def get_crypto_prices

# J'initialise mon Hash de crypto 
  crypto = Hash.new

  page_coin = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))

# On récupère les noms de currency et on les stocke dans un nouveau tableau en les modifiant

  names = page_coin.css('a[class="currency-name-container"]').map{|id| id.text.downcase.gsub(" ","-").gsub(".","-")}

# Pour chaque nom récupéré on associe le prix correspondant > quelques bugs à cause de l'ID récupéré qui parfois est coupé ou ne correspond pas exactement
  names.each {|result| price = page_coin.xpath('//*[@id="id-' + result + '"]/td[5]/a').text
  crypto[result] = price}

  crypto.each { |cur,price| print "#{cur}: #{price}\n" }

end

# On excécute : attention, le script est assez long à s'exécuter (bien 3 minutes) 
get_crypto_prices

