class PopulateGroup < ActiveRecord::Migration
  def up
    Group.create name: "manager",    title: "Manager"
    Group.create name: "admin",      title: "Administrator"
    Group.create name: "user",       title: "User"
    Group.create name: "guest",      title: "Guest"
  end

  def down
    groups = Group.all
    groups.each do |group|
      group.destroy
    end
  end
end
