class Item < ApplicationRecord
  belongs_to :user
  has_many :coments , dependent: :destroy
  accepts_nested_attributes_for :coments, allow_destroy: true
  acts_as_followable
  acts_as_likeable
  paginates_per 5
end
