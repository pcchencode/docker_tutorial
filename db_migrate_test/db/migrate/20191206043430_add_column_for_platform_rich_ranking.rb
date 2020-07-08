class AddColumnForPlatformRichRanking < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      ALTER TABLE `platform_rich_rankings`
        ADD COLUMN `normal_expend` INT(11) NOT NULL DEFAULT 0 COMMENT '一般送禮' AFTER `expend`;
    SQL

    execute <<-SQL
      ALTER TABLE `platform_rich_rankings`
        ADD COLUMN `lucky_expend` INT(11) NOT NULL DEFAULT 0 COMMENT '爆擊送禮' AFTER `normal_expend`;
    SQL
  end

  def down
    execute <<-SQL
      ALTER TABLE `platform_rich_rankings`
        DROP COLUMN `lucky_expend`;
    SQL

    execute <<-SQL
      ALTER TABLE `platform_rich_rankings`
        DROP COLUMN `normal_expend`;
    SQL
  end
end
