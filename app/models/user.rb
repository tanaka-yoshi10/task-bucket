class User < ApplicationRecord
  devise :database_authenticatable, :recoverable, :rememberable, :validatable

  has_many :projects, dependent: :destroy
  has_many :tasks, dependent: :destroy
end
