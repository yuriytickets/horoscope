module UsersHelper
	require 'open-uri'
	def get_horoscope(zodiac)
		doc = Nokogiri::HTML(open("http://my.horoscope.com/astrology/free-daily-horoscope-#{zodiac}.html"))
		doc.css('div.fontdef1').first.text
	end
	def zodiac_avatar(zodiac)
		case zodiac
			when "Taurus"
				image_tag 'zodiac/телец.jpg'
			when "Gemini"
				image_tag 'zodiac/близнецы.jpg'
			when "Libra"
				image_tag 'zodiac/весы.jpg'
			when "Aquarius"
				image_tag 'zodiac/водолей.jpg'
			when "Virgo"
				image_tag 'zodiac/дева.jpg'
			when "Capricorn"
				image_tag 'zodiac/козерог.jpg'
			when "Leo"
				image_tag 'zodiac/лев.jpg'
			when "Aries"
				image_tag 'zodiac/овен.jpg'
			when "Cancer"
				image_tag 'zodiac/рак.jpg'
			when "Pisces"
				image_tag 'zodiac/рыба.jpg'
			when "Scorpio"
				image_tag 'zodiac/скорпион.jpg'
			when "Sagittarius"
				image_tag 'zodiac/стрелец.jpg'
			else
				image_tag 'zodiac/troll.jpg'
		end
	end
	def online?
		if @user.updated_at > 10.minutes.ago
			return "online"
		else
			return "#{@user.updated_at.strftime('%k : %M')} <br> #{@user.updated_at.strftime('%e %B %Y')}".html_safe
		end
	end
end