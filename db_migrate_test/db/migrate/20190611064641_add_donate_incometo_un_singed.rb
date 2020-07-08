class AddDonateIncometoUnSinged < ActiveRecord::Migration[5.2]
  def up
  	execute <<-SQL
      ALTER TABLE `anchor_unsigned_days`
        ADD COLUMN `donate_income` DECIMAL(12,3) NOT NULL DEFAULT 0 COMMENT '動態打賞日' AFTER `income_groups`;
    SQL

    execute <<-SQL
      ALTER TABLE `anchor_unsigned_months`
        ADD COLUMN `donate_income` DECIMAL(12,3) NOT NULL DEFAULT 0 COMMENT '動態打賞月' AFTER `income_groups`;
    SQL
  end

  def down
  	execute <<-SQL
      ALTER TABLE `anchor_unsigned_days`
        DROP COLUMN `donate_income`;
    SQL

    execute <<-SQL
      ALTER TABLE `anchor_unsigned_months`
        DROP COLUMN `donate_income`;
    SQL
  end
end
