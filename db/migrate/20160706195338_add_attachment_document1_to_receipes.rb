class AddAttachmentDocument1ToReceipes < ActiveRecord::Migration
  def self.up
    change_table :receipes do |t|
      t.attachment :document1
    end
  end

  def self.down
    remove_attachment :receipes, :document1
  end
end
