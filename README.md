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

rails g model wunderfolder
rails g model wunderlist
rails g model wundertask
rails g model wundersubtask

rails g model zenkitfolder
rails g model zenkitlist
rails g model zenkittask
rails g model zenkitsubtask





```


### TODO:
* convert Wunderlist into Things
* import Zenkit
* conver Zenkit into Things
* import current Things
* harmonize all 3
* export into Things









