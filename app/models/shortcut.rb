class Shortcut < ApplicationRecord
  belongs_to :project, optional: true
  belongs_to :user

  validates :title, presence: true
  validates :position, presence: true

  scope :default_order, -> { order(:position, :id) }
end
