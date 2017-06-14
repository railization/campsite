class Child < ActiveRecord::Base

	has_many :children_activities
	has_many :activities, through: :children_activities
	has_many :children_checks

	def name
		"#{first_name} #{last_name}"
	end

end
