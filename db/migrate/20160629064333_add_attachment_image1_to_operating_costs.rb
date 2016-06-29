class AddAttachmentImage1ToOperatingCosts < ActiveRecord::Migration
  def self.up
    change_table :operating_costs do |t|
      t.attachment :image1
    end
  end

  def self.down
    remove_attachment :operating_costs, :image1
  end
end
