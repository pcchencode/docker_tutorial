class DeleteColumnforuserVipInfos < ActiveRecord::Migration[5.2]
  def up
    remove_column :user_vip_donate_infos, :anchor_nickname
  end
  def down
    execute <<-SQL
      ALTER TABLE user_vip_donate_infos ADD anchor_nickname VARCHAR(190) CHARACTER SET UTF8MB4 DEFAULT NULL COMMENT '主播暱稱' AFTER anchor_pfid
    SQL
  end
end
