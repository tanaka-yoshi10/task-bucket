require 'rails_helper'

RSpec.describe Task, type: :model do
  it 'has a valid factory' do
    expect(build(:task)).to be_valid
  end

  describe '日付' do
    it '日付が変わらないこと' do
      task = create(:task, scheduled_on: '2019-04-28', start_at: '2019-04-28 7:00', end_at: '2019-04-28 8:00')
      expect(task.scheduled_on).to eq Date.new(2019, 4, 28)
      expect(task.start_at).to eq Time.zone.local(2019, 4, 28, 7, 0, 0)
      expect(task.end_at).to eq Time.zone.local(2019, 4, 28, 8, 0, 0)

      task.update(start_at: '8:00', end_at: '9:00')
      expect(task.scheduled_on).to eq Date.new(2019, 4, 28)
      expect(task.start_at).to eq Time.zone.local(2019, 4, 28, 8, 0, 0)
      expect(task.end_at).to eq Time.zone.local(2019, 4, 28, 9, 0, 0)
    end
  end
end
