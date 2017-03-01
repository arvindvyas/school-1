class AddUserDetailsToUser < ActiveRecord::Migration
  def change
    add_column :users, :students_details, :text
    add_column :users, :date_of_birth, :datetime
    add_column :users, :gender, :string
    add_column :users, :mobile_no, :string
    add_column :users, :address, :string
    add_column :users, :enrolment_of_class, :string
    add_column :users, :father_or_mother, :string
    add_column :users, :occupation, :string
    add_column :users, :qualification, :string
  end
end
