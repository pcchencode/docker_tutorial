class AddActivityBonusDiamond < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      ALTER TABLE anchor_unsigned_days
        ADD COLUMN activity_bonus_diamond INT(11) DEFAULT 0 NOT NULL COMMENT '活動贈送鑽石';
    SQL

    execute <<-SQL
      ALTER TABLE anchor_unsigned_months
        ADD COLUMN activity_bonus_diamond INT(11) DEFAULT 0 NOT NULL COMMENT '活動贈送鑽石';
    SQL
  end

  def down
    execute <<-SQL
      ALTER TABLE anchor_unsigned_days
        DROP COLUMN activity_bonus_diamond;
    SQL

    execute <<-SQL
      ALTER TABLE anchor_unsigned_months
        DROP COLUMN activity_bonus_diamond;
    SQL
  end
end
