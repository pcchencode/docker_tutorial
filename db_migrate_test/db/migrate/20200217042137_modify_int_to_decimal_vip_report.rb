class ModifyIntToDecimalVipReport < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      ALTER TABLE `lang_vip_report_weekly`
        MODIFY COLUMN `level1_money` decimal(18,3) NOT NULL DEFAULT 0 COMMENT '單筆1萬以上充值', 
        MODIFY COLUMN `level2_money` decimal(18,3) NOT NULL DEFAULT 0 COMMENT '單筆5萬以上充值';
    SQL
  end

  def down
    execute <<-SQL
      ALTER TABLE `lang_vip_report_weekly`
        MODIFY COLUMN `level1_money` int(11) NOT NULL DEFAULT 0 COMMENT '單筆1萬以上充值', 
        MODIFY COLUMN `level2_money` int(11) NOT NULL DEFAULT 0 COMMENT '單筆5萬以上充值';
    SQL
  end
end
