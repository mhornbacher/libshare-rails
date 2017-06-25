module LibrariesHelper
    def labeled_text_field(formbuilder, key)
        res = formbuilder.label key
        res += formbuilder.text_field key, class: "form-control"
    end
end
