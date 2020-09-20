class ChangeDailyAnchorSocialMembersTableName < ActiveRecord::Migration[5.2]
  def change
    rename_table :daily_anchor_social_members, :square_anchors
  end
end
