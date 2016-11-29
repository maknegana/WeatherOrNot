# Rails Project Writeup
* Title: WeatherOrNot
* Team Members: Anne Lin, Adriana Babakanian, Michelle Han
* Demo Link: railsdecal.com
* Idea: An application where administrators can create and post new lectures and other users (being students) can comment on the lectures and post questions for admins to answer.

## Models and Description:

### User

Attributes:

  - name
  - implements devise (user authentication) 

Associations:

  - has many FeedbackForms
  - has many WhatToBrings

### DayWeather

Attributes:

  - date, temperature, sky, precipitation, wind, humidity, location

Associations:

  - Has many FeedbackForms

### FeedbackForm

Attributes:

  - feel: User rates what the weather felt like ranging from 0 (hot) - 4 (cold)
  - Top, bottom, shoes, hands, head, eyes, ears, neck

Associations:

  - Has many WhatToBrings
  - Has many DayWeathers
  - Belongs to User

### WhatToBring

Attributes:

  - Weather: ranging from “sunny” - “snow”
  - Top, bottom, shoes, hands, head, eyes, ears, neck

Associations:

  - Belongs to User

## Features:

  - Users can sign up/log in/log out/cancel account 
  - Visual UI
  - Users can get personalized suggestions on what to bring/wear based on the  weather and their previous feedbacks
 
## Division of Labor:

  - Anne Lin
  - Adriana Babakanian
  - Michelle Han
