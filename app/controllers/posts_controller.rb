class PostsController < ApplicationController
  def create
    Posts::CreateService.call(title: post_params[:title],
                              body: post_params[:body],
                              author: post_params[:author])

    render json: @post
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :author)
  end
end

