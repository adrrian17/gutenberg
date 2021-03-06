module ApplicationHelper
  def icon(*names)
    content_tag(:i, nil, :class => icon_classes(names))
  end

  private
  def icon_classes(*names)
    final = ""
    names[0].each do |n|
      final = final + "icon-" + n.to_s + " "
    end
    return final
  end

  def all_categories
    Category.all
  end

  def all_books
    Book.all
  end

  def all_magazines
    Magazine.all
  end
end
