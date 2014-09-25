class Comment < ActiveRecord::Base;
  include Voteable

  # this is the gem I made class name
  include TotalVotesGsmith

  belongs_to :user
  belongs_to :post
  has_many :votes, as: :voteable

  validates :body, presence: true, length: {minimum: 5}


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


end