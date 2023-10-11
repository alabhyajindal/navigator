class AddColumnToLocation < ActiveRecord::Migration[7.0]
  def change
    add_column :locations, :date_visited, :date
    add_column :locations, :date_left, :date
    add_column :locations, :notes, :text
  end
end
