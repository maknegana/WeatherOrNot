# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

%w(sunny sunny sunny sunny sunny).each do |sky|
  DayWeather.create sky: sky, temp: rand(55..99), precipitation: rand(1..10), humidity: rand(0..100), location: 'Berkeley'
end

%w(cloudy cloudy cloudy cloudy cloudy cloudy cloudy cloudy cloudy).each do |sky|
  DayWeather.create sky: sky, temp: rand(30..65), precipitation: rand(10..75), humidity: rand(10..50), location: 'Berkeley'
end

%w(drizzle drizzle drizzle drizzle drizzle drizzle drizzle drizzle drizzle).each do |sky|
  DayWeather.create sky: sky, temp: rand(30..65), precipitation: rand(40..90), humidity: rand(20..60), location: 'Berkeley'
end

DayWeather.create(sky: 'heavy rain', temp: rand(30..50), precipitation: rand(70..100), humidity: rand(40..100), location: 'Berkeley')
DayWeather.create(sky: 'heavy rain', temp: rand(30..50), precipitation: rand(70..100), humidity: rand(40..100), location: 'Berkeley')
DayWeather.create(sky: 'heavy rain', temp: rand(30..50), precipitation: rand(70..100), humidity: rand(40..100), location: 'Berkeley')
DayWeather.create(sky: 'heavy rain', temp: rand(30..50), precipitation: rand(70..100), humidity: rand(40..100), location: 'Berkeley')
DayWeather.create(sky: 'heavy rain', temp: rand(30..50), precipitation: rand(70..100), humidity: rand(40..100), location: 'Berkeley')
DayWeather.create(sky: 'heavy rain', temp: rand(30..50), precipitation: rand(70..100), humidity: rand(40..100), location: 'Berkeley')

%w(snow snow snow snow snow snow snow snow snow).each do |sky|
  DayWeather.create sky: sky, temp: rand(1..32), precipitation: rand(10..40), humidity: rand(10..30), location: 'Berkeley'
end
