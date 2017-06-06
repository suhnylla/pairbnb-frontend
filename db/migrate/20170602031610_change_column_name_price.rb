class ChangeColumnNamePrice < ActiveRecord::Migration
  def change
	rename_column :reservations, :no_days_stay, :amount
  end
end
