class Article < ApplicationRecord
  validates :title, :description, presence: true
  validates :user_id, presence: true

  belongs_to :user

end
