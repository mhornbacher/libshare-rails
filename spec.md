# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project
- [x] Include at least one has_many relationship (Language has_many Libraries) 
- [x] Include at least one belongs_to relationship (Review belongs_to Library and User)
- [x] Include at least one has_many through relationship (Framework has_many Languages through Libraries)
- [x] The "through" part of the has_many through includes at least one user submittable attribute (library.name)
- [x] Include reasonable validations for simple model objects (User, Library, Review, Framework, Language)
- [x] Include a class level ActiveRecord scope method (Library.most_popular URL: /libraries/most_popular)
- [x] Include a nested form writing to an associated model using a custom attribute writer (form URL, model name e.g. /libraries/new, Review)
- [x] Include signup (Devise)
- [x] Include login (Devise)
- [x] Include logout (Devise)
- [x] Include third party signup/login (Devise/OmniAuth -> Github)
- [x] Include nested resource show or index (index: libraries/2/reviews)
- [x] Include nested resource "new" form (libraries/2/reviews/new)
- [x] Include form display of validation errors (/frameworks/new)

Confirm:
- [x] The application is pretty DRY
- [x] Limited logic in controllers
- [x] Views use helper methods if appropriate
- [x] Views use partials if appropriate
