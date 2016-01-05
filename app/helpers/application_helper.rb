module ApplicationHelper

<<<<<<< HEAD
    # Returns the full title on a per-page basis.
=======
  # Returns the full title on a per-page basis.
>>>>>>> filling-in-layout
  def full_title(page_title = '')
    base_title = "Flow Finder"
    if page_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end
  end

end
