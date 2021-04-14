class Message < ApplicationRecord
  has_many_attached :images
  validates :content, presence: true
  validates :name, presence: true
  validates :place, presence: true
  belongs_to :user
  has_many :comments
  has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user

  def self.search(search)
    if search != ""
      Message.where('name LIKE(?) or content LIKE(?)', "%#{search}%","%#{search}%")
    else
      Message.all
    end
  end
end