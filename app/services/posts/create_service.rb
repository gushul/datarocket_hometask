# frozen_string_literal: true
#
module Posts
  class CreateService < ApplicationService
    def initialize(title:, body:, author:)
      @title = title
      @body = body
      @author
    end

    def call
      @post = Post.create!(title: @title, body: @body, author: @author)

      PostCreationMailer.with(user: @user, post: @post).post_created.deliver_later
      ::Histories::CreatePostJob.perform_later(user: @author, created_at: Time.zone.now)
    end
  end
end
