require 'rails_helper'

RSpec.describe 'MonthlyReports', type: :system do
  let(:user) { create(:user) }
  let(:project) { create(:project, user: user, name: 'XXX株式会社案件') }

  before do
    signin(user.email, user.password)

    create(:task, user: user, project: project, title: '終ったタスク', start_at: Time.current, end_at: Time.current.since(2.hours))
  end

  it '画面が表示されること' do
    visit monthly_reports_path
    expect(page).to have_content('XXX株式会社案件')
    expect(page).to have_content('2.0')
  end
end
