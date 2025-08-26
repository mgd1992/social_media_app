class Posts::ReactionsController < ApplicationController
  before_action :set_post

  def create
    reactions = current_user.reactions.find_or_create_by(post: @post)
    reactions.update(name: params[:name])

    respond_to do |format|
      format.turbo_stream {}
    end
  end


  private

  def set_post
    @post = Post.find(params[:post_id])
  end
end
