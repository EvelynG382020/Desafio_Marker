class Category < ApplicationRecord
  belongs_to :category, optional: true
  has_many :children_categories, class_name: "Category",
  foreign_key: "category_id"
  belongs_to :parent_category, class_name: "Category", optional: true, foreign_key: 'category_id'
  belongs_to :type

  has_and_belongs_to_many :markers, dependent: :nullify
  #has_many :markers , dependent: :destroy
  #has_many :subcategories, class_name: "Category", optional: true, foreign_key: "category_id"

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

  # def self.build_data
  #   categories = Category.where(category_id: nil)
  #   build(categories)
  # end

  # def self.build(all)
  #   st = all.map{|t| info ={
  #     "id" => t.id,
  #     "name"=> t.name,
  #     "subcategory_id" => t.subcategory_name,
  #     "type_id" => t.one_type,
  #     "makers"=>t.many_markers,
  #     "public" => t.public
    
  #   }}
  # end

  # def self.type_name(id)
  #   Type.find_by(id: id).name
  # end

  # def subcategory_name
  #   all = Category.references(:subcategory).where(category_id: id)

  #   all.map{|v| info={
  #     "id" => v.id,
  #     "name" => v.name,
  #     "subcategory_id" =>v.subcategory_name,
  #     "markers" => v.many_markers
  #   }}
  # end

  # def many_markers
  #   Marker.references(:category).where(category_id: id)
  # end

  # def one_type
  #   Type.references(:category).where(id: type_id)
  # end

end
