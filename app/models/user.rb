class User < ApplicationRecord
  devise :database_authenticatable, :recoverable, :rememberable, :validatable

  has_many :projects, dependent: :destroy
  has_many :tasks, dependent: :destroy
  has_many :routines, dependent: :destroy
  has_many :shortcuts, dependent: :destroy

  def admin?
    id == 1
  end
end
