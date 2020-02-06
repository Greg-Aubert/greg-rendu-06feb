class Dog < ApplicationRecord
  has_many :stralls
  has_many :dogsitters, through: :stralls
  belongs_to :city
end
