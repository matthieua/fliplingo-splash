class CreateIntervieweesTable < ActiveRecord::Migration
  def change
    create_table :interviewees do |t|
      t.string   :email, :null => false
      t.string   :twitter_handle

      t.timestamps
    end
  end
end
