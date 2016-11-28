class AddDayWeatherRefToFeedbackForms < ActiveRecord::Migration
  def change
    add_reference :feedback_forms, :day_weather, index: true, foreign_key: true
  end
end
