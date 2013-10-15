class Statistic < ActiveRecord::Base
  attr_accessible :user_id, :ip_adress, :latitude, :longitude

  belongs_to :user

  geocoded_by :ip_adress
  after_validation :geocode
end
