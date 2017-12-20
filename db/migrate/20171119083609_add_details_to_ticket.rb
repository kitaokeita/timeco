class AddDetailsToTicket < ActiveRecord::Migration[5.0]
  def change
    add_column :tickets, :timeuse, :integer
  end
end
