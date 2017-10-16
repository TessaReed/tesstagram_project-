# README
## 5/10/2017

Creating an Instagram app using rails.
Implementing 'shrine' gem and 'devise' gem.
Download Bootstrap.

Note: the shrine gem instructions on github are incorrect!

1. rails new instagram (create rails app)
2. create a new branch in github. git checkout -b
3. put gem 'devise' in gemfile
4. rails g devise:install
5. create user database:
6. rails g devise User
7. migrate database
8. rails db:migrate
9. create the view page
10. rails g controller home index
11. create scaffold, a scaffold in Rails is a full set of model, database migration for that model, controller to manipulate it, views to view and manipulate the data, and a test suite.
12. rails g scaffold image_data:text user:refrences caption.

How we solved problems with 'shrine' gem.
1. Firstly in routes.rb changed our RESOURCES to resource:photos
2. photos.controller in the def photo_params was initially params.require(:photo).permit (:image-data, :user_id, :caption)
changed to:
params.require(:photo)permit (:image, :user_id, :caption)
