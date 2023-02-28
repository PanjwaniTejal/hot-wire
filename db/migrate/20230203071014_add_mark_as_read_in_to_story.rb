class AddMarkAsReadInToStory < ActiveRecord::Migration[6.0]
  def change
    add_column :stories, :mark_as_read, :boolean, default: false
  end
end