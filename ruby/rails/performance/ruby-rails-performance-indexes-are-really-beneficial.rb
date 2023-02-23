class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    # ok: index-may-be-needed
    add_column :users, :email_id, :integer
    add_index :users, :email_id

    # ruleid: index-may-be-needed
    add_column :users2, :email2_id, :integer, { other_stuff: :asdf }
    puts "foo"

    # ruleid: index-may-be-needed
    add_column :users3, :email2_id, :integer
    puts "foo"

    # ruleid: index-may-be-needed
    add_column :users4, :email3_id, :integer, { other_stuff: :asdf }
  end
end