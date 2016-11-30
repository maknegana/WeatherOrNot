class WhatToBringsController < ApplicationController
  def create_sun
     # create a wtb with the default values for this weather
     @wtb = WhatToBring.create(:weather => "Sunny",
                               :top => 0,
                               :bottom => 0,
                               :shoes => 0,
                               :hands => 0,
                               :head => 0,
                               :eyes => 0,
                               :ears => 0,
                               :neck => 0,
                               :top => 0,
                               )
  end

  def create_cloudy
    #create a wtb with the default values for cloudy weather
    @wtb = WhatToBring.create(:weather => "Cloudy",
                              :top => 1,
                              :bottom => 1,
                              :shoes => 1,
                              :hands => 1,
                              :head => 1,
                              :eyes => 1,
                              :ears => 1,
                              :neck => 1,
                              :top => 1,
                              )
  end

  def create_drizzle
    @wtb = WhatToBring.create(:weather => "Drizzle",
                              :top => 2,
                              :bottom => 2,
                              :shoes => 2,
                              :hands => 2,
                              :head => 2,
                              :eyes => 2,
                              :ears => 2,
                              :neck => 2,
                              :top => 2,
                              )
  end

  def create_heavy_rain
    @wtb = WhatToBring.create(:weather => "Heavy Rain",
                              :top => 3,
                              :bottom => 3,
                              :shoes => 3,
                              :hands => 3,
                              :head => 3,
                              :eyes => 3,
                              :ears => 3,
                              :neck => 3,
                              :top => 3,
                              )
  end

  def create_snow
    @wtb = WhatToBring.create(:weather => "Snow",
                              :top => 4,
                              :bottom => 4,
                              :shoes => 4,
                              :hands => 4,
                              :head => 4,
                              :eyes => 4,
                              :ears => 4,
                              :neck => 4,
                              :top => 4,
                              )
  end

  def update
    # update this what to bring depending on the feedback form submitted on a day
    # where the weather is the type of weather corresponding to this wtb.

  end	

  def new

    @wtbNew = WhatToBring.new(:weather=> @weather_category)

    @tops=["shirt", "sweater", "jacket", "rainjacket", "parka"]
    @bottoms=["shorts", "jeans"]
    @shoes=["sandals", "sneakers", "rainboots", "snowboots"]
    @hands=["gloves", ""]
    @heads=["baseball cap", "beanie"]
    @eyes=["sunglasses", ""]
    @ears=["earmuffs", ""]
    @necks=["scarf", ""]
    @brings=["umbrella", ""]


  end

  def create 
    @tops=["shirt", "sweater", "jacket", "rainjacket", "parka"]
    @bottoms=["shorts", "jeans", "jeans", "jeans", "jeans"]
    @shoes=["sandals", "sneakers", "sneakers", "rainboots", "snowboots"]
    @hands=["", "", "", "", "gloves"]
    @heads=["baseball cap", "beanie", "beanie", "beanie", "beanie"]
    @eyes=["sunglasses", "", "", "", ""]
    @ears=["", "", "", "", "earmuffs"]
    @necks=["", "", "scarf", "scarf", "scarf"]
    @brings=["", "", "umbrella", "umbrella", ""]

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

    @wtbNew = WhatToBring.new(:weather=> @weather_category,
                              :top => @tops.index(params[:what_to_bring][:top]),
                              :bottom => @bottoms.index(params[:what_to_bring][:bottom]),
                              :shoes => @shoes.index(params[:what_to_bring][:shoes]),
                              :hands => @hands.index(params[:what_to_bring][:hands]),
                              :head => @heads.index(params[:what_to_bring][:head]),
                              :eyes => @eyes.index(params[:what_to_bring][:eyes]),
                              :ears => @ears.index(params[:what_to_bring][:ears]),
                              :neck => @necks.index(params[:what_to_bring][:neck]),
                              :bring => @brings.index(params[:what_to_bring][:bring]),
                              :felt => params[:what_to_bring][:felt])

    change = ["top","bottom","shoes","hands","head", "ears","necks"]
    inc = 0
    if @wtbNew.felt == 'too cold'
      inc = 1
    end
    if @wtbNew.felt == 'too hot'
      inc = -1 
    end
    
    x = change[rand(0..6)]
    @wtbNew[x] = (@wtbNew[x] + inc) % 5 
  

    @rel_wtb.destroy()
    @wtbNew.save

    redirect_to '/'
  end

end
