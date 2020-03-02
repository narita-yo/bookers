class User < ApplicationRecord
  attachment :profile_image
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :profiles, dependent: :destroy
  has_many :post_images, dependent: :destroy
  has_many :books, dependent: :destroy
  validates :name, presence: true, length: {maximum: 20}
  validates :name, length: { minimum: 2 }
  validates :introduction, length: { maximum: 50 }
end
