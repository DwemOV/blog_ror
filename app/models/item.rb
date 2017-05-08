class Item < ApplicationRecord
  has_many :coments , dependent: :destroy
  accepts_nested_attributes_for :coments, allow_destroy: true
  paginates_per 5
end
