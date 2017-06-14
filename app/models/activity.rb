class Activity < ActiveRecord::Base

	belongs_to :campsite
	has_many :children_activities
	has_many :children, through: :children_activities
	has_many :children_checks

	def checked_in_childs
		children_checks.group(:child_id).having("count(category) =?", 1).count
	end


	# scope :filter_by_keyword, -> keyword { joins(:children).where("children.name LIKE ? OR categories.name LIKE ? OR question_options.title LIKE ?", "%#{keyword}%", "%#{keyword}%", "%#{keyword}%") }



end
