class Category < ApplicationRecord
  belongs_to :parent_category, class_name: "Category", optional: true, foreign_key: 'category_id'
  has_many :children_categories, class_name: "Category", dependent: :destroy
  
  belongs_to :type
  has_many :markers , dependent: :destroy
  

  def all_the_child_categories
    children_categories = []
    self.children_categories.each do |child_category|
        children_categories << child_category.name
    end
    children_categories
  end

  def self.parent_category
    where(category_id: nil) #que muestra todos los padres porque que no tienen padre asignado
  end

  def name_type
    Type.references(:category).where(id: type_id).pluck :name
  end

  def public_options
    if public == true
        'Privado'
    else
        'Publico'
    end
  end
  # def name_parent(id)
  #   if id
  #     Category.find_by(id: id).name
  #   else
  #     ""
  #   end
  # end

  
end
