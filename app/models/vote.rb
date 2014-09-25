class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :voteable, polymorphic: true

  # comment for now for ease of testing
  #validates_uniqueness_of :user, scope: [:voteable_id, :voteable_type]

end