class ModifyUniKeyMonthlyAnchorDiamondRevenue < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      ALTER TABLE `monthly_anchor_diamond_revenue`
      DROP INDEX `uni_pfid`,
      ADD UNIQUE KEY `uni_pfid_calym`(`pfid`,`cal_year_month`);     
    SQL
  end

  def down
    execute <<-SQL
      ALTER TABLE `monthly_anchor_diamond_revenue`
      DROP INDEX `uni_pfid_calym`,
      ADD UNIQUE KEY `uni_pfid`(`pfid`);
    SQL
  end
end