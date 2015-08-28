class Activity < ActiveRecord::Base

  belongs_to :creator, class_name: 'User'
  belongs_to :issue

  has_many :contents, class_name: 'ActivityContent', foreign_key: 'activity_id', dependent: :destroy

  delegate :original, :transformed, :original=, :transformed=, to: :delegate_content

  def delegate_content
    @_content ||= ( content || contents.build(activity: self))
  end

  def content
    contents.first
  end

end
