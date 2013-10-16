module WeathersHelper
	def get_weather
		lat = request.location.latitude
		lon = request.location.longitude
		if lat == 0.0 && lon == 0.0
			lat = 50
			lon = 30
		end
		doc = Nokogiri::XML(open("http://api.openweathermap.org/data/2.5/weather?lat=#{lat}&lon=#{lon}&mode=html"))
		doc.css("body div")[1].css("div")[3].text
  	end
end
