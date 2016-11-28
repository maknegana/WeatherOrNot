class DayWeathersController < ApplicationController
  def new
  @day_weather = DayWeather.new
  end

  def create
    @day_weather = DayWeather.new(:date => Date.today,
                                  :temp =>,
                                  :sky =>,
                                  :precipitation =>
                                  :wind =>
                                  :weekday =>
                                  :humidity =>
                                  )
  end	
end
