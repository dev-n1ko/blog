class Article < ApplicationRecord
  validates :title, presence: true
  validates :body, presence: true

  has_many :comments, dependent: :destroy
  def latest_comment
    comments.order(:created_at ).first
  end
end

