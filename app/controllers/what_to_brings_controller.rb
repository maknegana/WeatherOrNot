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

    @wtbNew = WhatToBring.new()
    @wtblist = []
    @rel_wtb.attributes.keys do |column|
      @wtblist << column.to_s
      @wtbNew.column = @rel_wtb.column
    end
  end

  def create 
    @rel_wtb.destroy()
    checkedList = params[:checkedList]
    inc = 0
    if params[:felt] == 'too cold'
      inc == 1
    end
    if params[:felt] == 'too hot'
      inc == -1 
    end
    if checkedList[rand(1..(checkedList.size-1))] != ""
      put @wtbNew.(checkedList[rand(1..(checkedList.size-1))]).to_sym
    end
    @wtbNew.save
    redirect '/'
  end

end
