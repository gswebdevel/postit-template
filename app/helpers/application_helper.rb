module ApplicationHelper

  def fix_url(str)
    str.starts_with?('http') ? str : "http://#{str}"
  end
  def nice_date(str)
    str.strftime("%m/%d/%y")
  end

end
