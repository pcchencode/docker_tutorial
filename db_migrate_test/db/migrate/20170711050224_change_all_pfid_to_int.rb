class ChangeAllPfidToInt < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      ALTER TABLE `billing_consume_ranks`
        MODIFY `pfid` int(11) unsigned NOT NULL COMMENT '用戶浪代號。';
    SQL
    execute <<-SQL
      ALTER TABLE `billing_order_ranks`
        MODIFY `pfid` int(11) unsigned NOT NULL COMMENT '用戶浪代號。';
    SQL
    execute <<-SQL
      ALTER TABLE `daily_anchor_kpis`
        MODIFY `pfid` int(11) unsigned NOT NULL COMMENT '用戶浪代號。';
    SQL
    execute <<-SQL
      ALTER TABLE `daily_anchor_kpis_logs`
        MODIFY `pfid` int(11) unsigned NOT NULL COMMENT '用戶浪代號。';
    SQL
    execute <<-SQL
      ALTER TABLE `daily_anchor_kpis_per_users`
        MODIFY `pfid` int(11) unsigned NOT NULL COMMENT '用戶浪代號。';
    SQL
    execute <<-SQL
      ALTER TABLE `daily_big_r_infos`
        MODIFY `pfid` int(11) unsigned NOT NULL COMMENT '用戶浪代號。';
    SQL
    execute <<-SQL
      ALTER TABLE `friend_anchor_fans`
        MODIFY `pfid` int(11) unsigned NOT NULL COMMENT '用戶浪代號。';
    SQL
    execute <<-SQL
      ALTER TABLE `friend_anchor_fans_ranks`
        MODIFY `pfid` int(11) unsigned NOT NULL COMMENT '用戶浪代號。';
    SQL
    execute <<-SQL
      ALTER TABLE `godview_daily_anchors`
        MODIFY `pfid` int(11) unsigned NOT NULL COMMENT '用戶浪代號。';
    SQL
    execute <<-SQL
      ALTER TABLE `godview_monthly_anchors`
        MODIFY `pfid` int(11) unsigned NOT NULL COMMENT '用戶浪代號。';
    SQL
    execute <<-SQL
      ALTER TABLE `live_rooms`
        MODIFY `pfid` int(11) unsigned NOT NULL COMMENT '用戶浪代號。';
    SQL
    execute <<-SQL
      ALTER TABLE `platform_anchor_rankings`
        MODIFY `pfid` int(11) unsigned NOT NULL COMMENT '用戶浪代號。';
    SQL
    execute <<-SQL
      ALTER TABLE `platform_rich_rankings`
        MODIFY `pfid` int(11) unsigned NOT NULL COMMENT '用戶浪代號。';
    SQL
    execute <<-SQL
      ALTER TABLE `recommendation_newsfeeds`
        MODIFY `pfid` int(11) unsigned NOT NULL COMMENT '用戶浪代號。',
        MODIFY `recom_pfid` int(11) unsigned NOT NULL COMMENT '推薦主播浪代號。';
    SQL
    execute <<-SQL
      ALTER TABLE `square_anchors`
        MODIFY `pfid` int(11) unsigned NOT NULL COMMENT '用戶浪代號。';
    SQL
  end

  def down
    execute <<-SQL
      ALTER TABLE `square_anchors`
        MODIFY `pfid` VARCHAR(8) NOT NULL COMMENT '用戶浪代號。';
    SQL
    execute <<-SQL
      ALTER TABLE `recommendation_newsfeeds`
        MODIFY `pfid` VARCHAR(8) NOT NULL COMMENT '用戶浪代號。',
        MODIFY `recom_pfid` VARCHAR(8) NOT NULL COMMENT '推薦主播浪代號。';
    SQL
    execute <<-SQL
      ALTER TABLE `platform_rich_rankings`
        MODIFY `pfid` VARCHAR(8) NOT NULL COMMENT '用戶浪代號。';
    SQL
    execute <<-SQL
      ALTER TABLE `platform_anchor_rankings`
        MODIFY `pfid` VARCHAR(8) NOT NULL COMMENT '用戶浪代號。';
    SQL
    execute <<-SQL
      ALTER TABLE `live_rooms`
        MODIFY `pfid` VARCHAR(8) NOT NULL COMMENT '用戶浪代號。';
    SQL
    execute <<-SQL
      ALTER TABLE `godview_monthly_anchors`
        MODIFY `pfid` VARCHAR(8) NOT NULL COMMENT '用戶浪代號。';
    SQL
    execute <<-SQL
      ALTER TABLE `godview_daily_anchors`
        MODIFY `pfid` VARCHAR(8) NOT NULL COMMENT '用戶浪代號。';
    SQL
    execute <<-SQL
      ALTER TABLE `friend_anchor_fans_ranks`
        MODIFY `pfid` VARCHAR(8) NOT NULL COMMENT '用戶浪代號。';
    SQL
    execute <<-SQL
      ALTER TABLE `friend_anchor_fans`
        MODIFY `pfid` VARCHAR(8) NOT NULL COMMENT '用戶浪代號。';
    SQL
    execute <<-SQL
      ALTER TABLE `daily_big_r_infos`
        MODIFY `pfid` VARCHAR(8) NOT NULL COMMENT '用戶浪代號。';
    SQL
    execute <<-SQL
      ALTER TABLE `daily_anchor_kpis_per_users`
        MODIFY `pfid` VARCHAR(8) NOT NULL COMMENT '用戶浪代號。';
    SQL
    execute <<-SQL
      ALTER TABLE `daily_anchor_kpis_logs`
        MODIFY `pfid` VARCHAR(8) NOT NULL COMMENT '用戶浪代號。';
    SQL
    execute <<-SQL
      ALTER TABLE `daily_anchor_kpis`
        MODIFY `pfid` VARCHAR(8) NOT NULL COMMENT '用戶浪代號。';
    SQL
    execute <<-SQL
      ALTER TABLE `billing_order_ranks`
        MODIFY `pfid` VARCHAR(8) NOT NULL COMMENT '用戶浪代號。';
    SQL
    execute <<-SQL
      ALTER TABLE `billing_consume_ranks`
        MODIFY `pfid` VARCHAR(8) NOT NULL COMMENT '用戶浪代號。';
    SQL
  end
end
