class StudentsController < ApplicationController
  def new
    self.student = Student.new
  end
  
  def create
    Student.create!(student_params) do |s|
      s.image = upload(params[:student][:image]) if params[:student][:image]
    end
    
    redirect_to students_path
  end
  
  def show
    self.student = Student.find(params[:id])
    self.public_notes = student.public_notes.with_text
    self.private_notes = student.private_notes(user: current_user).with_text
    current_view = student.views.create!(user: current_user)
  end
  
  def add
    student = Student.find(params[:id])
    current_user.students << student
    
    redirect_to connections_path
  end
  
  def remove
    student = Student.find(params[:id])
    current_user.students.destroy(student)
    
    redirect_to connections_path
  end
  
  private
  helper_attr :students, :student, :public_notes, :private_notes
  
  def student_params
    params.require(:student).permit(:given_name, :surname, :age, :joined_at)
  end
  
  def upload uploaded_io
    filename = Rails.root.join('app', 'assets', 'images', 'uploads', uploaded_io.original_filename)
    File.open(filename, 'wb') do |file|
      file.write(uploaded_io.read)
    end
    
    "uploads/#{uploaded_io.original_filename}"
  end
end
