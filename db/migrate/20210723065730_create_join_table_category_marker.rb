class CreateJoinTableCategoryMarker < ActiveRecord::Migration[5.2]
  def change
    create_join_table :categories, :markers do |t|
      t.index [:category_id, :marker_id]
      t.index [:marker_id, :category_id]
    end
  end
end
