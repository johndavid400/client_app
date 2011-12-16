class AddProjectDescriptionToClientApplications < ActiveRecord::Migration
  def change
    add_column :client_applications, :project_description, :text
  end
end
