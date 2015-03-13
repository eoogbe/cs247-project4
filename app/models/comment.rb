class Comment < ActiveRecord::Base
		belongs_to :note
		belongs_to :user
		belongs_to :student
		
		validates :note_id, presence: true
		validates :user_id, presence: true
		validates :text, presence: true

		def author_name
		    user.name
		 end
end


