require 'rubygems'
require 'nokogiri'   
require 'open-uri' # If the webpage is live on a remote site 

page = Nokogiri::HTML(open("http://ruby.bastardsbook.com/files/hello-webpage.html")) 

# Pour récupérer les titre

puts page.css("title")[0].name

puts page.css("title")[0].text

# Pour récupérer les links

links = page.css("a")

puts links.length
puts links[0].text
puts links[0]["href"]

# Using select for a collection

# Data category = un indicateur dans la balise
news_links = page.css("a[data-category=news]")
news_links.each{|link| puts link['href']}


news_links2 = page.css("div#references a")
news_links2.each{|link| puts "#{link.text}\t#{link['href']}"}    

# XPath : doc.xpath("//h3/a") > Find all "a" tags with a parent tag whose name is "h3"
# / indicates the root of the tree
# Pour spécifier : //h3[@class = "r"]/a[@class = "l"]
# h3.r > h3 that contains r (et pas exactement r)
# On peut réécrire comme ça : doc.css('h3.r > a.l')

# Clic droit > Copy > Copy XPath
