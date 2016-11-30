class HomeController < ApplicationController
  def index

    offset = rand(DayWeather.count)
    @cdw = DayWeather.offset(offset).first

    @weather_category = @cdw.sky

    if current_user
      current_user.what_to_brings.each do |w|
        if w.weather.eql? @weather_category
          @rel_wtb = w
        end
      end
    end

    # Lists corresponding to the columns in the what_to_bring model. Index into
    # these lists to render the appopriate suggestion for each column that
    # is stored in the current user's what_to_bring for the current weather condition.
    @tops=["shirt", "sweater", "jacket", "rainjacket", "parka"]
    @bottoms=["shorts", "jeans", "jeans", "jeans", "jeans"]
    @shoes=["sandals", "sneakers", "sneakers", "rainboots", "snowboots"]
    @hands=["", "", "", "", "gloves"]
    @heads=["hat", "light beanie", "light beanie", "beanie", "fleece hat"]
    @eyes=["sunglasses", "", "", "", ""]
    @ears=["", "", "", "", "earmuffs"]
    @necks=["", "", "scarf", "scarf", "scarf"]
    @brings=["", "", "umbrella", "umbrella", ""]
  end

  def calendar
  end

end
