class Article < ApplicationRecord
  validates :title, :description, presence: true
  validates :user_id, presence: true

  belongs_to :user
  has_many :article_categories
  has_many :categories, through: :article_categories

end
