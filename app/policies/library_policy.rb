class LibraryPolicy < ApplicationPolicy

    # add @library to the plicy for ease of reading
    attr_reader :library
    def initialize(user, library)
        super(user, library)
        @library = library
    end

    def show?
        true
    end

    def update?
        # admins and the user that made it
        user.admin? || library.try(:created_by) == user if user
    end
    
    def new?
        create? # we must have a user
    end
    
    def create?
        user
    end

    def destroy?
        return false if user.nil?
        user.admin?
    end

    def edit?
        update?
    end
    
end
