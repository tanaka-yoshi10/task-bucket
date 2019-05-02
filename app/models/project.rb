class Project < ApplicationRecord
  has_many :tasks
  belongs_to :user

  validates :name, presence: true
end
