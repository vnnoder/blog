class AddLikeToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :like, :integer, default: 0

  end
end
