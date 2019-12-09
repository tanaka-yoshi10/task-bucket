require 'rails_helper'

RSpec.describe 'MonthlyReports', type: :system do
  let(:user) { create(:user) }
  let(:project_x) { create(:project, user: user, name: 'XXX株式会社案件') }
  let(:project_y) { create(:project, user: user, name: 'YYY株式会社案件') }

  before do
    signin(user.email, user.password)

    create(:task, user: user, project: project_x, title: '先月末の作業', start_at: Time.current.prev_month.end_of_month.ago(4.hours), end_at: Time.current.prev_month.end_of_month)
    create(:task, user: user, project: project_x, title: '今月頭の作業', start_at: Time.current.beginning_of_month, end_at: Time.current.beginning_of_month.since(2.hours))
    create(:task, user: user, project: project_x, title: '今月中の作業', start_at: Time.current.beginning_of_day, end_at: Time.current.beginning_of_day.since(10.hours))
    create(:task, user: user, project: project_y, title: '今月末の作業', start_at: Time.current.end_of_month.ago(3.hours), end_at: Time.current.end_of_month)
    create(:task, user: user, project: project_x, title: '来月頭の作業', start_at: Time.current.next_month.beginning_of_month, end_at: Time.current.next_month.beginning_of_month.since(6.hours))
  end

  it '今月の情報のみ画面が表示されること' do
    visit monthly_reports_path
    expect(page).to have_content('XXX株式会社案件')
    expect(page).to have_content('12.0') # 今月頭の作業 + 今月中の作業
    expect(page).to have_content('YYY株式会社案件')
    expect(page).to have_content('3.0') # 今月末の作業
  end
end
