class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  has_many :auth_providers, dependent: :destroy
  has_many :coments , dependent: :destroy
  accepts_nested_attributes_for :coments, allow_destroy: true
end
