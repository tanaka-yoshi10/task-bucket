require 'rails_helper'

RSpec.describe 'DailyReports', type: :system do
  let(:user) { create(:user) }
  let(:project) { create(:project, user: user) }

  before do
    signin(user.email, user.password)

    create(:task, user: user, project: project, title: '終ったタスク', start_at: Time.current, end_at: Time.current.since(2.hours))
    create(:task, user: user, title: '実施中', start_at: Time.current)
    create(:task, user: user, title: '未実施')
    create(:task, user: user, title: '終了のみ(これは無いかも。。。)', end_at: Time.current)
  end

  it '画面が表示されること' do
    visit daily_reports_path
    expect(page).to have_content('終ったタスク')
    expect(page).to have_content('実施中')
    expect(page).to have_content('未実施')
    expect(page).to have_content('終了のみ(これは無いかも。。。)')
  end
end
