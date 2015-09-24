module ApplicationHelper
  def full_title(title = '')
    filler = Settings.application.title
    bar =" | "
    if title.empty?
       filler
    else
      title + bar + filler
    end
  end
end
