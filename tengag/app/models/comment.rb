class Comment < ActiveRecord::Base
  belongs_to :gag
  belongs_to :user
end
