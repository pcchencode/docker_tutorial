class RemoveUniqueOnIdxPaltformStatisticsKeys < ActiveRecord::Migration[5.2]
  def up
    remove_index :platform_statistics_keys, name: 'idx_platform_statistics_keys'
    add_index :platform_statistics_keys, :key_id, name: 'idx_platform_statistics_keys'
  end

  def down
    remove_index :platform_statistics_keys, name: 'idx_platform_statistics_keys'
    add_index :platform_statistics_keys, :key_id, name: 'idx_platform_statistics_keys', unique: true
  end
end
