class Project < ApplicationRecord
  has_many :tasks, dependent: :nullify
  has_many :routines, dependent: :nullify
  belongs_to :user

  validates :name, presence: true
end
