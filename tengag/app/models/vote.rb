class Vote < ActiveRecord::Base
  belongs_to :gag, counter_cache: true
end
