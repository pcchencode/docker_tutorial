class AddFieldForGameAnchor < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      ALTER TABLE `anchor_unsigned_days`
        ADD COLUMN `category` INT(11) unsigned NOT NULL DEFAULT 0 COMMENT '主播類型0:秀場, 1:電玩';
    SQL
    execute <<-SQL
      ALTER TABLE `anchor_unsigned_days`
        DROP INDEX uni_pfid_t_day,
        ADD UNIQUE KEY `uni_pfid_t_day_category` (`pfid`,`t_day`,`category`)
    SQL
    
    execute <<-SQL
      ALTER TABLE `anchor_unsigned_months`
        ADD COLUMN `category` INT(11) unsigned NOT NULL DEFAULT 0 COMMENT '主播類型0:秀場, 1:電玩';
    SQL

    execute <<-SQL
      ALTER TABLE `anchor_unsigned_months`
        DROP INDEX uni_pfid_t_day,
        ADD UNIQUE KEY `uni_pfid_t_day_category` (`pfid`,`t_month`,`category`)
    SQL

    execute <<-SQL
      ALTER TABLE `daily_anchor_kpis_per_users`
        ADD COLUMN `category` INT(11) unsigned NOT NULL DEFAULT 0 COMMENT '主播類型0:秀場, 1:電玩';
    SQL

    execute <<-SQL
      ALTER TABLE `daily_anchor_kpis_per_users`
        DROP INDEX uni_pfid_cal_date,
        ADD UNIQUE KEY `uni_pfid_cal_date_category` (`pfid`,`cal_date`,`category`)
    SQL

    execute <<-SQL
      ALTER TABLE `daily_anchor_kpis`
        ADD COLUMN `category` INT(11) unsigned NOT NULL DEFAULT 0 COMMENT '主播類型0:秀場, 1:電玩';
    SQL

    execute <<-SQL
      ALTER TABLE `daily_anchor_kpis`
        DROP INDEX pfid,
        ADD UNIQUE KEY `pfid_category` (`pfid`,`month`,`category`)
    SQL
  end

  def down
    execute <<-SQL
      ALTER TABLE `anchor_unsigned_days`
        DROP COLUMN `category`;
    SQL
    execute <<-SQL
      ALTER TABLE `anchor_unsigned_days`
        DROP INDEX uni_pfid_t_day_category,
        ADD UNIQUE KEY `uni_pfid_t_day` (`pfid`,`t_day`)
    SQL
    execute <<-SQL
      ALTER TABLE `anchor_unsigned_months`
        DROP COLUMN `category`;
    SQL
    execute <<-SQL
      ALTER TABLE `anchor_unsigned_months`
        DROP INDEX uni_pfid_t_day_category,
        ADD UNIQUE KEY `uni_pfid_t_day` (`pfid`,`t_month`)
    SQL
    execute <<-SQL
      ALTER TABLE `daily_anchor_kpis_per_users`
        DROP COLUMN `category`;
    SQL
    execute <<-SQL
      ALTER TABLE `daily_anchor_kpis_per_users`
        DROP INDEX uni_pfid_cal_date_category,
        ADD UNIQUE KEY `uni_pfid_cal_date` (`pfid`,`cal_date`)
    SQL
    execute <<-SQL
      ALTER TABLE `daily_anchor_kpis`
        DROP COLUMN `category`;
    SQL
    execute <<-SQL
      ALTER TABLE `daily_anchor_kpis`
        DROP INDEX pfid_category,
        ADD UNIQUE KEY `pfid` (`pfid`,`month`)
    SQL
  end
end
