class AddAttachmentImage1ToProductApplicationBuys < ActiveRecord::Migration
  def self.up
    change_table :product_application_buys do |t|
      t.attachment :image1
    end
  end

  def self.down
    remove_attachment :product_application_buys, :image1
  end
end
