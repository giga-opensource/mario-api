module ProjectConfigurable
  extend ActiveSupport::Concern

  included do
    validates :name, :project_id, presence: true
    validates :project_id, uniqueness: { scope: :name }

    belongs_to :project
    has_many :issues, dependent: :nullify
  end

end