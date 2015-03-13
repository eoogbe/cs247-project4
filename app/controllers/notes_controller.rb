class NotesController < ApplicationController
  def new
    self.student = Student.find(params[:student_id])
    self.note = student.notes.build(mood: Note.moods[:na])
  end
  
  def create
    self.student = Student.find(params[:student_id])
    self.note = student.notes.build(note_params) do |n|
      n.user = current_user
      n.resolution = :unresolved
      n.privacy_status = params[:private] ? :private_ : :public_
      n.location = params[:location]
      #params[:private] ? :private_ : :public_
    end
    
    if note.save
      redirect_to student
    else
      render :new
    end
  end
  
  def status
    note = Note.find(params[:id])
    note.resolved!
    
    redirect_to :back
  end
  
  private
  helper_attr :note, :student
  
  def note_params
    params.require(:note).permit(:category, :importance, :mood, :text)
  end
end
