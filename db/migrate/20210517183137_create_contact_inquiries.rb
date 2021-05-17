class CreateContactInquiries < ActiveRecord::Migration[6.1]
  def change
    create_table :contact_inquiries do |t|
      t.string :name
      t.string :email
      t.text :description

      t.timestamps
    end
  end
end
