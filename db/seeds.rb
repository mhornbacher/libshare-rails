# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

first_user = User.create(email: "test@test.com", password: "password", username: "first!")

ruby = Language.create(name: "Ruby", description: "love the self")
python = Language.create(name: "Ruby", description: "A nice pseudocode runtime")
javascript = Language.create(name: "Ruby", description: "A communist comune where all variables are shared with everyone else")

rails = Framework.create(name: "Rails", description: "That ruby thing")
sinatra = Framework.create(name: "Sinatra", description: "That other ruby thing")
django = Framework.create(name: "Django", description: "That python MVC thing from 2005")
flask = Framework.create(name: "Flask", description: "That other python MVC")
jquery = Framework.create(name: "jQuery", description: "Old gradpaw")
angular = Framework.create(name: "Angular", description: "Squirrel, squirrel")
react = Framework.create(name: "React", description: "The cool new kid on the block")

# Rails
devise = Library.create(framework: rails, language: ruby, name: "Devise", version: "3.5", description: "Fast user sign in", documentation_url: "https://github.com/plataformatec/devise/wiki", library_url: "https://github.com/plataformatec/devise", created_by: first_user)
cancan = Library.create(framework: rails, language: ruby, name: "CanCanCan", description: "Can, Can, Can he?", created_by: first_user)
pundit = Library.create(framework: rails, language: ruby, name: "Pundit", description: "Who can do what", created_by: first_user)
ujs = Library.create(framework: rails, language: javascript, name: "jQuery-ujs", description: "Bunch of jQuery tools", created_by: first_user)

# Sinatra
active_record = Library.create(framework: sinatra, language: ruby, name: "ActiveRecord", description: "Simple ORM for Sinara and Rails", created_by: first_user)

# Django and Flask
jet = Library.create(framework: django, language: python, name: "Jet", description: "Fancy admin real quick", created_by: first_user)
rest = Library.create(framework: django, language: python, name: "Django Rest Framework", description: "REST API's in django", created_by: first_user)
flask_login = Library.create(framework: flask, language: python, name: "Flask Login", description: "User login in flask", created_by: first_user)

# jQuery
svg_magic = Library.create(framework: jquery, language: javascript, name: "SVGMagic", description: "Cross browser SVG files", created_by: first_user)
face_detection = Library.create(framework: jquery, language: javascript, name: "Face Detection", description: "Get peoples faces from images", created_by: first_user)
round_slider = Library.create(framework: jquery, language: javascript, name: "RoundSlider", description: "A slider that is round", created_by: first_user)

# Angular
ui_router = Library.create(framework: angular, language: javascript, name: "UIRouter", description: "Make SPA's Great again", created_by: first_user)
line_chart = Library.create(framework: angular, language: javascript, name: "line_cart", description: "Spice up the page", created_by: first_user)

# React
pivot = Library.create(framework: react, language: javascript, name: "React Pivot", description: "Fancy Tables", created_by: first_user)
list = Library.create(framework: react, language: javascript, name: "React List", description: "Scrolling list component", created_by: first_user)


# Reviews - Rails
Review.create(library: devise, rating: 2, user: first_user)
Review.create(library: cancan, rating: 4, user: first_user)
Review.create(library: pundit, rating: 3, user: first_user)
Review.create(library: ujs, rating: 5, user: first_user)
#sinatra
2.times {Review.create(library: active_record, rating: 2, user: first_user)}
#django
Review.create(library: jet, rating: 5, user: first_user)
Review.create(library: rest, rating: 4, user: first_user)
Review.create(library: flask_login, rating: 3, user: first_user)
#jquery
Review.create(library: svg_magic, rating: 2, user: first_user)
Review.create(library: face_detection, rating: 2, user: first_user)
Review.create(library: round_slider, rating: 2, user: first_user)

Review.create(library: ui_router, rating: 4, user: first_user)
Review.create(library: line_chart, rating: 5, user: first_user)

2.times do
    Review.create(library: list, rating: 3, user: first_user)
    Review.create(library: pivot, rating: 2, user: first_user)
end
