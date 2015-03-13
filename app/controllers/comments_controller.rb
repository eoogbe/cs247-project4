class CommentsController < ApplicationController
	
  def new
    # self.note = Note.find(params[:note_id])
    # self.student = Note
    @note = Note.find(params[:note_id])
    @comment = Comment.new
  end

  

  def create
    self.note = Note.find(params[:note_id])
    self.student = Student.find(Note.find(params[:note_id]).student_id)

    comment = Comment.new
    comment.note_id = params[:note_id]
    comment.user_id = current_user
    comment.text = params[:comment][:text]
    # comment.user_id = params[:student_id]
    if comment.save
      # redirect_to note.find(params[:student_id])
      # student_path(Note.find(params[:note_id]).student_id)
      redirect_to student
    else
      render :new
    end
  end

  
  
  private
  helper_attr :note, :student
  
  # def note_params
  #   params.require(:note).permit(:category, :importance, :mood, :text)
  # end
 


end
