class RemoveUnusedColumns < ActiveRecord::Migration
  def change
    remove_column :investments, :identification_document
    remove_column :investments, :address_line_1
    remove_column :investments, :address_line_2
    remove_column :investments, :city
    remove_column :investments, :zip_code
    remove_column :investments, :phone_area_code
    remove_column :investments, :phone_prefix
    remove_column :investments, :phone_last_four
    remove_column :investments, :identification
    remove_column :investments, :individual_income
    remove_column :investments, :joint_income
    remove_column :investments, :business_representative
    remove_column :investments, :securities_firm
    remove_column :investments, :company_director
    remove_column :investments, :company_officer
    remove_column :investments, :net_worth
  end
end

