class HomeController < ApplicationController
  def index
    # @most_recent_day_id = DayWeather.all.order(:id).last
    # @cdw = DayWeather.find_by_id(@most_recent_day_id)

    offset = rand(DayWeather.count)
    @cdw = DayWeather.offset(offset).first

    @weather_category = @cdw.sky

    if current_user
      @wtbs = current_user.what_to_brings
      @rel_wtb = @wtbs.find_by(weather: @weather_category)
    end

    # @rel_wtb = WhatToBring.create(:weather => 'cloudy',
    #                                :top => 1,
    #                                :bottom => 1,
    #                                :shoes => 1,
    #                                :hands => 1,
    #                                :head => 1,
    #                                :eyes => 1,
    #                                :ears => 1,
    #                                :neck => 1,
    #                                :bring => 1
    #                                )


    # Lists corresponding to the columns in the what_to_bring model. Index into
    # these lists to render the appopriate suggestion for each column that
    # is stored in the current user's what_to_bring for the current weather condition.
    @tops=["shirt", "sweater", "jacket", "rainjacket", "parka"]
    @bottoms=["shorts", "jeans", "jeans", "jeans", "jeans"]
    @shoes=["sandals", "sneakers", "sneakers", "rainboots", "snowboots"]
    @hands=["none", "none", "none", "none", "gloves"]
    @heads=["baseball cap", "beanie", "beanie", "beanie", "beanie"]
    @eyes=["sunglasses", "none", "none", "none", "none"]
    @ears=["none", "none", "none", "none", "earmuffs"]
    @necks=["none", "none", "scarf", "scarf", "scarf"]
    @brings=["none", "none", "umbrella", "umbrella", "none"]
  end

  def calendar
  end

end
