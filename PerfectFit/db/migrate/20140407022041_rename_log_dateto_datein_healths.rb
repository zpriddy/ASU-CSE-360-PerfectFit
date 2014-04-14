class RenameLogDatetoDateinHealths < ActiveRecord::Migration
  def change
  	rename_column :healths, :date, :date
  end
end
