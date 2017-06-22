module ApplicationHelper
    def navigation_li(path, text)
        content_tag(:li, link_to(text, path), class: ("active" if request.path_info.include?(path)))
    end
end
