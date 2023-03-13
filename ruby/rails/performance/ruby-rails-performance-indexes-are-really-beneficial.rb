class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    # ok: ruby-rails-performance-indexes-are-beneficial
    add_column :users, :email_id, :integer
    add_index :users, :email_id

    # ok: ruby-rails-performance-indexes-are-beneficial
    add_column :users2, :email2_id, :integer, foo: :bar
    add_index :users2, :email2_id, name: "asdf"

    # ruleid: ruby-rails-performance-indexes-are-beneficial
    add_column :users3, :email3_id, :integer, foo: bar
    add_index :users3, [:email2_id, :other_id], name: "asdf"

    # ruleid: ruby-rails-performance-indexes-are-beneficial
    add_column :users4, :email4_id, :integer, { other_stuff: :asdf }

    # ruleid: ruby-rails-performance-indexes-are-beneficial
    add_column :users4, :email4_id, :bigint, { other_stuff: :asdf }
  end
end