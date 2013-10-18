module UsersHelper
  require 'open-uri'
  def get_horoscope(zodiac)
    doc = Nokogiri::HTML(open("http://my.horoscope.com/astrology/free-daily-horoscope-#{zodiac}.html"))
    doc.css('div.fontdef1').first.text
  end
  def status
    # current_user.update_attribute(:updated_at, DateTime.now) if current_user
  end
	def zodiac_avatar(zodiac)
		case zodiac
			when "Taurus"
				image_tag 'zodiac/телец.jpg'
			when "Twins"
				image_tag 'zodiac/близнецы.jpg'
			when "Libra"
				image_tag 'zodiac/весы.jpg'
			when "Aquarius"
				image_tag 'zodiac/водолей.jpg'
			when "Virgin"
				image_tag 'zodiac/дева.jpg'
			when "Ibex"
				image_tag 'zodiac/козерог.jpg'
			when "Lion"
				image_tag 'zodiac/лев.jpg'
			when "Aries"
				image_tag 'zodiac/овен.jpg'
			when "Cancer"
				image_tag 'zodiac/рак.jpg'
			when "Fish"
				image_tag 'zodiac/рыба.jpg'
			when "Scorpion"
				image_tag 'zodiac/скорпион.jpg'
			when "Sagittarius"
				image_tag 'zodiac/стрелец.jpg'
			else
				image_tag 'zodiac/troll.jpg'
		end
	end
end