class AddColumnToTicket < ActiveRecord::Migration[5.0]
  def change
    add_column :tickets, :sort, :string
  end
end
