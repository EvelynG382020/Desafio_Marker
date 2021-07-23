class CreateCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :categories do |t|
      t.references :category, foreign_key: true
      t.references :type, foreign_key: true
      t.string :name
      t.boolean :public

      t.timestamps
    end
  end
end
