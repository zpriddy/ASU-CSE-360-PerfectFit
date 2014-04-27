class AddSleepTexttoHealths < ActiveRecord::Migration
  def change
  	add_column :healths, :sleep_text, :string
  end
end
