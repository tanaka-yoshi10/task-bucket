class SummaryMailer < ApplicationMailer
  add_template_helper(ApplicationHelper)

  def daily_report(user)
    @user = user
    @date = Date.current.yesterday
    mail to: @user.email, subject: "Daily Report #{l @date}"
  end
end
