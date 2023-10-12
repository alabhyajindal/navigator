class RemoveDatesFromLocation < ActiveRecord::Migration[7.0]
  def change
    remove_column :locations, :date_visited, :date
    remove_column :locations, :date_left, :date
  end
end
