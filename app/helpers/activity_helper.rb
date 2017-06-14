module ActivityHelper

	def child_color(child, activity_id)
		checks = child.children_checks
		if checks.check_out.where(activity_id: activity_id).present?
			return "green"
		elsif 	checks.check_in.where(activity_id: activity_id).present?
			return "blue"
		else
			return "red"
		end	
	end

end