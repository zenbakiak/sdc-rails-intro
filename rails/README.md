### Rails basic commands

Start a new app
```
$ rails new my_app
```

Running the server
```
$ rails server
$ rails s
```

Running console
```
$ rails console
$ rails c
```

Exiting from console or server with `ctrl+c`

### Less words, hands on our first app

The challenge:

_Build a 9gag like app in less than 1 hour_

### Specs

* We want a web application where users can post funny images
* Users can vote for images
* Feature section show images with more than 5 votes
* if there's enough time, users can comment gags


Database model:
```
  gag:
    title:string
    media_file:string
    votes_count:integer
    comments_count:integer
    author_id:integer
  vote:
    gag_id:integer
    user_id:integer
  comment:
    gag_id:integer
    content:text
    user_id:integer
```

```
commands:
subl .
$ rails g scaffold gag title:string media_file:string votes_count:integer comments_count:integer author_id:integer

review migration:
20151103200838_create_gags.rb
add defaults:
t.integer :votes_count, default: 0
t.integer :comments_count, default: 0

rake db:migrate

routes.rb
root 'gags#index'

rails s

Add carrierwave to gemfile

gem "mini_magick"
gem 'carrierwave'
https://github.com/carrierwaveuploader/carrierwave

bundle install

rails generate uploader Gag

gag_uploader.rb
include CarrierWave::MiniMagick in order to create versions

  version :thumb do
    process :resize_to_fill => [200, 200]
  end

  version :sidebar do
    process :resize_to_fill => [300, 200]
  end

  version :post do
    process :resize_to_fit => [500, 200]
  end

uncomment
  def extension_white_list
    %w(jpg jpeg gif png)
  end

gag.rb
  class Gag < ActiveRecord::Base
    mount_uploader :media_file, GagUploader
  end

jquery cdn:
  https://code.jquery.com/jquery-2.1.4.min.js
Bootstrap cdn
  http://getbootstrap.com/getting-started/

Add devise for authentications
https://github.com/plataformatec/devise
gem 'devise'
$ bundle install
$ rails generate devise:install
$ rails generate devise User
# Edit migration
add t.string :username
rake db:migrate

gags_controller.rb
  before_action :authenticate_user!, except: [:show, :index]

rails g model vote gag_id:integer user_id:integer

class Gag < ActiveRecord::Base
  has_many :votes
  mount_uploader :media_file, GagUploader
end

class Vote < ActiveRecord::Base
  belongs_to :gag, counter_cache: true
end

class GagsController < ApplicationController
  before_action :set_gag, only: [:show, :edit, :update, :destroy, :vote]
  #...
end

```

Comments:
rails g scaffold comment gag_id:integer content:text user_id:integer
