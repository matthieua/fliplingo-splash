class CreateInvitesTable < ActiveRecord::Migration
  def up
    create_table :invites do |t|
      t.string   :email, :null => false

      t.timestamps
    end
  end
end
