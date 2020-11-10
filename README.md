# README

### MVC
Ruby On Rails MVC (Model-View-Controller) based framework. MVC separates an application into three components - Model, 
View, and Controller.

`Model` - Model represents the shape of the data. Model controls data coming from view and data going into the model.

`View` - View in MVC is a user interface. View display model data to the user and also enables them to modify them. 

`Controller` - The controller handles the user request. Typically, the user uses the view and raises an HTTP request, 
which will be handled by the controller. The controller processes the request and returns the appropriate view as a 
response.

More about MVC [here](https://www.tutorialsteacher.com/mvc/mvc-architecture#:~:text=MVC%20stands%20for%20Model%2C%20View,data%20retrieved%20from%20the%20database.).

### Create an app
To create a new app we can run - `rails new app_name`.
This will generate an app for us. 

### Open the app
Once the app is generated, you can go into it via the command - `cd app_name` and then
run it by typing `rails server` into the terminal within the app.
By default it runs on `localhost:3000`.

### Create a new controller and view
We generate a controller named <b>Home</b> and give it a view called <b>index</b>.

`rails g controller Home index` `-g` - is a flag for generate. 

<b>index</b> will create a view and also an action in the controller. An action in the controller corresponds to view.

### Setting up a route

For a website to know a new view has been created we need to set a route.
We can do that by going into `app_name/config/routes.rb`. 

As a standard we want to set a root route first so it routes to our main index page. 
`root 'home#index'`. By adding this line it will change our home page and we will see information displayed on what we 
wrote in our home view.

### Adding more views (pages)

Now that we have our index page we can create more views to the website. It will not let us generating more views so we
have to add them manually. So to add a view and a controller manually first we want to add 
a controller. After making an about controller and writing an action inside, we can make a view.
So we want to make an about view in `/views/home/` and inside we create our `about.html.erb` view.

So we have our another page created and to display it we want to create a navigation bar.

### Navigation Bar

To implement a navigation bar we need to add routes in `/config/routes.rb`. In the example we added index and
about routes.
```ruby
Rails.application.routes.draw do
  get '/home/index'
  get '/home/about'

  root to: 'home#index'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
```

Now we want to add our routes into `/app/views/layouts/application.html.erb` between `<body>` tags.
Notice how paths are the same.

``` html
<!DOCTYPE html>
<html>
  <head>
    <title>TASK5</title>
    <%= csrf_meta_tags %>
    <%= csp_meta_tag %>

    <%= stylesheet_link_tag 'application', media: 'all', 'data-turbolinks-track': 'reload' %>
    <%= javascript_pack_tag 'application', 'data-turbolinks-track': 'reload' %>
  </head>

  <body>
    <%= link_to "Home", root_path %>
    <%= link_to "About", root_path %>

      <%= yield %>
  </body>
</html>

```

To see what paths we can add for router to work, we can write a `rake routes` command in our project directory.
This will list our routes and we can see a line that we need:
```
Prefix     | Verb |  URI Pattern            | Controller#Action
-----------|------|-------------------------|----------------------------
home_index | GET  |  /home/index(.:format)  | home#index
home_about | GET  |  /home/about(.:format)  | home#about
root       | GET  |  /                      | home#index
....        ....     ....                     ....
```

We can copy `home_about` prefix and paste it into `/app/views/layouts/application.html.erb` just like this:

``` html
  <body>
    <%= link_to "Home", root_path %>
    <%= link_to "About", home_about_path %>

      <%= yield %>
  </body>
```

This will let a user navigate between pages so we can add more of those. After we add more pages, we can work on 
navigation bar and pages styling.

### Adding Bootstrap to our page
To save time and not to write custom css(scss) we can add bootstrap to our project.
To add a bootstrap 4 ruby on rails needs to be version 6 or higher. 
We can install it by using this command (we will also need jquery for bootstrap and popper.js to fully work):
```
yarn add bootstrap jquery popper.js
```

After installing something we always want to re-bundle the app:
```
bundle install
```

To use bootstrap we want to import it into `/app/javascript/packs/application.js`
```
import 'bootstrap'
require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
```

Now we want to rename `application.css` into `application.scss` located in `/app/assets/stylesheets/application.css`
And inside we want to add a line:
```
@import "bootstrap/scss/bootstrap";
```

It may not work so change it to:
```
@import "~bootstrap/scss/bootstrap.scss";
```
It should work but it doesnt so we may skip it for now and just write custom scss later on the line.

* Rails version - `6.0.3.4`

* Ruby version - `ruby 2.7.0p0 (2019-12-25 revision 647ee6f091) [x86_64-linux]`

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
