# frozen_string_literal: true

class RenameColumnsAccordingToHexletNaming < ActiveRecord::Migration[6.1]
  def change
    change_table :posts do |t|
      t.rename :category_id, :post_category_id
      t.rename :user_id, :creator_id
    end
  end
end
