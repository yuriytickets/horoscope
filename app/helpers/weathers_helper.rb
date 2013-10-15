module WeathersHelper
	def get_weather
		lat = request.location.latitude
		lon = request.location.longitude
		doc = Nokogiri::XML(open("http://api.openweathermap.org/data/2.5/weather?lat=#{lat}&lon=#{lon}&mode=html"))
		doc.css("body div")[1].css("div")[3].text
  	end
end
