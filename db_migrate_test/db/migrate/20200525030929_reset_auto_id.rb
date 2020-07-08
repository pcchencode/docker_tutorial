class ResetAutoId < ActiveRecord::Migration[5.2]
  def change
  	execute <<-SQL
  		ALTER TABLE tb_user_revenue_day AUTO_INCREMENT = 1;
  	SQL
  end
end
