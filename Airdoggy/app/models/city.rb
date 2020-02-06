class City < ApplicationRecord
  has_many :dogsitters
  has_many :dogs
  has_many :stralls
end
