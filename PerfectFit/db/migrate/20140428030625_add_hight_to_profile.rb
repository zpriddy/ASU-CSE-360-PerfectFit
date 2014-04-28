class AddHightToProfile < ActiveRecord::Migration
  def change
  	add_column :profiles, :height, :integer
  end
end
