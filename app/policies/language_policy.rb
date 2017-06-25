class LanguagePolicy < ApplicationPolicy
    
    def update?
        user
    end
    
end