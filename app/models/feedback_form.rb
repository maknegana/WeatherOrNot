class FeedbackForm < ActiveRecord::Base
  belongs_to :day_weather
  belongs_to :user
  belongs_to :what_to_bring	
end
