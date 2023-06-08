module Histories
  class CreatePostJob < ApplicationJob
    TYPE = 'post_created'.freeze

		queue_as :history

    def perform(user:, created_at: )
      History.create!(type: TYPE, user: user, created_at: created_at)
    end
  end
end
