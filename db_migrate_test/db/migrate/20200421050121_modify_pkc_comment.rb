class ModifyPkcComment < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      ALTER TABLE `pkchicken_anchor_ratio`
        MODIFY COLUMN `ratio` float NOT NULL DEFAULT 0 COMMENT '比值',
        MODIFY COLUMN `total_diamond` INT(11) NOT NULL DEFAULT 0 COMMENT '七場鑽石數',
        MODIFY COLUMN `total_mins` smallint(6) NOT NULL DEFAULT 0 COMMENT '七場開播分鐘數';
    SQL
  end

  def down
    execute <<-SQL
      ALTER TABLE `pkchicken_anchor_ratio`
        MODIFY COLUMN `ratio` float NOT NULL DEFAULT 0 COMMENT '是否刪除',
        MODIFY COLUMN `total_diamond` INT(11) NOT NULL DEFAULT 0 COMMENT '達標鑽石數',
        MODIFY COLUMN `total_mins` smallint(6) NOT NULL DEFAULT 0 COMMENT '七日內開播分鐘數';
    SQL
  end
end
