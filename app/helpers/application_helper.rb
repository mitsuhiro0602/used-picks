module ApplicationHelper
  def sidebar_link_item(name, path)
    # binding.pry
    class_name = 'channel'
    class_name << 'active' if current_page?(path)

    content_tag :li, class:class_name do
      link_to name, path, class: 'channel_name'
    end
  end
end