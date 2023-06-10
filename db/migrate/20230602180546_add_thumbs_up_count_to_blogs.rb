class AddThumbsUpCountToBlogs < ActiveRecord::Migration[7.0]
  def change
    add_column :blogs, :thumbs_up_count, :integer, default:0
  end
end
