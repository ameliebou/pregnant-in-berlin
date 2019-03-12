
Kindergarten.destroy_all

puts 'Destroyed former seed'
require 'open-uri'
require 'nokogiri'

url = 'https://www.berlin.de/sen/jugend/familie-und-kinder/kindertagesbetreuung/kitas/verzeichnis/ListeKitas.aspx?aktSuchbegriff='

html_doc = Nokogiri::HTML(open(url).read)

kita_urls = []

html_doc.search('#DataList_Kitas a').each do |element|
  kita_urls << element.attribute('href').value
end

puts 'Collected all urls'

kita_urls.each do |url|
  kita_doc = Nokogiri::HTML(open("https://www.berlin.de/sen/jugend/familie-und-kinder/kindertagesbetreuung/kitas/verzeichnis/#{url}").read)
  kita = Kindergarten.new(address: "#{kita_doc.search('#lblStrasse').text.strip} - #{kita_doc.search('#lblOrt').text.strip}",
                          phone_number: kita_doc.search('#lblTelefon').text.strip,
                          email: kita_doc.search('#HLinkEMail').text.strip,
                          open_time_mon:kita_doc.search('#lblOeffnungMontag').text.strip[3..13],
                          open_time_tue:kita_doc.search('#lblOeffnungDienstag').text.strip[3..13],
                          open_time_wed:kita_doc.search('#lblOeffnungMittwoch').text.strip[3..13],
                          open_time_thu:kita_doc.search('#lblOeffnungDonnerstag').text.strip[3..13],
                          open_time_fri:kita_doc.search('#lblOeffnungFreitag').text.strip[3..13],
                          url: kita_doc.search('#HLinkWeb').text.strip
                          )
  kita.name = kita_doc.search('#lblKitaname').text.strip.delete '"'
  kita_array = []
  kita_doc.search('#GridViewPlatzstrukturen td').each { |td| kita_array << td.text.strip }
  kita.places = kita_array[0].to_i
  kita.places_under_three = kita_array[1].to_i
  kita.places_over_three = kita_array[2].to_i
  kita.minimum_age = kita_array[3].to_i

  kita.save!
end

puts 'Successful seed!'
