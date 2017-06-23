module ApplicationHelper
    def navigation_li(path, text)
        content_tag(:li, link_to(text, path), class: ("active" if request.path_info.include?(path)))
    end

    # meta program the edit and delete links for all the models
    def edit_and_delete_links_for(model)
        model_route_path = model.class.to_s.downcase
        if user_signed_in?
            links = link_to "Edit", self.send("edit_#{model_route_path}_path", model), class: "btn btn-primary edit-btn"
            if current_user.admin?
                links += link_to "Delete", self.send("#{model_route_path}_path", model), method: :delete, class: "btn btn-danger destroy-btn"
            end
        end
        return links
    end
    
end
