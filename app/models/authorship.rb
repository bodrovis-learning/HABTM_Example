class Authorship < ApplicationRecord
  belongs_to :book
  belongs_to :author, counter_cache: true
end
