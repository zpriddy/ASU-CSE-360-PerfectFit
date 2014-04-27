class AddDurationTexttoHealths < ActiveRecord::Migration
  def change
  	add_column :activities, :duration_text, :string
  end
end
