class Category < ApplicationRecord
  belongs_to :category, optional: true
  has_many :children_categories, class_name: "Category",
  foreign_key: "category_id"
  belongs_to :parent_category, class_name: "Category", optional: true, foreign_key: 'category_id'
  belongs_to :type

  has_and_belongs_to_many :markers, dependent: :nullify
  #has_many :markers , dependent: :destroy
  

  def all_the_child_categories
    children_categories = []
    self.children_categories.each do |child_category|
        children_categories << child_category.name
    end
    children_categories
  end

  # def self.parent_category
  #   where(category_id: nil) #que muestra todos los padres porque que no tienen padre asignado
  # end

  def name_type
    Type.references(:category).where(id: type_id).pluck :name
  end

  def name_parent(id)
    if id
      Category.find_by(id: id).name
    else
      ""
    end
  end

  
end
