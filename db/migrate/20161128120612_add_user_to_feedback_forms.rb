class AddUserToFeedbackForms < ActiveRecord::Migration
  def change
    add_reference :feedback_forms, :user, index: true, foreign_key: true
  end
end
