class WeathersController < ApplicationController
  def index
  	if signed_in?
	  	lat = request.location.latitude
		lon = request.location.longitude
		doc = Nokogiri::XML(open("http://api.openweathermap.org/data/2.5/weather?lat=#{lat}&lon=#{lon}&mode=html"))
		@img = doc.css("body div")[1].css("div")[1].css("img")[0]["style"].match(/http:\/.*png/)[0]
		@temperature = doc.css("body div")[1].css("div")[3].text
		@clouds = doc.css("body div")[1].css("div")[5].text.match(/[0-9]{1,}\.?[0-9]{0,}/)[0]
		@humidity = doc.css("body div")[1].css("div")[6].text.match(/[0-9]{1,}\.?[0-9]{0,}/)[0]
		@wind = doc.css("body div")[1].css("div")[7].text.match(/[0-9]{1,}\.?[0-9]{0,}/)[0]
		@pressure = doc.css("body div")[1].css("div")[8].text.match(/[0-9]{1,}\.?[0-9]{0,}/)[0]
		render html: { img: @img, temperature: @temperature, clouds: @clouds, humidity: @humidity, wind: @wind, pressure: @pressure }
	else
		redirect_to(root_url)
	end
  end
end
