class AddAttachmentImage1ToAdministrationCosts < ActiveRecord::Migration
  def self.up
    change_table :administration_costs do |t|
      t.attachment :image1
    end
  end

  def self.down
    remove_attachment :administration_costs, :image1
  end
end
