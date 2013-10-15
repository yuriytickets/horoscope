module UsersHelper
  require 'open-uri'
  def get_horoscope(zodiac)
    doc = Nokogiri::HTML(open("http://my.horoscope.com/astrology/free-daily-horoscope-#{zodiac}.html"))
    doc.css('div.fontdef1').first.text
  end
end
