class SummaryMailerPreview < ActionMailer::Preview
  def daily_report
    SummaryMailer.daily_report(User.first)
  end
end
