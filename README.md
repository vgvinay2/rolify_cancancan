# rolify_cancancan

Used in this app: Rails4, rolify and cancancan gems.
The authentification was made from scratch following railscasts tutorials.

To run the aplication run:

```
bundle install
rake db:migrate
rails s
```

To add new roles, for now,you have to do it manually:

``
Role.create(name: "admin")
``
That way it will appear in the logup
