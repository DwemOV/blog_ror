class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "50x50>", small: "30x30>"}, default_url: "/assets/noavatar.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
  has_many :auth_providers, dependent: :destroy
  has_many :coments , dependent: :destroy
  has_many :items , dependent: :destroy
  accepts_nested_attributes_for :coments, allow_destroy: true
  acts_as_follower
  acts_as_liker
  enum role: [:admin,:moderator,:users], _prefix: :role

  after_initialize do
    self.role ||=User.roles[:users]
  end
end
