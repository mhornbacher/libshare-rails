class FrameworkPolicy < ApplicationPolicy
    
    def update?
        create?
    end
    
    def create?
        user
    end

    def destroy?
        user.admin?
    end

    def new?
        create?
    end
    
    def edit?
        update?
    end
    
end
