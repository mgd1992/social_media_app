module Posts

  class ReactionsController < BaseController
    def create
      reactions = current_user.reactions.find_or_create_by(post: @post)
      reactions.update(name: params[:name])

      respond_to do |format|
        format.turbo_stream {}
      end
    end
  end
  
end
