class Task < ApplicationRecord
  belongs_to :project, optional: true

  def actual
    (end_at - start_at) / 1.minute
  end
end
