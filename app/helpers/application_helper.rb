module ApplicationHelper

# Return a title on a per-page basis.
  def title
    base_title = "- YouSport"
    if @title.nil?
      base_title
    else
      "#{@title} #{base_title}"
    end
  end

# Return a meta_title on a per-page basis.
  def meta_title
    base_meta_title = "- YouSport"
    if @meta_title.nil?
      base_meta_title
    else
      "#{@meta_title} #{base_meta_title}"
    end
  end

# Return a meta_desc on a per-page basis.
  def meta_desc
    base_meta_desc = "- YouSport"
    if @meta_desc.nil?
      base_meta_desc
    else
      "#{@meta_desc} #{base_meta_desc}"
    end
  end

end
