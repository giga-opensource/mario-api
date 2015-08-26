class Attachment < ActiveRecord::Base

  belongs_to :attachable, polymorphic: true

  has_attached_file :file

  validates_attachment :file, presence: true,
                content_type: { content_type: /\Aimage/ },
                size: { in: 0..10.megabytes }

end
