class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :items
  has_many :transactions
  # validates :first_name, presence: true
  # validates :last_name, presence: true
  mount_uploader :photo, PhotoUploader
end
