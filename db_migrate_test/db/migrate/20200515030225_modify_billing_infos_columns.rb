class ModifyBillingInfosColumns < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      ALTER TABLE `billing_infos`
        MODIFY COLUMN `gold` decimal(13,2) DEFAULT 0.00 COMMENT '數量總和',
        MODIFY COLUMN `category` tinyint(4) NOT NULL COMMENT '虛擬物品流動分類。0：獲得虛擬物品；1：消耗虛擬物品；2：背包類；3：鑽石類；4：現金；5：錢包；6：im錢包；99：快照類；101：轉盤；102：瘋狂寶箱。';
    SQL
  end

  def down
    execute <<-SQL
      ALTER TABLE `billing_infos`
        MODIFY COLUMN `category` tinyint(4) NOT NULL COMMENT '虛擬物品流動分類。0：獲得虛擬物品；1：消耗虛擬物品；2：背包類；3：鑽石類；99：快照類。',
        MODIFY COLUMN `gold` int(11) unsigned NOT NULL DEFAULT 0 COMMENT '浪花數。';
    SQL
  end
end
