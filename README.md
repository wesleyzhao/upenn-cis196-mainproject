Link to the deployed app
------------------------
http://peaceful-scrubland-1272.herokuapp.com/

# HW 9

Goal of the homework
--------------------
To learn how to make database queries for a rails app.

In this homework, I specifically added the following sets of queries:
- Controller: users_controller; method: index; query type: ordering; description: it orders the users displayed on the users index page by name, either ascending or descending depending on what the user wants (a link has been added to the view to let the user decide). Default is in ascending order.
- Controller: food_items_controller; method: index; query type: ordering; description: it orders the fooditems displayed on the index page by name, either ascending or descending depending on what the user wants (a link has been added to the view to let the user decide). Default is in ascending order.
- Controller: users_controller; method: show; query type: ordering, condition, limit; description: show, in order from latest to oldest, the last two food items tracked by the user currently being viewed.
- Controller: food_items_controller; method: index; query type: ordering; description: it orders the fooditems displayed on the index page by calories, either ascending or descending depending on what the user wants (a link has been added to the view to let the user decide). Default is in ascending order.
- Controller: food_items_controller; method: show; query type: ordering, condition; description: show, in order from least calories to most calories, food items that have been tracked that have less than the calories the food item showing has.

Issues I ran in to
------------------

(1) Setting production environment variables

When I saw that there would be variables such as the following

ENV['MAILGUN_SMTP_LOGIN']

I started trying to figure out how to make sure we could do that in Heroku without pushing code to a repo where credentials were exposed. After some googling I found out that you simply just use the heroku config command. So I could check what variables are config'd by:

>> heroku config

And to add it I could do

>> heroku config:set VARNAME=var

After checking, I found out that adding Mailgun as an add-on already set the heroku production variables.

# HW 8

Goal of the homework
--------------------
To learn how add a Heroku add-ons.

In this homework, I specifically added Mailgun (sending/receiving mail api) to my application.

Issues I ran in to
------------------

(1) Setting production environment variables

When I saw that there would be variables such as the following

ENV['MAILGUN_SMTP_LOGIN']

I started trying to figure out how to make sure we could do that in Heroku without pushing code to a repo where credentials were exposed. After some googling I found out that you simply just use the heroku config command. So I could check what variables are config'd by:

>> heroku config

And to add it I could do

>> heroku config:set VARNAME=var

After checking, I found out that adding Mailgun as an add-on already set the heroku production variables.

# HW 7
Goal of the homework
--------------------
To learn how to set up validations for models.
The validations that I added included:
- "present" for a food item name
- custom regex for any valid integer for food item nutritional values
- custom regex for any valid postive number for user registration weight, body fat, height values

Issues I ran in to
------------------

(1) Application controller: sanitizing with devise even when not in use

For some reason the if-statement I used to check for if the devise_controller was being used was not working properly. Before it was:

  if :devise_controller?
    before_action :configure_devise_permitted_parameters
  end

Now it is:

  before_action :configure_devise_permitted_parameters, if: :devise_controller?	
For some reason, before I changed it even if I wasn't using devise, it would try to run through the devise sanitizer which would throw errors if I was trying to create or update food items. Tis fixed now.

(2) Number regex validation

This is actually a somewhat unresolved issue. For some reason, my integer/float regex validations are not fully working. If you type a string, the model will update/create with that field being a 0. I'm not sure why it does this, since when using the following regex:

\d?

the number 10 is not allowed to be submitted but "asdfasdf" passes.

This tells me it must be something where it's not validated, and so RoR just automatically saves a 0. Not quite sure.


# twerk,Home 6


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



