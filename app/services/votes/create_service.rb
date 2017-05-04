module Votes
  class CreateService
    attr_reader :user, :restaurant, :poll

    def initialize(user:, restaurant:, poll:)
      @user = user
      @restaurant = restaurant
      @poll = poll
    end

    def call
      vote = Vote.create(
        user: user,
        restaurant: restaurant,
        poll: poll
      )

      if vote.valid?
        SleepJob.perform_now
        vote
      else
        {
          errors: vote.errors.full_messages
        }
      end
    end
  end
end
