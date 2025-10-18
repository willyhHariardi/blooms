class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :carts, dependent: :destroy
  has_many :orders, dependent: :destroy

  def self.default_password
    chars = Array(0..9).sample(2) + Array('A'..'Z').sample(3) + Array('a'..'z').sample(3)
    chars.shuffle.join
  end
end
