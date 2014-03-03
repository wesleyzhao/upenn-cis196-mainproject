# twerk,Home 6

Link to the deployed app
------------------------
http://peaceful-scrubland-1272.herokuapp.com/

Goal of the homework
--------------------
To learn how to work with Ruby Gems; specifically, I learned how to use the Devise gem.
In implementing it, here is what I accomplished:
- installed devise
- created new and edited old migrations to properly enable the migrations devise required
- edited the registration views to reflect the fields in my User model
- added a basic navbar to allow logged-in users to log-out, vice versa
- restricted all Food Item views to logged in users only (in order to only allow users to see food items, and users to create food items that are auto-linked to themselves)
- restricted users to only being able to edit/destroy their own user models
- deployed the changes to Heroku and, after much hardship, properly migrated the Heroku postgres db as well

Issues I ran in to
------------------

(1) Typo regarding if user_signed_in?
On page 4 of gems.pdf the navbar that is given as an example incorrectly shows the Logout link if 
!user_signed_in?
However, that means a user that is NOT signed in will see the Logout link. This just required removing the "!"

(2) Using the before_filter
I incorrectly thought that you could add a before_filter from function to function, so I added it to views that I wanted to require the user to be logged in for. It turns out, that you can use it once at the top of a controller to restrict all the controllers.

(3) Migrating the Heroku DB
So even though the basic migrations/fixes described in gems.pdf twerks on our local sqlite dbs, it does not work so well when deploying and migrating on Heroku.
On Heroku, even though the migration removes the email column, the PG database still holds on to the UNIQUE index on email. So when trying to migrate, I got an error saying that you cannot duplicate the index on email.
So my fix for this was to go into the migration and comment out the line that adds another index on email. After doing this, the migration worked just fine.

(4) Custom fields for Devise registration views
After adding custom fields in the registration views for devise as gems.pdf showed, the fields did not actually save. 
In order to so, I realized we had to, again, permit parameters for the devise controllers. So I looked it up on Google and used this link as my general guide:
http://stackoverflow.com/questions/16297797/add-custom-field-column-to-devise-with-rails-4

# Hometwerk 5

Link to the deployed app
------------------------
http://peaceful-scrubland-1272.herokuapp.com/

Goal of the homework
--------------------
Continue learning the structure of Rails and how the MVC framework works by adding show, edit, and delete functionality to the models we created for the previous homework. Though similar to what we learned previously, learning show, edit, and delete helped solidify exactly how the views, controllers, and models all interacted. Additionally, we had to make sure the edit, show, and delete functionality was accessible through the index pages already created.

Issues I ran in to
------------------

There was only one small issue that I ran in to which was another typo (no biggie, but it was an issue nonethless):

On pg2 the location to the user controller is shown as follows:
"App/views/controllers/users_controller.rb"

This was easily spotted and corrected for me.

# Hometwerk 4

Link to the deployed app
------------------------
http://peaceful-scrubland-1272.herokuapp.com/

Goal of the homework
--------------------
Learn how to deal with the MVC framework by setting up a database schema for the models needed for the final project. In addition, set up all the necessary controllers and views in order to create and view the objects created. Then link them all to the home page.

Issues I ran in to
------------------

There was a typo in the PDF/PPT that described how to create a User.
It was written as follows:

> @user.User.new(user_params)

Whereas it should have been:

> @user = User.new(user_params)

It was caught when trying to create my User and fixed, by looking closer at the code.



