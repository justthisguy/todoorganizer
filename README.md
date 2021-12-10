# todo organizer
===========


### Build From Scratch

```

rails new todoorganizer -d postgresql
--webpack=react
--skip-action-cable
--skip-action-mailbox
--skip-action-text
--skip-bundle
--skip-coffee
--skip-sprockets
--skip-system-test
--skip-turbolinks
--skip-test

rails webpacker:install
rails generate rspec:install


git remote add origin git@github.com:justthisguy/todoorganizer.git


rails g model task

rails g model wundersubtask
rails g model wundertask
rails g model wunderlist
rails g model wunderfolder


```
