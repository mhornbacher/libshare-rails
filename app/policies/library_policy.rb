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
        user # we must have a user
    end
    
end
