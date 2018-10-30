# Q0: Why are these two errors being thrown?

We're getting a migration error because we have changes in the database schema that haven't been reflected in our database yet.
We get the NameError because we haven't defined our Pokemon model yet.

# Q1: How are the random Pokemon appearing? What is the common factor between all the possible Pokemon that appear? *

The random Pokemon are being pulled out using a .sample of an array of the trainerless Pokemon (pulled out with a db query), then being displayed in the index.html.erb file with the erb line <%= image_tag("pokemon/#{@pokemon.ndex}.png", alt: "pokemon") %>.
The common factor between them is that they're all trainerless.

# Question 2a: What does the following line do "<%= button_to "Throw a Pokeball!", capture_path(id: @pokemon), :class => "button medium", :method => :patch %>"? Be specific about what "capture_path(id: @pokemon)" is doing. If you're having trouble, look at the Help section in the README.

This line is creating a button with label "Throw a Pokeball!" of HTML/CSS class "button medium" that, when clicked, sends a PATCH request to whatever path capture_path links to. In this case, in my config/routes.rb file, I specified the line `patch "capture/:id", to: "pokemons#capture", as: "capture"`. The `as: "capture"` specifies that the `capture_path(arg)` function will map to `capture/:id`, and arg is expected to be an appropriate model object with an `:id` attribute, which the function will pull out and pass to the function in `params`.

# Question 3: What would you name your own Pokemon?

# Question 4: What did you pass into the redirect_to? If it is a path, what did that path need? If it is not a path, why is it okay not to have a path here?

# Question 5: Explain how putting this line "flash[:error] = @pokemon.errors.full_messages.to_sentence" shows error messages on your form.

# Give us feedback on the project and decal below!

# Extra credit: Link your Heroku deployed app
