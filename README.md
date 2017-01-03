## Assemble API

A Rails API for the Assemble mobile app.

To run:

* clone the repo
* run `bundle install`
* run `rails db:migrate`
* run `rails db:setup`
* run `rails server`
* visit `localhost:3000`

Check out the `routes.rb` file and controllers to see the available endpoints.

To get the app itself running, clone [the Ember app](https://github.com/lizbaillie/assemble), run `npm install` and `bower install`, then `ember server`. Navigate to `localhost:4200`.

TODO:

- [ ] put more thought into the design/structure of the API
- [ ] add `POST`/`PUT`/`DELETE` endpoints (I believe it's all `GET` right now)
- [ ] add authentication
- [ ] deploy 🚀🚀🚀
