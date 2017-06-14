# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#

#campsites
summer_campsite = Campsite.where(name: "SummerCamp").first_or_create(name: "SummerCamp")
autumn_campsite = Campsite.where(name: "AutumnCamp").first_or_create(name: "AutumnCamp")

#summer_activities
activity_a = Activity.where(name: "Activity A", campsite_id: summer_campsite.try(:id)).first_or_create(name: "Activity A", campsite_id: summer_campsite.try(:id))
activity_b = Activity.where(name: "Activity B", campsite_id: summer_campsite.try(:id)).first_or_create(name: "Activity B", campsite_id: summer_campsite.try(:id))
activity_c = Activity.where(name: "Activity C", campsite_id: summer_campsite.try(:id)).first_or_create(name: "Activity C", campsite_id: summer_campsite.try(:id))


#autumn__activities
activity_d = Activity.where(name: "Activity D", campsite_id: autumn_campsite.try(:id)).first_or_create(name: "Activity E", campsite_id: autumn_campsite.try(:id))
activity_e = Activity.where(name: "Activity E", campsite_id: autumn_campsite.try(:id)).first_or_create(name: "Activity E", campsite_id: autumn_campsite.try(:id))
activity_f = Activity.where(name: "Activity F", campsite_id: autumn_campsite.try(:id)).first_or_create(name: "Activity F", campsite_id: autumn_campsite.try(:id))

#childrens
#male
child_john = Child.where(first_name: "John", last_name: "Doe", gender: "male").first_or_create(first_name: "John", last_name: "Doe", gender: "male", date_of_birth: "09-12-2000")
child_jackson = Child.where(first_name: "Jackson", last_name: "Lucas", gender: "male").first_or_create(first_name: "Jackson", last_name: "Lucas", gender: "male", date_of_birth: "09-12-2001")
child_mason = Child.where(first_name: "Mason", last_name: "Oliver", gender: "male").first_or_create(first_name: "Mason", last_name: "Oliver", gender: "male", date_of_birth: "09-12-2002")

#male
child_sophia = Child.where(first_name: "Sophia", last_name: "Aiden", gender: "female").first_or_create(first_name: "Sophia", last_name: "Aiden", gender: "female", date_of_birth: "09-12-2003")
child_isabella = Child.where(first_name: "Isabella", last_name: "Lily", gender: "female").first_or_create(first_name: "Isabella", last_name: "Lily", gender: "female", date_of_birth: "09-12-1999")

#children_activities
# activity_a
activity_a.children_activities << ChildrenActivity.new(:child_id => child_john.id) if activity_a.children_activities.find_by_child_id(child_john.id).blank?
activity_a.children_activities << ChildrenActivity.new(:child_id => child_mason.id) if activity_a.children_activities.find_by_child_id(child_mason.id).blank?
activity_a.children_activities << ChildrenActivity.new(:child_id => child_isabella.id) if activity_a.children_activities.find_by_child_id(child_isabella.id).blank?

# activity_b
activity_b.children_activities << ChildrenActivity.new(:child_id => child_john.id) if activity_b.children_activities.find_by_child_id(child_john.id).blank?
activity_b.children_activities << ChildrenActivity.new(:child_id => child_jackson.id) if activity_b.children_activities.find_by_child_id(child_jackson.id).blank?
activity_b.children_activities << ChildrenActivity.new(:child_id => child_mason.id) if activity_b.children_activities.find_by_child_id(child_mason.id).blank?
activity_b.children_activities << ChildrenActivity.new(:child_id => child_sophia.id) if activity_b.children_activities.find_by_child_id(child_sophia.id).blank?
activity_b.children_activities << ChildrenActivity.new(:child_id => child_isabella.id) if activity_b.children_activities.find_by_child_id(child_isabella.id).blank?

# activity_d
activity_d.children_activities << ChildrenActivity.new(:child_id => child_jackson.id) if activity_d.children_activities.find_by_child_id(child_jackson.id).blank?
activity_d.children_activities << ChildrenActivity.new(:child_id => child_mason.id) if activity_d.children_activities.find_by_child_id(child_mason.id).blank?
activity_d.children_activities << ChildrenActivity.new(:child_id => child_sophia.id) if activity_d.children_activities.find_by_child_id(child_sophia.id).blank?