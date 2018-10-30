# Academic Workshop of Singapore

This was done as a client project for the Academic Workshop of Singapore to redo their website and create a custom CMS. This is a dated version of the code (we moved to a private bitbucket server shortly after) but it still gets the idea across.

Also, please note that I had zero say in the gradients used on this site. It was a very important design aspect for the school. But it looks somewhat better [nowadays](https://www.theacademicworkshop.com).

To Setup:

* `git clone <repository-url>`

* `cd aws`

* `bundle install`

* To create Database `rake db:create` then `rake db:migrate`

* To run the app: `rails s`

You may notice that the app looks a bit boring right now, as no content has been added to be displayed on the pages. To add your own, you'll need to create an admin account:

* Visit `http://localhost:3000/admins/sign_up` and create an account

* Once your account is created, you'll be directed back to the home page, but you'll now see a Dashboard tab on the menu. Feel free to explore and create, delete, or edit any entries you would like to be rendered on the client-facing side. 