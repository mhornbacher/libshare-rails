module LibrariesHelper
    def labeled_text_field(formbuilder, key)
        res = formbuilder.label key
        res += formbuilder.text_field key, class: "form-control"
    end

    def format_comment_time(time)
        time.strftime("%l:%M%P on %F (%Z)")
    end
end
