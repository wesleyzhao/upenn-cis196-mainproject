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



