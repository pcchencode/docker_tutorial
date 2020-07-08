class ChangeBillingConsumesConsumeTypeToInt < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      ALTER TABLE `billing_consumes` MODIFY COLUMN `consume_type` TINYINT(4) unsigned NOT NULL COMMENT '消費類型。0：飄屏；1：禮物。'
    SQL

  end

  def down
    execute <<-SQL
      ALTER TABLE `billing_consumes` MODIFY COLUMN `consume_type` VARCHAR(4) NOT NULL COMMENT '消費類型。floating：飄屏；gift：禮物。'
    SQL
  end
end
