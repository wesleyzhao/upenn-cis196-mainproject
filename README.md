Link to the deployed app
------------------------
http://vast-island-3455.herokuapp.com/

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



