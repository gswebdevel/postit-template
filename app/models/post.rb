class Post < ActiveRecord::Base;
  include Voteable

  belongs_to :user
  has_many :comments
  has_many :post_categories
  has_many :categories, through: :post_categories
  has_many :votes, as: :voteable

  # see active record call backs
  before_save :generate_slug

  validates :title, presence: true, length: {minimum: 5}
  validates :description, presence: true
  validates :url, presence: true, uniqueness: true

  # def total_votes
  #   up_votes - down_votes
  # end
  #
  # def up_votes
  #   self.votes.where(vote: true).size
  # end
  # def down_votes
  #   self.votes.where(vote: false).size
  # end

  def nice_created_at_date()
    created_at.strftime("%m.%d.%Y")
  end

  def display_created_at_date()
    nice_date(created_at)
  end

  def generate_slug
    # a simple slug
    self.slug =  "#{title}".parameterize
    # do this instead with gsub
    str = self.title
    str = str.strip
    str.gsub! /\s*[^A-Za-z0-9]\s*/, '-'
    str.gsub! /-+/,"-"
    self.slug = str.downcase




    #self.save
    # but use active record "Callbacks" in stead
  end

  def may_vote(the_user)
   !self.votes.find_by(user_id: the_user.id)
  end

# would be returning the ID by default, that is with (params[post])
  def to_param
    self.slug
  end



end