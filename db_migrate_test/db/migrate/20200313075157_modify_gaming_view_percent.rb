class ModifyGamingViewPercent < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      ALTER TABLE `gaming_view_percent`
      CHANGE `kk_ratio` `kk_user` tinyint(3) DEFAULT NULL COMMENT '是否為電競用戶';
    SQL
  end

  def down
    execute <<-SQL
      ALTER TABLE `gaming_view_percent`
      CHANGE `kk_user` `kk_ratio` decimal(5,2) DEFAULT NULL COMMENT '(G,K)觀看比例';
    SQL
  end
end
