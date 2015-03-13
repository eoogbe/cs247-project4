class CommentsController < ApplicationController
  def new
    self.note = Note.find(params[:note_id])
    self.comment = Comment.new
  end

  def create
    self.note = Note.find(params[:note_id])
	
    self.comment = note.comments.build(comment_params) do |c|
	  c.user = current_user
    end
    
    if comment.save
      redirect_to note.student
    else
      render :new
    end
  end
  
  private
  helper_attr :note, :comment
  
  def comment_params
	params.require(:comment).permit(:text)
  end
end
