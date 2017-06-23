# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project
- [x] Include at least one has_many relationship (Language has_many Libraries) 
- [x] Include at least one belongs_to relationship (Review belongs_to Library and User)
- [x] Include at least one has_many through relationship (Framework has_many Languages through Libraries)
- [x] The "through" part of the has_many through includes at least one user submittable attribute (library.name)
- [x] Include reasonable validations for simple model objects (User, Library, Review, Framework, Language)
- [x] Include a class level ActiveRecord scope method (Library.most_popular URL: /libraries/most_popular)
- [ ] Include a nested form writing to an associated model using a custom attribute writer (form URL, model name e.g. /recipe/new, Item)
- [x] Include signup (Devise)
- [x] Include login (Devise)
- [x] Include logout (Devise)
- [x] Include third party signup/login (Devise/OmniAuth -> Github)
- [ ] Include nested resource show or index (URL e.g. users/2/recipes)
- [ ] Include nested resource "new" form (URL e.g. recipes/1/ingredients)
- [x] Include form display of validation errors (/frameworks/new)

Confirm:
- [ ] The application is pretty DRY
- [ ] Limited logic in controllers
- [ ] Views use helper methods if appropriate
- [ ] Views use partials if appropriate
