class Book < ApplicationRecord
  belongs_to :topic
  has_many :authorships
  has_many :authors, through: :authorships
end
