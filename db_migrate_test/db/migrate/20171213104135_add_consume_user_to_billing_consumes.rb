class AddConsumeUserToBillingConsumes < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      ALTER TABLE `billing_consumes`
        ADD COLUMN `consume_user` MEDIUMINT(9) UNSIGNED NOT NULL DEFAULT 0 COMMENT '消費浪花人數' AFTER `consume_type`;
    SQL
  end

  def down
    execute <<-SQL
      ALTER TABLE `billing_consumes`
        DROP COLUMN `consume_user`;
    SQL
  end
end
