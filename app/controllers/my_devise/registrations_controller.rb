class MyDevise::RegistrationsController < Devise::RegistrationsController
  def create	
    super
    if resource.save
	    @sunnyWTB = WhatToBring.create(:weather => "Sunny",
	                           :top => 0,
	                           :bottom => 0,
	                           :shoes => 0,
	                           :hands => 0,
	                           :head => 0,
	                           :eyes => 0,
	                           :ears => 0,
	                           :neck => 0,
	                           :top => 0,
	                           :bring => 0,
	                           ) 
	    current_user.what_to_brings << @sunnyWTB
	    
	    @cloudyWTB = WhatToBring.create(:weather => "Cloudy",
                              :top => 1,
                              :bottom => 1,
                              :shoes => 1,
                              :hands => 1,
                              :head => 1,
                              :eyes => 1,
                              :ears => 1,
                              :neck => 1,
                              :top => 1,
                              :bring => 1,
                              )
      current_user.what_to_brings << @cloudyWTB
      
      @drizzleWTB = WhatToBring.create(:weather => "Drizzle",
                              :top => 2,
                              :bottom => 2,
                              :shoes => 2,
                              :hands => 2,
                              :head => 2,
                              :eyes => 2,
                              :ears => 2,
                              :neck => 2,
                              :top => 2,
                              :bring => 2,
                              )   
      current_user.what_to_brings << @drizzleWTB
      
      @heavyRainWTB = WhatToBring.create(:weather => "Heavy Rain",
                              :top => 3,
                              :bottom => 3,
                              :shoes => 3,
                              :hands => 3,
                              :head => 3,
                              :eyes => 3,
                              :ears => 3,
                              :neck => 3,
                              :top => 3,
                              :bring => 3,
                              )
      current_user.what_to_brings << @heavyRainWTB
      @snowWTB = WhatToBring.create(:weather => "Snow",
                              :top => 4,
                              :bottom => 4,
                              :shoes => 4,
                              :hands => 4,
                              :head => 4,
                              :eyes => 4,
                              :ears => 4,
                              :neck => 4,
                              :top => 4,
                              :bring => 4,
                              )
      current_user.what_to_brings << @snowWTB 
    end                                                                                                                      
  end


  def destroy
	  super
	  if resource.destroy
	  	@wtb = WhatToBring.find_all_by_user_id(resource.id)
	  	@wtb.each do |wtb|
	  		wtb.destroy
	    end
	  end  
  end	



end