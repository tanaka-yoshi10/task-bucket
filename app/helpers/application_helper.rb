module ApplicationHelper
  def hbr(str)
    str = html_escape(str)
    raw str.gsub(/\r\n|\r|\n/, '<br />') # rubocop:disable Rails/OutputSafety
  end

  def null_check_localization(*args)
    localize(*args) if args&.first.present?
  end
  alias nl null_check_localization
end
