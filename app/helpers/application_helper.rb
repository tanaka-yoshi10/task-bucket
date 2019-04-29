module ApplicationHelper
  def hbr(str)
    str = html_escape(str)
    raw str.gsub(/\r\n|\r|\n/, '<br />') # rubocop:disable Rails/OutputSafety
  end
end
