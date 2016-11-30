class FeedbackFormsController < ApplicationController
  def new
    @curr = DayWeather.all.order(:id).last
    @wtb = current_user.WhatToBrings.find_by(weather: @curr.find_by(weather: @curr.sky))
    @ff = FeedbackForm.new(:user_id => current_user,
                              :day_weather_id => @curr.id,
                              :feel => 0,
                              :top => @wtb.top,
                              :bottom => @wtb.bottom,
                              :shoes => @wtb.shoes,
                              :hands => @wtb.hands,
                              :head => @wtb.head,
                              :eyes => @wtb.eyes,
                              :ears => @wtb.ears,
                              )
  end

  def create
    # create a new feedback form for a given day and a given user
    # fill in this info given the input from the simple form
    # change input from simple form into the corresponding list

    #generate a random number within the range
    checkedList = params[:checkedList]
    changing = checkedList[rand(0..checkedList.size)].to_sym
    @ff.(changing) += param[:felt]
    @ff.save
    session[:changed] = changing
    update
    redirect_to '/'
  end

  def update
    puts " ======== test ========"
    #update this form's corresponding what to bring
    @wtb.session[:changed] = @ff.session[:changed]
    @wtb.save
  end
end
