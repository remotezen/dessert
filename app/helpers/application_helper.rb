module ApplicationHelper
  def full_title(title = '' )
    if title.class.name == 'String'
      new_title = title
    else
      new_title = title.to_s
    end
    
    filler = Settings.application.title
    bar =" | "
    if title.empty?
       filler
    else
      title + bar + filler
    end
  end
  def fooimage(image_path, size)
    unless image_path.nil?
      if size == "large"
        actual_size = "200x200"
      elsif size == "medium"
        acutual_size = "100x100"
      elsif size == "small"
        actual_size = "50x50"
      else
        actual_size = "30x30"
      end
    else
      return ""
    end
    image_tag image_path, size: "#{actual_size}"
end
end
