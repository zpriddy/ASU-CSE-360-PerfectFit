class ChangeSleepToIntegerInHealths < ActiveRecord::Migration
  def change
  	change_column :healths, :sleep, :integer
  end
end
