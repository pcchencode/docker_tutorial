class FixUserAliveNDaysRetention < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      ALTER TABLE `user_alive_n_days` CHANGE `retaintion` `retention` MEDIUMINT(9) unsigned NOT NULL COMMENT '留存人數。'
    SQL
  end

  def down
    execute <<-SQL
      ALTER TABLE `user_alive_n_days` CHANGE `retention` `retaintion` MEDIUMINT(9) unsigned NOT NULL COMMENT '留存人數。'
    SQL
  end
end
