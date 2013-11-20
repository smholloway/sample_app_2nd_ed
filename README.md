# Ruby on Rails Tutorial: sample application with Toopher

This is a sample application from 
[*Ruby on Rails Tutorial: Learn Web Development with Rails*](http://railstutorial.org/)
by [Michael Hartl](http://michaelhartl.com/) (specifically, the
[railstutorial/sample_app_2nd_ed](https://github.com/railstutorial/sample_app_2nd_ed)). It has been augmented to
include [Toopher](https://www.toopher.com/) for two-factor authentication.

This is only an example provided as a reference.

## Setup

Getting the sample app running locally is similar to starting any Rails
project: clone the repo, install your gems, and migrate your database.
One additional step is to configure Toopher. In this     example, the
Toopher client is instantiated using API credentials stored in the
environment (`toopher = ToopherAPI.new(ENV['TOOPHER_CONSUMER_KEY'],
ENV['TOOPHER_CONSUMER_SECRET'])`), so you need to   set
`TOOPHER_CONSUMER_KEY` and `TOOPHER_CONSUMER_SECRET`.

``` sh
git clone git@github.com:smholloway/sample_app_2nd_ed_with_toopher.git
cp config/database.yml.example config/database.yml
bundle install
bundle exec rake db:migrate
export TOOPHER_CONSUMER_KEY=xxx
export TOOPHER_CONSUMER_SECRET=xxx
rails server
```

## The Toopher bits
To see Toopher in action, create an account, then navigate to the user
settings page. You should see a section for Toopher, which you enable by
pairing. After successfully pairing, log out, then log back in.

Curious about the changes necessary to integrate Toopher? See the [pull
request](https://github.com/smholloway/sample_app_2nd_ed_with_toopher/pull/1)
that made it happen.

## Notes

* The login flow changed but the tests were not updated, so they are failing.
* In this example the UI is merely workable--please use your imagination for how a
  professional designer would craft modals and input forms.
* There is no easy way to reset Toopher when locked out. In a real implementation, 
consider allowing users to reset Toopher like they reset a forgotten password; 
for example, using a security question or email reset.

