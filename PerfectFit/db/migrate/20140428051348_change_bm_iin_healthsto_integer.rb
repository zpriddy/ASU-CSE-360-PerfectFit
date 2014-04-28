class ChangeBmIinHealthstoInteger < ActiveRecord::Migration
  def change
  	change_column :healths, :BMI, :integer
  end
end
