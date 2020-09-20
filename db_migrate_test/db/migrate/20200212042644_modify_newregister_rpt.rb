class ModifyNewregisterRpt < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      ALTER TABLE `newregister_retention_order_bypartner`
        MODIFY COLUMN `partner` varchar(30) DEFAULT NULL COMMENT '媒體渠道';
    SQL

    execute <<-SQL
      ALTER TABLE `newregister_retention_order_bycity`
        MODIFY COLUMN `country_code` char(2) DEFAULT NULL COMMENT '國家',
        MODIFY COLUMN `city` varchar(30) DEFAULT NULL COMMENT '城市';
    SQL
  end

  def down
    execute <<-SQL
      ALTER TABLE `newregister_retention_order_bypartner`
        MODIFY COLUMN `partner` varchar(11) DEFAULT NULL COMMENT '媒體渠道';
    SQL

    execute <<-SQL
      ALTER TABLE `newregister_retention_order_bycity`
        MODIFY COLUMN `country_code` varchar(11) DEFAULT NULL COMMENT '國家',
        MODIFY COLUMN `city` varchar(11) DEFAULT NULL COMMENT '城市';
    SQL
  end
end
