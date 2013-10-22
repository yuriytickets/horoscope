module UsersHelper
	require 'open-uri'
	def get_horoscope(zodiac)
		doc = Nokogiri::HTML(open("http://my.horoscope.com/astrology/free-daily-horoscope-#{zodiac}.html"))
		doc.css('div.fontdef1').first.text
	end
	def zodiac_avatar(zodiac)
		case zodiac
			when "Taurus"
				image_tag 'zodiac/Taurus.jpg'
			when "Gemini"
				image_tag 'zodiac/Gemini.jpg'
			when "Libra"
				image_tag 'zodiac/Libra.jpg'
			when "Aquarius"
				image_tag 'zodiac/Aquarius.jpg'
			when "Virgo"
				image_tag 'zodiac/Virgo.jpg'
			when "Capricorn"
				image_tag 'zodiac/Capricorn.jpg'
			when "Leo"
				image_tag 'zodiac/Leo.jpg'
			when "Aries"
				image_tag 'zodiac/Aries.jpg'
			when "Cancer"
				image_tag 'zodiac/Cancer.jpg'
			when "Pisces"
				image_tag 'zodiac/Pisces.jpg'
			when "Scorpio"
				image_tag 'zodiac/Scorpio.jpg'
			when "Sagittarius"
				image_tag 'zodiac/Sagittarius.jpg'
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