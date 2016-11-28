class FeedbackFormsController < ApplicationController
  def new
    @curr = DayWeather.all.order(:id).last
    @wtb = current_user.WhatToBrings.find_by(weather: @curr.find_by(weather: @curr.sky))
    @ff = FeedbackForm.new(:user_id => current_user,
                              :day_weather_id => @curr.id,
                              :feel => 0,
                              :top => @wtb.top,
                              :bottom => @wtb.bottom,
                              :shoes =>,
                              :hands =>,
                              :head =>,
                              :eyes =>,
                              :ears => ,
                              )
  end	
  def update
    #update this form's corresponding what to bring
  end  
end
