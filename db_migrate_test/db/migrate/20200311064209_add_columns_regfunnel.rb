class AddColumnsRegfunnel < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      ALTER TABLE `register_funnel`
        ADD COLUMN `android` INT(11) DEFAULT NULL COMMENT '未知且為安卓用戶' ,
        ADD COLUMN `ios` INT(11) DEFAULT NULL COMMENT '未知且為ios用戶' ,
        ADD COLUMN `unknow` INT(11) DEFAULT NULL COMMENT '未知用戶' ;
    SQL
  end

  def down
    execute <<-SQL
      ALTER TABLE `register_funnel`
        DROP COLUMN `android`,
        DROP COLUMN `ios`,
        DROP COLUMN `unknow`;
    SQL
  end
end
