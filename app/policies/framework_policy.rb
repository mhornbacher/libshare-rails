class FrameworkPolicy < ApplicationPolicy
    
    def update?
        user
    end
    
end
