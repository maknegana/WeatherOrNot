class WhatToBring < ActiveRecord::Base
  has_many :feedback_forms
  belongs_to :user	
end
