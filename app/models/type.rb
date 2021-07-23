class Type < ApplicationRecord
    has_many :categories, dependent: :nullify  
end
