class Student < ActiveRecord::Base
  has_many :notes
  has_and_belongs_to_many :users
  has_many :comments

  
  def self.except_for_user user
    where.not(id: user.student_ids)
  end
  
  def full_name
    "#{given_name} #{surname}"
  end
  
  def public_notes
    unresolved_notes(:public_)
  end
  
  def private_notes conditions = {}
    unresolved_notes(:private_, conditions)
  end
  
  private
  
  def unresolved_notes privacy_status, conditions = {}
    notes.where(conditions)
      .where(resolution: Note.resolutions[:unresolved],
        privacy_status: Note.privacy_statuses[privacy_status])
  end
end
