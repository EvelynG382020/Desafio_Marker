class CreateMarkers < ActiveRecord::Migration[5.2]
  def change
    create_table :markers do |t|
      t.references :category, foreign_key: true
      t.string :name
      t.string :url

      t.timestamps
    end
  end
end
