class ConnectionsController < ApplicationController
  def index
    self.students = current_user.students
  end
  
  def new
    self.students = Student.except_for_user(current_user)
  end
  
  def delete
    self.students = current_user.students
  end
  
  private
  helper_attr :students
end
