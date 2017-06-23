# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

first_user = User.create(email: "test@test.com", password: "password", username: "first!")
User.create(email: "admin@admin.net", password: "password", username: "admin_main", role: 10)

ruby = Language.create(name: "Ruby", description: "love the self")
javascript = Language.create(name: "JavaScript", description: "A communist comune where all variables are shared with everyone else")

rails = Framework.create(name: "Rails", description: "That ruby thing")
sinatra = Framework.create(name: "Sinatra", description: "That other ruby thing")
jquery = Framework.create(name: "jQuery", description: "Old gradpaw")
react = Framework.create(name: "React", description: "The cool new kid on the block")

# Rails
devise = Library.create(framework: rails, language: ruby, name: "Devise", version: "3.5", description: "Fast user sign in", documentation_url: "https://github.com/plataformatec/devise/wiki", library_url: "https://github.com/plataformatec/devise", created_by: first_user)
cancan = Library.create(framework: rails, language: ruby, name: "CanCanCan", description: "Can, Can, Can he?", created_by: first_user)
pundit = Library.create(framework: rails, language: ruby, name: "Pundit", created_by: first_user)
ujs = Library.create(framework: rails, language: javascript, name: "UJS", created_by: first_user)

# Sinatra
active_record = Library.create(framework: sinatra, language: ruby, name: "ActiveRecord", description: "Simple ORM for Sinara and Rails", created_by: first_user)

# jQuery
svg_magic = Library.create(framework: jquery, language: javascript, name: "SVGMagic", description: "Cross browser SVG files", created_by: first_user)
face_detection = Library.create(framework: jquery, language: javascript, name: "Face Detection", description: "Get peoples faces from images", created_by: first_user)
round_slider = Library.create(framework: jquery, language: javascript, name: "RoundSlider", description: "A slider that is round", created_by: first_user)

# React
pivot = Library.create(framework: react, language: javascript, name: "React Pivot", description: "Fancy Tables", created_by: first_user)
list = Library.create(framework: react, language: javascript, name: "React List", description: "Scrolling list component", created_by: first_user)


# Reviews - Rails
Review.create(library: devise, rating: 2, user: first_user, comment: "Really Great framework")
Review.create(library: cancan, rating: 4, user: first_user)
Review.create(library: pundit, rating: 3, user: first_user)
Review.create(library: ujs, rating: 5, user: first_user)
#sinatra
Review.create(library: active_record, rating: 2, user: first_user)

#jquery
Review.create(library: svg_magic, rating: 2, user: first_user)
Review.create(library: face_detection, rating: 2, user: first_user)
Review.create(library: round_slider, rating: 2, user: first_user)
# react
Review.create(library: list, rating: 3, user: first_user)
Review.create(library: pivot, rating: 2, user: first_user)
