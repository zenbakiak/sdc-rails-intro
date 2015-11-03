class CommentsController < ApplicationController
  before_action :set_comment, only: [:destroy]

  # POST /comments
  # POST /comments.json
  def create
    @gag = Gag.find(params[:gag_id])
    @comment = @gag.comments.build(comment_params)
    @comment.user_id = current_user.id

    respond_to do |format|
      if @comment.save
        format.html { redirect_to @comment.gag, notice: 'Comment was successfully created.' }
        format.json { render :show, status: :created, location: @comment }
        format.js {}
      else
        format.html { render :new }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end


  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to comments_url, notice: 'Comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:gag_id, :content, :user_id)
    end
end
