class Book < ApplicationRecord
  belongs_to :user
  validates :title, presence: true
  validates :body, length: { maximum: 200 }
  validate :add_error_title
  def add_error_title
    if title == "title_e"
       errors.add(:title, "title_e error")
    end
  end
end
