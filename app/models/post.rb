class Post < ActiveRecord::Base

  validates :show_name, :text, presence: true
  belongs_to :user
  belongs_to :wall

  has_many :comments, dependent: :destroy
end
