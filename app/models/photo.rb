class Photo < ActiveRecord::Base
  attr_accessible :caption, :file, :user_id

  validates :user_id, presence: true
  # REV: why no validation on caption/file?
  # validates :file, presence: true, file_size: { maximum: 2.0.megabytes.to_i }

  belongs_to :user
end
