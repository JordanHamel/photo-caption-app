class Photo < ActiveRecord::Base
  attr_accessible :caption, :file, :user_id

  validates :user_id, presence: true

  validate :file_size_validation, :if => "file?"  

  def file_size_validation
    errors[:file] << "should be less than 1MB" if file.size > 1.megabytes
  end

  belongs_to :user
end
