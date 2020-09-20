class ModifyGameReport2 < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      ALTER TABLE `game_report_by_live_id`
        DROP COLUMN `uv_fix`,
        DROP COLUMN `ent_fans_act3`,
        ADD COLUMN `fan_group` int(11) NOT NULL DEFAULT 0 COMMENT '粉絲團增加人數' AFTER `uv`,
        ADD COLUMN `ent_fans_act3` float NOT NULL DEFAULT 0 COMMENT '三月活躍粉絲進房率';
    SQL
  end

  def down
    execute <<-SQL
      ALTER TABLE `game_report_by_live_id`
        ADD COLUMN `uv_fix` int(11) NOT NULL DEFAULT 0 COMMENT 'uv去除重複超過五個ip',
        ADD COLUMN `ent_fans_act3` int(11) NOT NULL DEFAULT 0 COMMENT '三月活躍粉絲進房人數',
        DROP COLUMN `fan_group`,
        DROP COLUMN `ent_fans_act3`;
    SQL
  end
end
