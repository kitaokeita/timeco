class RemoveAuthorFromTicket < ActiveRecord::Migration[5.0]
  def change
    remove_column :tickets, :nitizi, :datetime
  end
end
