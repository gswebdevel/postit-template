class User < ActiveRecord::Base;
  has_many :posts
  has_many :comments
  has_many :votes

  has_secure_password validations: false # false to manage authentication our selves

  validates :username, presence: true, uniqueness: true
  validates :password, presence: true, on: :create, length: {minimum: 3}

  def posts_sorted_by_votes
    self.posts.sort_by{|x| x.total_votes}.reverse
  end

end