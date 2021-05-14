class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true

  has_many :comments
  has_many :messages
  has_many :likes, dependent: :destroy
  has_many :liked_messages, through: :likes, source: :message
  def already_liked?(message)
    self.likes.exists?(message_id: message.id)
  end
end
