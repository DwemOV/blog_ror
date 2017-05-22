class Coment < ApplicationRecord
  belongs_to :item
  belongs_to :user
  acts_as_followable
  acts_as_likeable
  paginates_per 10
end
