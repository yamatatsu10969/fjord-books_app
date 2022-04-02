# frozen_string_literal: true

class CreateFollows < ActiveRecord::Migration[6.1]
  def change
    create_table :follows do |t|
      t.integer :follower_id
      t.integer :followee_id

      t.timestamps
      t.index %i[followee_id follower_id], unique: true
    end
  end
end
