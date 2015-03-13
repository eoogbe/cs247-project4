class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :notes
  has_and_belongs_to_many :students
  has_many :comments
  has_many :views

  def has_viewed?(student)
    return true if !students.include?(student)
    
    last_note = student.public_notes.most_recent
    return true if last_note.nil?
    puts "\nLAST NOTE : "
    puts last_note.created_at
    
    last_view = views.order("created_at DESC").find_by(student_id: student.id) #views.find_by(student: student)
    return false if last_view.nil?
    puts "\nLAST VIEW : "
    puts last_view.created_at

    puts last_view.created_at > last_note.created_at
    last_view.created_at > last_note.created_at
  end

end
