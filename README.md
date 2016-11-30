# Rails Project Writeup
* Title: WeatherOrNot
* Team Members: Anne Lin, Adriana Babakanian, Michelle Han
* Demo Link: railsdecal.com
* Idea: An application where users receive personalized suggestions on what they should wear based on the current weather condition.

## Models and Description:

### User

* Attributes:

  - name
  - implements devise (user authentication) 

* Associations:

  - has many FeedbackForms
  - has many WhatToBrings (specifically, each user has exactly 5 WTBs, one for each of the five weather categories defined below). When a new user signs up, five default WTBs with default column values are created that belong to that new user.

### DayWeather

* Attributes:

  - date, temperature, sky (one of five strings/weather categories: "sunny", "cloudy", "drizzle", "heavy rain", "snow"), precipitation, wind, humidity, location

* Associations:

  - Has many FeedbackForms

### FeedbackForm

* Attributes:

  - feel: User rates what the weather felt like ranging from 0 (hot) - 4 (cold)
  - Top, bottom, shoes, hands, head, eyes, ears, neck

* Associations:

  - Belongs to DayWeathers
  - Belongs to User

### WhatToBring

* Attributes:

  - Weather: five different weather categories ranging from warmest to coldest: “sunny”, "cloudy", "drizzle", "heavy rain",  and “snow”
  - Clothing options: different categories of clothing. On a day where the C matches that of the current user's top, bottom, shoes, hands, head, eyes, ears, neck, bring

* Associations:

  - Belongs to User

## Features:

  - Users can sign up/log in/log out/cancel account
  - Visual UI
  - Users can get personalized suggestions on what to bring/wear based on the  weather and their previous feedback forms. When a user logs in to their account, they are directed to the home page. This home page consists of two components: a component for the current weather statistics and a component containing suggestions about what to wear given the current weather.
  - A user can submit a feedback form that takes into account the current weather condition. In this feedback form, the user selects what they wore during the current weather. They also select how they felt: either too cold, just right, or too warm. Based on this information, we update the current user's corresponding WTB so that in the future during similar weather conditions, we suggest to them clothing that is personalized to how they felt during previous similar weathers.
  - We implemented this basic machine learning by indexing into lists. Each column of WTB corresponds to a list of five strings. These lists are defined in the home controller. The indices of these lists are defined as follows:
    0 => "sunny"
    1 => "cloudy"
    2 => "drizzle"
    3 => "heavy rain"
    4 => snow
  When a user selects how they felt on their feedback form:
    too cold => +1
    just right => 0
    too warm => -1
  We then create a new WTB model with the clothing options that the user selected on their form, and randomly select one of these columns to increment or decrement according to how the user felt. We then destroy the old WTB model for the current weather type so that the next time the weather is similar, we can give the user their updated suggestions.


## Division of Labor:

  - Anne Lin: Feedback forms, WhatToBring controller.
  - Adriana Babakanian: Made all models, wrote home controller, wrote all .html.erb files, styled all views with CSS.
  - Michelle Han: Integrated Devise, created default WTBs with default column values for each weather category when a new user signs up. Ran migrations.
  - Everyone spent a lot of time debugging each other's work, and we all helped formulate the logic of how our machine learning is implemented.
