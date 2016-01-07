module PostsHelper

  #converts tags to links
  def tag_links(tags)
    tags.split(",").map{|tag| link_to tag.strip, tag_path(tag.strip) }.join(", ")
  end

  #style tag cloud according to counts
  #takes result of calling counts function and CSS classes
  # This helper method will get the tag with the max count.
  # Loops on each tag to calculate index which will choose the CSS class
  # based on rounded value

  def tag_cloud(tags, classes)
    max = tags.sort_by(&:count).last
    tags.each do |tag|
      index = tag.count.to_f / max.count * (classes.size-1)
      yield(tag, classes[index.round])
    end
  end

end
