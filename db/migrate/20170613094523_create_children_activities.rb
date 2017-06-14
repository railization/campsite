class CreateChildrenActivities < ActiveRecord::Migration
  def up
    create_table :children_activities do |t|
      t.integer :child_id
      t.integer :activity_id

      t.timestamps null: false
    end
  end

  def down
  	drop_table :children_activities if table_exists? :children_activities
  	drop_table :activity_children if table_exists? :activity_children
  end
end
