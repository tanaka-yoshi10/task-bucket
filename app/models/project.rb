class Project < ApplicationRecord
  has_many :tasks, dependent: :nullify
  has_many :routines, dependent: :nullify
  belongs_to :user

  attribute :color, :string, default: '#6c757d'

  validates :name, presence: true

  scope :default_order, -> { order(:name, :id) }
  scope :active, -> { where(archive: false) }
end
