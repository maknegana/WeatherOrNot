class AddWhatToBringRefToFeedbackForms < ActiveRecord::Migration
  def change
    add_reference :feedback_forms, :what_to_bring, index: true, foreign_key: true
  end
end
