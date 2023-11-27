# Setup What's The Weather?
- `git clone` the repo from

- run `bundle install`

- run `rails db:setup`

- run `bundle exec rake assets:precompile`

- go to openweathermap.org and sign up for a free API Key

- run `EDITOR=vim rails credentials:edit`

- add:
<pre>
    open_weather_api:
        key: *insert open weather api key here*
</pre>

- save your changes to the credentials file

# Run What's the Weather?

- run `bin/rails server`

- view the app at [localhost](http://localhost:3000)

# Run specs

- run `bundle exec rspec`
