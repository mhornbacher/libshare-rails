class LibraryPolicy < ApplicationPolicy

    # add @library to the plicy for ease of reading
    attr_reader :library
    def initialize(user, library)
        super(user, library)
        @library = library
    end

    def update?
        user.admin? || library.try(:created_by) == user
    end
    
    def new
        binding.pry
    end
    
    
end
