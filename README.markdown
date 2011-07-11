Simple refinery app to test inclusion of the latest (on 11 Jul 2011)
refinery-page-images

1. Create a fresh reinfery app
```
refinerycms tsl
```


2. Add a submodule with latest code from refinery-page-images
```
cd tsl
mkdir -p vendor/gems
git submodule add https://github.com/resolve/refinerycms-page-images.git 
vendor/gems/refinerycms-page-images
git submodule init
git submodule update
```

3. Use refinery-page-images
```
echo "" > Gemfile
gem 'refinerycms-page-images',  '~> 1.0', :path => "vendor/gems"
bundle install && rails g refinerycms_page_images && rake db:migrate
``` 

4. Create an engine and use it
```
rails g refinery_engine club name:string logo:image description:text
bundle install && rails g refinerycms_clubs && rake db:migrate
```

5. In `vendor/engines/clubs/app/models/club.rb` add
```
attr_accessible :name, :position, :logo_id, :description
has_many_page_images
``` 

6. See modification in admin and front view
