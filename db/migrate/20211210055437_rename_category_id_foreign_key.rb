# frozen_string_literal: true

class RenameCategoryIdForeignKey < ActiveRecord::Migration[6.1]
  def change
    change_table :posts do |t|
      t.rename :post_category_id, :category_id
    end
  end
end
