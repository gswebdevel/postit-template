module Voteable
  # use this to
  def self.included(base)
    base.send(:include, InstanceMethods)
    base.extend ClassMethods
    base.class_eval do
      my_class_method
    end
  end

  # this is required to make all methods instance variables of the place they area used
  #extend ActiveSupport::Concern

  # this is included in the post.rb and comment.rb models

  #included do
    # code her will run the first time this is included in a model
    # assosiation could go here too
    #has_many :votes, as: :voteable
  #end

  module InstanceMethods
    def total_votes
      up_votes - down_votes
    end

    def up_votes
      self.votes.where(vote: true).size
    end

    def down_votes
      self.votes.where(vote: false).size
    end
  end

  module ClassMethods
    def my_class_method
      puts "this is a class method."
      # assosiation could go here too
      #has_many :votes, as: :voteable
    end
  end

end