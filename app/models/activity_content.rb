class ActivityContent < ActiveRecord::Base
  belongs_to :activity, touch: true
end
