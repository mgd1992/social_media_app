module Posts

  class CommentsController < BaseController
    before_action :set_comment, only: [:destroy]

    def index

    end
    def new
    end

    def create
      @comment = @post.comments.new(comment_params)
      @comment.user = current_user
      @comment.update(comment_params)
      redirect_to root_path
    end

    def destroy
      if @comment.user == current_user
        @comment.destroy
        respond_to do |format|
          format.turbo_stream
          format.html { redirect_to post_path(@post), notice: "Comentario eliminado." }
        end
      else
        respond_to do |format|
          format.turbo_stream { head :forbidden }
          format.html { redirect_to post_path(@post), alert: "No tenés permiso para eliminar este comentario." }
        end
      end
    end



    private

    def set_comment
      @comment = @post.comments.find(params[:id])
    end

    def comment_params
      params.require(:comment).permit(:body)
    end

  end
end
