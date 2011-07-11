Simple refinery app to test inclusion of the latest (on 11 Jul 2011)
refinery-page-images

Create a fresh reinfery app
---------------------------

```
refinerycms tsl
```

Add a submodule with latest code from refinery-page-images
----------------------------------------------------------

```
cd tsl
mkdir -p vendor/gems/refinerycms-page-images
git submodule add https://github.com/resolve/refinerycms-page-images.git 
git submodule init
git submodule update
```

Use refinery-page-images
------------------------

```
echo "gem 'refinerycms-page-images',  '~> 1.0', :path => 'vendor/gems'" > Gemfile
bundle install && rails g refinerycms_page_images && rake db:migrate
```

Create an engine and use it
---------------------------

```
rails g refinery_engine club name:string logo:image description:text
bundle install && rails g refinerycms_clubs && rake db:migrate
```

In `vendor/engines/clubs/app/models/club.rb` add
------------------------------------------------

```
attr_accessible :name, :position, :logo_id, :description
has_many_page_images
```

Modification in admin and front view (see repo)
-----------------------------------------------