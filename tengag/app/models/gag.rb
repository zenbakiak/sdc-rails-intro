class Gag < ActiveRecord::Base
  has_many :votes
  has_many :comments
  belongs_to :author, class_name: "User", foreign_key: 'author_id'
  mount_uploader :media_file, GagUploader
end
