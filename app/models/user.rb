class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :notes
  has_and_belongs_to_many :students
  has_many :comments
  has_many :views

  def has_viewed? student
    return true if !students.include?(student)
    
    last_note = student.notes.most_recent
    return true if last_note.nil?
    
    last_view = views.find_by(student: student)
    return false if last_view.nil?
    
    last_view.created_at > last_note.created_at
  end

end
