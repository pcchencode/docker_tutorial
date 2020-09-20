# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_07_01_042024) do

  create_table "agg_order_pay_infos", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", comment: "[浪-聚合] 金流：用戶付費總覽。包含首次付費、最後付費及付費總金額。作者：Allen<allen.chang@langlive.com>。", force: :cascade do |t|
    t.integer "pfid", null: false, comment: "用戶浪ID。", unsigned: true
    t.datetime "first_pay_time", null: false, comment: "用戶首次付費時間。時區：UTC±08。"
    t.string "channel_name", limit: 45, null: false, comment: "充值渠道名稱。"
    t.string "currency", limit: 3, null: false, comment: "國際貨幣別。參照 ISO 4217。"
    t.decimal "cash", precision: 11, scale: 2, null: false, comment: "用戶首次充值金額。"
    t.integer "gold", null: false, comment: "用戶充值所獲得的浪花。", unsigned: true
    t.datetime "last_pay_time", null: false, comment: "用戶最後付費時間。時區：UTC±08。"
    t.string "last_pay_channel_name", limit: 45, comment: "最後退款渠道名稱。"
    t.string "last_pay_currency", limit: 3, comment: "最後退款渠道名稱。"
    t.decimal "last_pay_cash", precision: 11, scale: 2, default: "0.0", comment: "用戶最近一次充值金額(原幣別)。"
    t.decimal "total_cash", precision: 11, scale: 2, null: false, comment: "用戶付費總金額(新臺幣)。", unsigned: true
    t.decimal "total_refund", precision: 11, scale: 2, default: "0.0", null: false, comment: "總退款"
    t.integer "subscriptions_status", limit: 1, default: 0, null: false, comment: "目前訂閱狀態 0:無訂閱 1:訂閱中"
    t.datetime "last_subscription_time", comment: "最後訂閱時間"
    t.datetime "db_create_time", default: -> { "current_timestamp()" }, null: false, comment: "資料建立時間。時區：UTC±00。"
    t.datetime "db_update_time", default: -> { "current_timestamp()" }, null: false, comment: "資料更新時間。時區：UTC±00。"
    t.index ["pfid"], name: "uni_pfid", unique: true
  end

  create_table "anchor_continue_view", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", comment: "連續觀看率", force: :cascade do |t|
    t.date "live_date", null: false, comment: "開播日期"
    t.integer "pfid", comment: "主播編號"
    t.integer "last_ent", default: -1, comment: "上次開播日也有進房人數"
    t.integer "today_ent", comment: "當日開播去重總進房人數"
    t.datetime "db_insert_time", default: -> { "current_timestamp()" }, null: false
    t.datetime "db_update_time", default: -> { "current_timestamp()" }, null: false
    t.index ["live_date"], name: "idx_live_date"
    t.index ["pfid", "live_date"], name: "idx_pfid_live_date", unique: true
  end

  create_table "anchor_kpi", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", comment: "[浪-月報] 主播 KPI: 1.用戶連續觀看; 2.主播真實粉絲觀看。作者：Allen<allen.chang@langlive.com>。", force: :cascade do |t|
    t.date "date", null: false, comment: "日期。時區：UTC±08。"
    t.integer "pfid", null: false, comment: "用戶浪ID。", unsigned: true
    t.integer "user_last_viewing", limit: 3, null: false, comment: "用戶上次觀看直播間人數。", unsigned: true
    t.integer "user_sequential_viewing", limit: 3, null: false, comment: "用戶連續觀看直播間人數。", unsigned: true
    t.integer "real_fans", limit: 3, null: false, comment: "主播於是日開播前，真實粉絲(追蹤主播狀態、近一個月有登入浪Live、近一個月進主播直播間)人數。", unsigned: true
    t.integer "real_fans_view", limit: 3, null: false, comment: "主播於是日開播時，真實粉絲的觀看人數。", unsigned: true
    t.datetime "db_create_time", default: -> { "current_timestamp()" }, null: false, comment: "資料建立時間。時區：UTC±00。"
    t.datetime "db_update_time", default: -> { "current_timestamp()" }, null: false, comment: "資料更新時間。時區：UTC±00。"
    t.index ["date", "pfid"], name: "uni_date_pfid", unique: true
    t.index ["db_update_time"], name: "idx_dbUpdateTime"
  end

  create_table "anchor_performance", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", comment: "主播開播表", force: :cascade do |t|
    t.integer "pfid", null: false, comment: "主播編號"
    t.string "live_id", limit: 20
    t.date "live_date", null: false, comment: "開播日期"
    t.integer "live_min", null: false, comment: "總開播時長(分鐘)"
    t.integer "ent_time", comment: "進房人次"
    t.integer "ent_number", comment: "進房人數"
    t.integer "view_num1", comment: "有效觀看人數1m"
    t.integer "view_num3", comment: "有效觀看人數3m"
    t.integer "view_num10", comment: "有效觀看人數10m"
    t.integer "view_time1", default: 0, null: false, comment: "1m 平均觀看時長"
    t.integer "view_time3", default: 0, null: false, comment: "3m 平均觀看時長"
    t.integer "view_time10", default: 0, null: false, comment: "10m 平均觀看時長"
    t.integer "new_follow", comment: "開播新增追蹤數"
    t.integer "newreg_follow", comment: "新註冊開播追蹤數"
    t.integer "cum_follow", comment: "累積追蹤用戶數"
    t.integer "newreg_view", comment: "新用戶觀看數"
    t.integer "fans_ent", comment: "粉絲進房人數"
    t.integer "fans_act3", comment: "三月活躍粉絲"
    t.integer "ent_fans_act3", comment: "三月活躍粉絲進房人數"
    t.integer "fans_act6", comment: "六月活躍粉絲"
    t.integer "ent_fans_act6", comment: "六月活躍粉絲進房人數"
    t.float "gold", comment: "觀眾送出浪花"
    t.integer "diamond", comment: "主播收到鑽石"
    t.integer "consume_number", comment: "觀眾送禮人數"
    t.integer "gold_fans", comment: "粉絲送出浪花"
    t.float "diamond_fans", comment: "主播收到粉絲鑽石"
    t.float "consume_number_fans", comment: "粉絲送禮人數"
    t.integer "pcu", comment: "pcu"
    t.timestamp "db_insert_time", default: -> { "current_timestamp()" }, null: false
    t.timestamp "db_update_time", default: -> { "current_timestamp()" }, null: false
    t.index ["db_update_time"], name: "idx_db_update_time"
    t.index ["live_date"], name: "idx_live_date"
    t.index ["live_id"], name: "uni_key", unique: true
    t.index ["pfid"], name: "idx_pfid"
  end

  create_table "anchor_pgc_performances", id: :integer, comment: "自增主鍵ID。", unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", comment: "[日報] 主播：PGC(Professionally-generated Content)直播表現表。", force: :cascade do |t|
    t.datetime "date", null: false, comment: "日期。時區：UTC+08。"
    t.integer "pfid", null: false, comment: "用戶浪Live號。"
    t.integer "max_heat", null: false, comment: "最大火熱值。", unsigned: true
    t.integer "diamond", null: false, comment: "鑽石收益。", unsigned: true
    t.integer "pcu", limit: 2, null: false, comment: "最高同時在線用戶人數(Peak Concurrent Users)。", unsigned: true
    t.integer "unique_user", limit: 3, null: false, comment: "用戶觀看人數。", unsigned: true
    t.integer "new_user", limit: 2, null: false, comment: "當日新用戶觀看人數。", unsigned: true
    t.integer "sequencial_viewing", limit: 3, null: false, comment: "用戶連續觀看人數。", unsigned: true
    t.integer "fans_before_live", limit: 3, null: false, comment: "開播前，主播粉絲數。", unsigned: true
    t.integer "fans_viewing", limit: 3, null: false, comment: "粉絲觀看數。", unsigned: true
    t.integer "new_follower", limit: 2, null: false, comment: "當日新增追蹤用戶。", unsigned: true
    t.integer "new_follower_in_live", limit: 2, null: false, comment: "當日直播時新增追蹤用戶。", unsigned: true
    t.integer "user_viewing_times", limit: 3, null: false, comment: "當日用戶進直播間觀看次數。", unsigned: true
    t.datetime "create_time", default: -> { "current_timestamp()" }, null: false, comment: "資料建立時間。時區：UTC±00。"
    t.datetime "update_time", default: -> { "current_timestamp()" }, null: false, comment: "資料更新時間。時區：UTC±00。"
    t.index ["date", "pfid"], name: "uni_date_pfid", unique: true
  end

  create_table "anchor_stages", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", comment: "主播薪資階段記錄表", force: :cascade do |t|
    t.integer "pfid", null: false, comment: "主播編號", unsigned: true
    t.date "month", null: false, comment: "階段月份"
    t.integer "kpi_stage", limit: 1, default: 1, comment: "階段", unsigned: true
    t.timestamp "created_at", default: -> { "current_timestamp()" }, null: false, comment: "系統建立時間"
    t.timestamp "updated_at", default: -> { "current_timestamp()" }, null: false, comment: "系統更新時間"
    t.index ["month", "pfid"], name: "uni_month_pfid", unique: true
    t.index ["pfid"], name: "idx_pfid"
  end

  create_table "anchor_unsigned_days", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", comment: "每日非簽約主播紀錄表", force: :cascade do |t|
    t.integer "pfid", null: false, comment: "用戶浪代號。", unsigned: true
    t.date "t_day", null: false, comment: "計算日期"
    t.decimal "valid_duration", precision: 8, scale: 2, default: "0.0", comment: "當日有效開播，單位秒"
    t.integer "income", default: 0, comment: "當日鑽石收入", unsigned: true
    t.decimal "c_income", precision: 11, scale: 2, default: "0.0", comment: "當日鑽石收入(台幣)", unsigned: true
    t.integer "g_fan", limit: 3, default: 0, null: false, comment: "新增粉絲團人數", unsigned: true
    t.timestamp "created_at", default: -> { "current_timestamp()" }, comment: "系統建立時間"
    t.timestamp "updated_at", default: -> { "current_timestamp()" }, comment: "系統更新時間"
    t.integer "activity_bonus_diamond", default: 0, null: false, comment: "活動贈送鑽石"
    t.integer "category", default: 0, null: false, comment: "主播類型0:秀場, 1:電玩", unsigned: true
    t.integer "pcu", comment: "當日最大峰值人數", unsigned: true
    t.bigint "income_n", default: 0, comment: "贵族收益", unsigned: true
    t.integer "income_groups", default: 0, null: false, comment: "粉絲團收入", unsigned: true
    t.decimal "donate_income", precision: 12, scale: 3, default: "0.0", null: false, comment: "動態打賞日"
    t.integer "voice_diamond", default: 0, null: false, comment: "音頻收入"
    t.decimal "voice_hours", precision: 10, scale: 2, default: "0.0", null: false, comment: "音頻開播時長(秒)"
    t.integer "audio_extra_bonus", default: 0, null: false, comment: "音頻流水獎勵"
    t.index ["pfid", "t_day", "category"], name: "uni_pfid_t_day_category", unique: true
    t.index ["updated_at"], name: "idx_updated_at"
  end

  create_table "anchor_unsigned_months", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", comment: "每月非簽約主播紀錄表", force: :cascade do |t|
    t.integer "pfid", null: false, comment: "用戶浪代號。", unsigned: true
    t.date "t_day", null: false, comment: "當月最後計算日期"
    t.integer "t_month", null: false, comment: "計算月份"
    t.decimal "valid_duration", precision: 12, scale: 2, default: "0.0", null: false, comment: "累積當月有效開播，單位秒"
    t.integer "income", default: 0, null: false, comment: "當月累積鑽石收入", unsigned: true
    t.decimal "c_income", precision: 12, scale: 2, default: "0.0", null: false, comment: "當月累積鑽石收入（台幣）", unsigned: true
    t.integer "g_fan", limit: 3, default: 0, null: false, comment: "當月新增粉絲團人數", unsigned: true
    t.integer "rank", default: 0, null: false, comment: "排名, 30名以外則為0", unsigned: true
    t.integer "gold", default: 0, null: false, comment: "本月（提現）", unsigned: true
    t.timestamp "created_at", default: -> { "current_timestamp()" }, comment: "系統建立時間"
    t.timestamp "updated_at", default: -> { "current_timestamp()" }, comment: "系統更新時間"
    t.integer "activity_bonus_diamond", default: 0, null: false, comment: "活動贈送鑽石"
    t.integer "category", default: 0, null: false, comment: "主播類型0:秀場, 1:電玩", unsigned: true
    t.integer "pcu_m", comment: "當月最大峰值人數", unsigned: true
    t.bigint "income_n", default: 0, comment: "贵族收益", unsigned: true
    t.integer "income_groups", default: 0, null: false, comment: "粉絲團收入", unsigned: true
    t.decimal "donate_income", precision: 12, scale: 3, default: "0.0", null: false, comment: "動態打賞月"
    t.integer "voice_diamond", default: 0, null: false, comment: "音頻收入"
    t.decimal "voice_hours", precision: 10, scale: 2, default: "0.0", null: false, comment: "音頻開播時長(小時)"
    t.integer "audio_extra_bonus", default: 0, null: false, comment: "音頻流水獎勵"
    t.bigint "diamond_balance", default: 0, null: false, comment: "月錢包剩餘數"
    t.index ["pfid", "t_month", "category"], name: "uni_pfid_t_day_category", unique: true
    t.index ["updated_at"], name: "idx_updated_at"
  end

  create_table "billing_answer_cashier", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", comment: "巨浪淘金智付通提現記錄_by人日group", force: :cascade do |t|
    t.date "fund_day", comment: "预计打款日"
    t.integer "pfid", null: false, comment: "数字ID", unsigned: true
    t.decimal "cash", precision: 10, scale: 2, comment: "提現金額"
    t.decimal "cash_real", precision: 10, scale: 2, comment: "真实到账"
    t.datetime "db_insert_time", default: -> { "current_timestamp()" }, null: false
    t.datetime "db_update_time", default: -> { "current_timestamp()" }, null: false
    t.index ["db_update_time"], name: "idx_db_update_time"
    t.index ["fund_day"], name: "idx_cal_date"
    t.index ["pfid", "fund_day"], name: "uni_key", unique: true
  end

  create_table "billing_consume_gifts", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.datetime "date", null: false, comment: "日期。"
    t.string "prod_name", limit: 20, null: false, comment: "禮物名稱。"
    t.integer "prod_price", null: false, comment: "禮物價格。", unsigned: true
    t.integer "person_number", limit: 3, null: false, comment: "使用禮物人數。", unsigned: true
    t.integer "used_count", limit: 3, null: false, comment: "使用禮物次數。", unsigned: true
    t.integer "total_gold", null: false, comment: "使用禮物總浪花。", unsigned: true
    t.timestamp "updated_at", default: -> { "current_timestamp()" }, null: false
    t.timestamp "created_at", default: -> { "current_timestamp()" }, null: false
    t.index ["date", "prod_name"], name: "uni_date_prod_name", unique: true
  end

  create_table "billing_consume_ranks", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.date "date", null: false, comment: "日期。"
    t.integer "pfid", null: false, comment: "用戶浪代號。", unsigned: true
    t.integer "total_gold", null: false, comment: "用戶總消費浪花。", unsigned: true
    t.datetime "db_create_time", default: -> { "current_timestamp()" }, null: false, comment: "資料建立時間。時區：UTC±00。"
    t.datetime "db_update_time", default: -> { "current_timestamp()" }, null: false, comment: "資料更新時間。時區：UTC±00。"
    t.index ["date"], name: "idx_date"
    t.index ["pfid", "date"], name: "uni_pfid", unique: true
  end

  create_table "billing_consumes", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.datetime "date", null: false, comment: "日期。"
    t.integer "consume_type", limit: 1, null: false, comment: "消費類型。0：飄屏；1：禮物。", unsigned: true
    t.integer "consume_user", limit: 3, default: 0, null: false, comment: "消費浪花人數", unsigned: true
    t.integer "total_gold", null: false, comment: "用戶總消費浪花。", unsigned: true
    t.timestamp "updated_at", default: -> { "current_timestamp()" }, null: false
    t.timestamp "created_at", default: -> { "current_timestamp()" }, null: false
    t.index ["date", "consume_type"], name: "uni_date_consume_type", unique: true
  end

  create_table "billing_first_orders", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "pfid", limit: 8, null: false, comment: "用戶浪代號。"
    t.datetime "pay_time", null: false, comment: "用戶首次充值時間。"
    t.string "channel_name", limit: 20, null: false, comment: "充值渠道名稱。"
    t.string "currency", limit: 3, null: false, comment: "國際貨幣別。參照 ISO 4217。"
    t.decimal "cash", precision: 10, scale: 3, null: false, comment: "用戶首次充值金額。"
    t.integer "gold", null: false, comment: "用戶充值所獲得的浪花。", unsigned: true
    t.datetime "db_create_time", default: -> { "current_timestamp()" }, null: false, comment: "資料建立時間。時區：UTC±00。"
    t.datetime "db_update_time", default: -> { "current_timestamp()" }, null: false, comment: "資料更新時間。時區：UTC±00。"
    t.index ["pfid"], name: "uni_pfid", unique: true
  end

  create_table "billing_infos", id: :integer, comment: "自增主鍵。", unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", comment: "[浪] 金流：平台金流總覽。作者：Allen<allen.chang@langlive.com>。", force: :cascade do |t|
    t.date "date", null: false, comment: "結算日期。時區：UTC±08。"
    t.integer "platform", limit: 1, null: false, comment: "平台分類。0：浪；1：金剛。"
    t.integer "category", limit: 1, null: false, comment: "虛擬物品流動分類。0：獲得虛擬物品；1：消耗虛擬物品；2：背包類；3：鑽石類；4：現金；5：錢包；6：im錢包；99：快照類；101：轉盤；102：瘋狂寶箱。"
    t.string "type", limit: 100, null: false, comment: "分類代號。"
    t.string "name", limit: 100, null: false, comment: "分類名稱。"
    t.integer "n", default: 0, null: false, comment: "紀錄筆數。", unsigned: true
    t.decimal "gold", precision: 13, scale: 2, default: "0.0", comment: "數量總和"
    t.datetime "db_create_time", default: -> { "current_timestamp()" }, null: false, comment: "資料建立時間。時區：UTC±00。"
    t.datetime "db_update_time", default: -> { "current_timestamp()" }, null: false, comment: "資料更新時間。時區：UTC±00。"
    t.index ["category"], name: "idx_category"
    t.index ["date"], name: "idx_date"
    t.index ["platform", "category", "type", "name", "date"], name: "uni_platform_category_type_name_date", unique: true
    t.index ["type"], name: "idx_type"
  end

  create_table "billing_order_ranks", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.date "date", null: false, comment: "日期。"
    t.integer "pfid", null: false, comment: "用戶浪代號。", unsigned: true
    t.integer "payments", limit: 2, comment: "付費次數。", unsigned: true
    t.decimal "cash", precision: 11, scale: 2, default: "0.0", null: false, comment: "用戶充值金額（新台幣；TWD）。"
    t.decimal "refund", precision: 11, scale: 2, default: "0.0", null: false, comment: "用戶退款金額（新台幣；TWD）。"
    t.integer "exp", comment: "用戶經驗。", unsigned: true
    t.datetime "db_create_time", default: -> { "current_timestamp()" }, null: false, comment: "資料建立時間。時區：UTC±00。"
    t.datetime "db_update_time", default: -> { "current_timestamp()" }, null: false, comment: "資料更新時間。時區：UTC±00。"
    t.index ["pfid", "date"], name: "uni_pfid_date", unique: true
  end

  create_table "billing_order_users", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.date "date", null: false, comment: "日期。"
    t.integer "new_order_user", limit: 2, null: false, comment: "新付費用戶人數。", unsigned: true
    t.integer "order_user", limit: 2, null: false, comment: "付費用戶人數（不含新付費用戶）。", unsigned: true
    t.integer "total_order_user", limit: 3, null: false, comment: "總付費用戶人數。", unsigned: true
    t.decimal "total_cash", precision: 11, scale: 2, null: false, comment: "用戶充值金額(新台幣；TWD)。"
    t.datetime "db_create_time", default: -> { "current_timestamp()" }, null: false, comment: "資料建立時間。時區：UTC±00。"
    t.datetime "db_update_time", default: -> { "current_timestamp()" }, null: false, comment: "資料更新時間。時區：UTC±00。"
    t.index ["date"], name: "uni_date", unique: true
  end

  create_table "billing_revenue_details", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.datetime "date", null: false, comment: "日期。"
    t.string "ch_name", limit: 20, null: false, comment: "充值渠道名稱。"
    t.string "currency", limit: 3, null: false, comment: "國際貨幣別。參照 ISO 4217。"
    t.integer "person_number", limit: 2, null: false, comment: "人數。", unsigned: true
    t.decimal "cash", precision: 11, scale: 3, null: false, comment: "金額。"
    t.integer "gold", null: false, comment: "用戶充值所獲得的浪花。", unsigned: true
    t.integer "extra_gold", null: false, comment: "用戶充值所獲得的額外浪花。", unsigned: true
    t.datetime "db_create_time", default: -> { "current_timestamp()" }, null: false, comment: "資料建立時間。時區：UTC±00。"
    t.datetime "db_update_time", default: -> { "current_timestamp()" }, null: false, comment: "資料更新時間。時區：UTC±00。"
    t.index ["date", "currency", "ch_name"], name: "uni_date_currency_ch_name", unique: true
  end

  create_table "daily_anchor_kpis", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", comment: "主播當月累積營收及指標表", force: :cascade do |t|
    t.integer "pfid", null: false, comment: "用戶浪代號。", unsigned: true
    t.date "last_cal_date"
    t.integer "month", comment: "計算月份"
    t.decimal "monthly_diamond", precision: 14, scale: 2, comment: "當月累積鑽石"
    t.integer "valid_days", limit: 1, comment: "當月累積有效日", unsigned: true
    t.decimal "hour_salary", precision: 7, scale: 2, comment: "時薪"
    t.decimal "valid_hours", precision: 7, scale: 4, comment: "當月累積有效時"
    t.decimal "open_hours", precision: 7, scale: 4, comment: "實際開播時長"
    t.decimal "actual_pay", precision: 10, scale: 4, comment: "當月累積成本"
    t.decimal "actual_pay_now", precision: 10, scale: 4, comment: "當月累積成本至今"
    t.decimal "kpi", precision: 10, scale: 4, comment: "達成率"
    t.decimal "kpi_now", precision: 10, scale: 4, comment: "達成率至今"
    t.decimal "total_cost", precision: 12, scale: 2, comment: "累積總成本"
    t.timestamp "created_at", default: -> { "current_timestamp()" }
    t.timestamp "updated_at", default: -> { "current_timestamp()" }
    t.integer "incremental_fans", limit: 3, default: 0, comment: "新增粉絲數", unsigned: true
    t.integer "share_counts", default: 0, comment: "被分享數", unsigned: true
    t.integer "status", limit: 1, default: 0, null: false, comment: "狀態(0, 正常, 1,合約結束 )", unsigned: true
    t.integer "company_id", comment: "經紀公司", unsigned: true
    t.integer "op_team", comment: "所屬團隊", unsigned: true
    t.integer "tmp_salary_system", limit: 1, comment: "薪資制度", unsigned: true
    t.integer "c_income", default: 0, comment: "月累積鑽石收入台幣", unsigned: true
    t.integer "g_fan", default: 0, comment: "月累積粉絲團人數", unsigned: true
    t.decimal "rank", precision: 2, default: "0", comment: "月主播排名30名以外為0", unsigned: true
    t.integer "activity_bonus_diamond", default: 0, null: false, comment: "活動贈送鑽石"
    t.integer "ace_duration", default: 0, comment: "王牌大主播時數", unsigned: true
    t.integer "category", default: 0, null: false, comment: "主播類型0:秀場, 1:電玩", unsigned: true
    t.integer "pcu_m", comment: "當月最大峰值人數", unsigned: true
    t.integer "c_duration", comment: "工商直播时长(秒)", unsigned: true
    t.bigint "income_n", default: 0, comment: "贵族收益", unsigned: true
    t.integer "income_groups", default: 0, null: false, comment: "粉絲團收入", unsigned: true
    t.decimal "donate_income", precision: 12, scale: 3, default: "0.0", null: false, comment: "動態打賞月"
    t.decimal "lang_diamond", precision: 12, scale: 3, default: "0.0", null: false, comment: "秀場:kpi鑽石收益 音頻:kpi鑽石收益"
    t.integer "voice_diamond", default: 0, null: false, comment: "音頻營收"
    t.integer "kpi_diamond", default: 0, null: false, comment: "秀場:目前無使用 音頻:秀場電競的禮物收益"
    t.decimal "voice_hours", precision: 10, scale: 2, default: "0.0", null: false, comment: "音頻開播時長(小時)"
    t.decimal "last_six_m_duration", precision: 11, scale: 2, default: "0.0", null: false, comment: "近六個月開播時長"
    t.integer "audio_extra_bonus", default: 0, null: false, comment: "音頻流水獎勵"
    t.bigint "diamond_balance", default: 0, null: false, comment: "月錢包剩餘數"
    t.index ["month"], name: "month"
    t.index ["pfid", "month", "category"], name: "pfid_category", unique: true
    t.index ["updated_at"], name: "uni_updated_at"
  end

  create_table "daily_anchor_kpis_logs", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", comment: "主播當月累積營收及指標表Log", force: :cascade do |t|
    t.integer "pfid", null: false, comment: "用戶浪代號。", unsigned: true
    t.date "last_cal_date"
    t.integer "month", comment: "計算月份"
    t.decimal "monthly_diamond", precision: 14, scale: 2, comment: "當月累積鑽石"
    t.integer "valid_days", limit: 1, comment: "當月累積有效日", unsigned: true
    t.decimal "hour_salary", precision: 7, scale: 2, comment: "時薪"
    t.decimal "valid_hours", precision: 7, scale: 4, comment: "當月累積有效時"
    t.decimal "open_hours", precision: 7, scale: 4, comment: "實際開播時長"
    t.decimal "actual_pay", precision: 10, scale: 4, comment: "當月累積成本"
    t.decimal "actual_pay_now", precision: 10, scale: 4, comment: "當月累積成本至今"
    t.decimal "kpi", precision: 10, scale: 4, comment: "達成率"
    t.decimal "kpi_now", precision: 10, scale: 4, comment: "達成率至今"
    t.decimal "total_cost", precision: 12, scale: 2, comment: "累積總成本"
    t.timestamp "created_at", default: -> { "current_timestamp()" }
    t.timestamp "updated_at", default: -> { "current_timestamp()" }
    t.integer "incremental_fans", limit: 3, default: 0, comment: "新增粉絲數", unsigned: true
    t.integer "share_counts", default: 0, comment: "被分享數", unsigned: true
    t.integer "status", limit: 1, default: 0, null: false, comment: "狀態(0, 正常, 1,合約結束 )", unsigned: true
    t.index ["month"], name: "month"
    t.index ["pfid", "last_cal_date", "month"], name: "uni_pfid_last_cal_date_month", unique: true
  end

  create_table "daily_anchor_kpis_per_users", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", comment: "每日主播開播時長粉絲數及分享數紀錄表", force: :cascade do |t|
    t.integer "pfid", null: false, comment: "用戶浪代號。", unsigned: true
    t.date "cal_date", null: false, comment: "計算日期"
    t.decimal "valid_hour", precision: 8, scale: 2, default: "0.0", comment: "當日有效開播時"
    t.decimal "open_hour", precision: 8, scale: 2, default: "0.0", comment: "當日開播時長"
    t.integer "diamond", default: 0, comment: "當日鑽石收入"
    t.integer "incremental_fans", limit: 3, default: 0, null: false, comment: "新增粉絲數", unsigned: true
    t.integer "share_counts", default: 0, null: false, comment: "被分享數", unsigned: true
    t.timestamp "created_at", default: -> { "current_timestamp()" }, comment: "系統建立時間"
    t.timestamp "updated_at", default: -> { "current_timestamp()" }, comment: "系統更新時間"
    t.integer "total_fans", default: 0, comment: "總粉絲數", unsigned: true
    t.integer "c_income", default: 0, comment: "鑽石收入台幣", unsigned: true
    t.integer "g_fan", default: 0, comment: "新增粉絲團人數", unsigned: true
    t.decimal "roi", precision: 8, scale: 2, default: "0.0", comment: "達成率", unsigned: true
    t.integer "activity_bonus_diamond", default: 0, null: false, comment: "活動贈送鑽石"
    t.integer "ace_duration", default: 0, comment: "王牌大主播時數", unsigned: true
    t.integer "category", default: 0, null: false, comment: "主播類型0:秀場, 1:電玩", unsigned: true
    t.integer "pcu", comment: "當日最大峰值人數", unsigned: true
    t.integer "c_duration", comment: "工商直播时长(秒)", unsigned: true
    t.bigint "income_n", default: 0, comment: "贵族收益", unsigned: true
    t.integer "income_groups", default: 0, null: false, comment: "粉絲團收入", unsigned: true
    t.decimal "donate_income", precision: 12, scale: 3, default: "0.0", null: false, comment: "動態打賞日"
    t.decimal "lang_diamond", precision: 12, scale: 3, default: "0.0", null: false, comment: "秀場:kpi鑽石收益 音頻:kpi鑽石收益"
    t.integer "voice_diamond", default: 0, null: false, comment: "音頻營收"
    t.integer "kpi_diamond", default: 0, null: false, comment: "秀場:目前無使用 音頻:秀場電競的禮物收益"
    t.decimal "voice_hours", precision: 10, scale: 2, default: "0.0", null: false, comment: "音頻開播時長(小時)"
    t.integer "audio_extra_bonus", default: 0, null: false, comment: "音頻流水獎勵"
    t.index ["pfid", "cal_date", "category"], name: "uni_pfid_cal_date_category", unique: true
  end

  create_table "daily_big_r_infos", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", comment: "10萬大R分析", force: :cascade do |t|
    t.integer "pfid", null: false, comment: "用戶浪代號。", unsigned: true
    t.date "cal_date", null: false
    t.string "locale", limit: 8, null: false, comment: "幣值"
    t.decimal "cash", precision: 10, scale: 2, null: false, comment: "儲值金額"
    t.decimal "total_cash", precision: 10, scale: 2, null: false, comment: "總儲值金額台幣"
    t.timestamp "last_order_time", comment: "最近一次儲值時間"
    t.timestamp "last_login_time", comment: "最近一次登入時間"
    t.timestamp "last_consume_time", comment: "最近一次送禮時間"
    t.timestamp "created_at", default: -> { "current_timestamp()" }, comment: "系統建立時間"
    t.timestamp "updated_at", default: -> { "current_timestamp()" }, comment: "系統更新時間"
    t.index ["pfid", "cal_date", "locale"], name: "pfid", unique: true
  end

  create_table "daily_billing_vip_donations", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", comment: "金流：VIP 用戶貢獻浪花給主播的排名。", force: :cascade do |t|
    t.date "date", null: false, comment: "日期。"
    t.integer "pfid", null: false, comment: "VIP 浪Live號。"
    t.integer "anchor_pfid", null: false, comment: "主播浪Live號。"
    t.integer "gold", null: false, comment: "浪花。", unsigned: true
    t.timestamp "created_at", default: -> { "current_timestamp()" }, null: false
    t.timestamp "updated_at", default: -> { "current_timestamp()" }, null: false
    t.index ["date", "pfid", "anchor_pfid"], name: "uni_date_pfid_anchor_pfid", unique: true
  end

  create_table "daily_billing_vips", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", comment: "金流：VIP 評鑑總覽表。", force: :cascade do |t|
    t.date "date", null: false, comment: "日期。"
    t.integer "type", limit: 1, null: false, comment: "1.潛力VIP; 2.每日充值前20名; 3.註冊即充值前20名; 4.用戶生涯首充前20名", unsigned: true
    t.integer "pfid", null: false, comment: "浪Live號。"
    t.decimal "cash", precision: 11, scale: 3, null: false, comment: "用戶充值金額(新臺幣)。"
    t.decimal "cumulative_cash", precision: 11, scale: 3, null: false, comment: "用戶充值總金額(新臺幣)。", unsigned: true
    t.timestamp "created_at", default: -> { "current_timestamp()" }, null: false
    t.timestamp "updated_at", default: -> { "current_timestamp()" }, null: false
    t.index ["date", "type", "pfid"], name: "uni_date_type_pfid", unique: true
  end

  create_table "daily_game_anchor_fans_rpt", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", comment: "遊戲主播粉絲團狀況 日表", force: :cascade do |t|
    t.date "cal_date"
    t.integer "pfid", default: 0, null: false, comment: "用戶pfid", unsigned: true
    t.integer "number_fans", default: 0, comment: "粉絲團人數", unsigned: true
    t.integer "new_fans", default: 0, comment: "新增人數", unsigned: true
    t.integer "expire_fans", default: 0, comment: "到期人數", unsigned: true
    t.integer "total_subtime", default: 0, comment: "總訂閱時間(日)", unsigned: true
    t.integer "fans_month_1", default: 0, comment: "購買1個月人數", unsigned: true
    t.integer "fans_month_3", default: 0, comment: "購買3個月人數", unsigned: true
    t.integer "fans_month_6", default: 0, comment: "購買6個月人數", unsigned: true
    t.integer "fans_month_12", default: 0, comment: "購買12個月人數", unsigned: true
    t.integer "consume_sun", default: 0, comment: "消費陽光", unsigned: true
    t.integer "consume", default: 0, comment: "消費浪花", unsigned: true
    t.timestamp "db_insert_time", default: -> { "current_timestamp()" }, null: false, comment: "utc+0"
    t.timestamp "db_update_time", default: -> { "current_timestamp()" }, null: false, comment: "utc+0"
    t.index ["cal_date"], name: "idx_day"
    t.index ["db_update_time"], name: "idx_db_update_time"
    t.index ["pfid", "cal_date"], name: "idx_unikey", unique: true
  end

  create_table "daily_game_anchor_fans_rpt_overview", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", comment: "電競粉絲團統計日報", force: :cascade do |t|
    t.date "cal_date", comment: "認定時間"
    t.integer "fans_counts", default: 0, null: false, comment: "粉絲團數"
    t.integer "users_count", default: 0, null: false, comment: "粉絲團人數"
    t.integer "balance", default: 0, null: false, comment: "粉絲團購買浪花數"
    t.integer "sun", default: 0, null: false, comment: "粉絲團消費陽光數"
    t.datetime "db_insert_time", default: -> { "current_timestamp()" }, null: false, comment: "utc+0"
    t.datetime "db_update_time", default: -> { "current_timestamp()" }, null: false, comment: "utc+0"
    t.index ["cal_date"], name: "cal_date", unique: true
    t.index ["db_update_time"], name: "db_update_time"
  end

  create_table "daily_order_channel_stat", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", comment: "每日渠道儲值金額統計", force: :cascade do |t|
    t.date "cal_date", comment: "計算日"
    t.integer "chid", default: 0, null: false, comment: "儲值渠道", unsigned: true
    t.decimal "total_cash", precision: 15, scale: 3, default: "0.0", null: false, comment: "總金額"
    t.datetime "db_insert_time", default: -> { "current_timestamp()" }, null: false, comment: "utc+0"
    t.datetime "db_update_time", default: -> { "current_timestamp()" }, null: false, comment: "utc+0"
    t.index ["cal_date"], name: "idx_day"
    t.index ["chid", "cal_date"], name: "cal_date", unique: true
    t.index ["db_update_time"], name: "db_update_time"
  end

  create_table "daily_pkchicken_report", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", comment: "pk吃雞日報", force: :cascade do |t|
    t.datetime "cal_date", comment: "比賽開始時間"
    t.integer "pk_times", default: 0, comment: "pk場次數"
    t.integer "mvp", default: 0, comment: "mvp數量"
    t.integer "anchor_number", default: 0, comment: "參與pk主播人數", unsigned: true
    t.integer "mission_number", default: 0, comment: "粉絲任務完成人數", unsigned: true
    t.integer "mission_times", default: 0, comment: "粉絲任務完成次數", unsigned: true
    t.integer "kill", default: 0, comment: "斬殺次數"
    t.integer "blood", default: 0, comment: "首殺次數"
    t.integer "blood_g1", default: 0, comment: "首殺禮物1-5000數量", unsigned: true
    t.integer "blood_g5001", default: 0, comment: "首殺禮物5001-10000數量", unsigned: true
    t.integer "blood_g1w", default: 0, comment: "首殺禮物10001-數量", unsigned: true
    t.integer "prod_cnt", default: 0, comment: "每日消耗道具數"
    t.integer "consume_people", default: 0, comment: "送禮人數"
    t.integer "gold", default: 0, comment: "消耗浪花"
    t.integer "diamond", default: 0, comment: "主播鑽石收益"
    t.integer "g1", default: 0, comment: "小血包數量"
    t.integer "g2", default: 0, comment: "大血包數量"
    t.integer "g3", default: 0, comment: "迷霧數量"
    t.integer "g4", default: 0, comment: "小彈藥箱數量"
    t.integer "g5", default: 0, comment: "大彈藥箱數量"
    t.integer "g6", default: 0, comment: "空投補給數量"
    t.integer "anchor_3rd", default: 0, comment: "150001以上"
    t.integer "anchor_2nd", default: 0, comment: "50001-150000"
    t.integer "anchor_1st", default: 0, comment: "50000以下"
    t.integer "total_award", default: 0, comment: "獎金發放金額"
    t.integer "airdrop_num", default: 0, comment: "空投發放金額"
    t.datetime "db_insert_time", default: -> { "current_timestamp()" }, null: false, comment: "系統建立時間"
    t.datetime "db_update_time", default: -> { "current_timestamp()" }, null: false, comment: "系統更新時間"
    t.integer "prod_cnt_bag", default: 0, comment: "每日消耗道具數_bag"
    t.integer "consume_people_bag", default: 0, comment: "送禮人數_bag"
    t.integer "gold_bag", default: 0, comment: "消耗浪花_bag"
    t.integer "diamond_bag", default: 0, comment: "主播鑽石收益_bag"
    t.index ["cal_date"], name: "uni_key", unique: true
    t.index ["db_update_time"], name: "idx_db_update_time"
  end

  create_table "daily_product_daily_task_invitee_stats", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", comment: "[浪-日報] 每日任務：成功受邀用戶金流總覽。作者：Allen<allen.chang@langlive.com>。", force: :cascade do |t|
    t.date "date", null: false, comment: "計算日期。時區：UTC±08。"
    t.integer "n_invitee", limit: 2, default: 0, null: false, comment: "當日被邀請用戶總數。", unsigned: true
    t.integer "n_paid", limit: 2, default: 0, null: false, comment: "用戶被成功邀請後，30日內有充值用戶總數。", unsigned: true
    t.decimal "cash", precision: 10, scale: 2, default: "0.0", comment: "用戶被成功邀請後，30日內充值金額(新臺幣)總數。"
    t.integer "n_consume", limit: 2, default: 0, null: false, comment: "用戶被成功邀請後，30日內有消耗浪花用戶總數。", unsigned: true
    t.integer "gold", comment: "用戶被成功邀請後，30日內消耗浪花總數。"
    t.datetime "db_create_time", default: -> { "current_timestamp()" }, null: false, comment: "資料建立時間。時區：UTC±00。"
    t.datetime "db_update_time", default: -> { "current_timestamp()" }, null: false, comment: "資料更新時間。時區：UTC±00。"
    t.index ["date"], name: "uni_date", unique: true
  end

  create_table "daily_product_daily_task_stats", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", comment: "[浪-日報] 每日任務：任務系統統計總覽。作者：Allen<allen.chang@langlive.com>。", force: :cascade do |t|
    t.date "date", null: false, comment: "計算日期。時區：UTC±08。"
    t.string "task_id", limit: 6, null: false, comment: "每日任務系統代號。"
    t.integer "value", default: 0, null: false, comment: "任務統計數量。", unsigned: true
    t.datetime "db_create_time", default: -> { "current_timestamp()" }, null: false, comment: "資料建立時間。時區：UTC±00。"
    t.datetime "db_update_time", default: -> { "current_timestamp()" }, null: false, comment: "資料更新時間。時區：UTC±00。"
    t.index ["date", "task_id"], name: "uni_date_taskId", unique: true
  end

  create_table "daily_product_gifts", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", comment: "[日報] 商品-禮物：禮物統計。", force: :cascade do |t|
    t.date "date", null: false, comment: "日期。"
    t.integer "prod_id", null: false, comment: "禮物代號。", unsigned: true
    t.string "prod_name", limit: 44, null: false, comment: "禮物名稱。"
    t.integer "prod_price", default: 0, null: false, comment: "禮物價格。", unsigned: true
    t.integer "person_number", limit: 3, null: false, comment: "使用禮物人數。", unsigned: true
    t.integer "used_count", default: 0, null: false, comment: "使用禮物次數。", unsigned: true
    t.integer "total_gold", default: 0, null: false, comment: "使用禮物總浪花。", unsigned: true
    t.datetime "db_create_time", default: -> { "current_timestamp()" }, null: false, comment: "資料建立時間。時區：UTC±00。"
    t.datetime "db_update_time", default: -> { "current_timestamp()" }, null: false, comment: "資料更新時間。時區：UTC±00。"
    t.index ["date"], name: "idx_date"
    t.index ["prod_id", "date"], name: "uni_prodId_date", unique: true
  end

  create_table "friend_anchor_fans", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.date "date", null: false, comment: "日期。"
    t.integer "pfid", null: false, comment: "用戶浪代號。", unsigned: true
    t.integer "new_fans", limit: 2, null: false, comment: "主播新增粉絲數。", unsigned: true
    t.datetime "db_create_time", default: -> { "current_timestamp()" }, null: false, comment: "資料建立時間。時區：UTC±00。"
    t.datetime "db_update_time", default: -> { "current_timestamp()" }, null: false, comment: "資料更新時間。時區：UTC±00。"
    t.index ["date"], name: "idx_date"
    t.index ["pfid", "date"], name: "uni_pfid_date", unique: true
  end

  create_table "friend_anchor_fans_ranks", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.date "date", null: false, comment: "日期。"
    t.integer "pfid", null: false, comment: "用戶浪代號。", unsigned: true
    t.datetime "register_time", null: false, comment: "用戶註冊時間。主播。"
    t.integer "total_fans", limit: 3, null: false, comment: "主播總粉絲數。", unsigned: true
    t.datetime "db_create_time", default: -> { "current_timestamp()" }, null: false, comment: "資料建立時間。時區：UTC±00。"
    t.datetime "db_update_time", default: -> { "current_timestamp()" }, null: false, comment: "資料更新時間。時區：UTC±00。"
    t.index ["date", "pfid"], name: "uni_date_pfid", unique: true
    t.index ["pfid"], name: "idx_pfid"
  end

  create_table "game_report_by_live_id", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.date "cal_date", comment: "計算日期"
    t.string "topic_title", limit: 200, comment: "遊戲類別"
    t.integer "pfid", comment: "主播編號"
    t.string "live_id", limit: 200, comment: "Live_id"
    t.float "open_duration", comment: "總開播時長（分鐘)"
    t.integer "revenue", comment: "主播收入鑽石數"
    t.integer "user_diamond", comment: "用戶花費鑽石數"
    t.integer "user_total", comment: "總觀看人數"
    t.float "total_duration", comment: "總觀看時長（分鐘)"
    t.float "total_duration_avg", comment: "平均觀看時長（分鐘)"
    t.integer "user_total_over_min", comment: "超過一分鐘觀看人數"
    t.float "total_duration_over_min", comment: "超過一分鐘觀看時長（分鐘)"
    t.float "total_duration_over_min_avg", comment: "超過一分鐘平均觀看時長（分鐘)"
    t.integer "pcu", comment: "PCU"
    t.integer "over_ten_min_user", default: 0, null: false, comment: "超過10分鐘觀看人數"
    t.float "over_ten_min_avg_times", default: 0.0, null: false, comment: "超過10分鐘平均觀看時長"
    t.integer "over_ten_min_user_valid", default: 0, null: false, comment: "超過10分鐘觀看人數排除異常"
    t.float "over_ten_min_avg_times_valid", default: 0.0, null: false, comment: "超過10分鐘平均觀看時長排除異常"
    t.integer "over_min_user_valid", default: 0, null: false, comment: "超過1分鐘觀看人數排除異常"
    t.float "over_avg_times_valid", default: 0.0, null: false, comment: "超過1分鐘平均觀看時長排除異常"
    t.integer "over_min_user_tourist", default: 0, null: false, comment: "超過1分鐘觀看人數訪客"
    t.float "over_min_user_tourist_avg_times", default: 0.0, null: false, comment: "超過1分鐘平均觀看時長訪客"
    t.integer "over_ten_min_user_tourist", default: 0, null: false, comment: "超過10分鐘觀看人數訪客"
    t.float "over_ten_min_user_tourist_avg_times", default: 0.0, null: false, comment: "超過10分鐘平均觀看時長訪客"
    t.integer "tourist_total_user", default: 0, null: false, comment: "訪客觀看人數"
    t.timestamp "created_at", default: -> { "current_timestamp()" }, null: false, comment: "系統建立時間"
    t.timestamp "updated_at", default: -> { "current_timestamp()" }, null: false, comment: "系統更新時間"
    t.integer "sub_topic_id", comment: "遊戲類別id"
    t.integer "uv", default: 0, null: false, comment: "不重複累積觀看人數"
    t.integer "fan_group", default: 0, null: false, comment: "粉絲團增加人數"
    t.integer "over_5s_user_valid", default: 0, null: false, comment: "超過5s觀看人數排除異常"
    t.float "over_5s_times_valid", default: 0.0, null: false, comment: "超過5s平均觀看時長排除異常"
    t.integer "login_user_valid", default: 0, null: false, comment: "登入觀看人數排除異常"
    t.integer "total_user_valid", default: 0, null: false, comment: "全部觀看人數排除異常"
    t.integer "cum_follow", default: 0, null: false, comment: "累積追蹤用戶數"
    t.integer "newreg_follow", default: 0, null: false, comment: "新註冊開播追蹤數"
    t.integer "follow_cancel", default: 0, null: false, comment: "開播取消追蹤用戶數"
    t.integer "share_cts", default: 0, null: false, comment: "分享次數"
    t.float "ent_fans_act3", default: 0.0, null: false, comment: "三月活躍粉絲進房率"
    t.index ["cal_date"], name: "idx_cal_date"
    t.index ["live_id", "cal_date"], name: "idx_uni_key", unique: true
    t.index ["pfid"], name: "idx_pfid"
  end

  create_table "gaming_view_percent", id: :integer, comment: "流水號", unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", comment: "用戶電競觀看比例", force: :cascade do |t|
    t.integer "pfid", comment: "用戶編號"
    t.integer "kk_user", limit: 1, comment: "是否為電競用戶"
    t.datetime "db_insert_time", default: -> { "current_timestamp()" }, null: false
    t.datetime "db_update_time", default: -> { "current_timestamp()" }, null: false
    t.index ["db_update_time"], name: "idx_db_update_time"
    t.index ["pfid"], name: "idx_uni_key", unique: true
  end

  create_table "global_game_daus", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", comment: "[分析] 遊戲直播 DAU TOP 25：統計每日遊戲直播主的 DAU TOP 25。作者：Allen<allen.chang@langlive.com>。", force: :cascade do |t|
    t.date "date", null: false, comment: "建立日期。"
    t.string "game_type", limit: 45, collation: "utf8mb4_unicode_ci", comment: "遊戲類型。"
    t.integer "rank", limit: 1, null: false, comment: "排名順序。", unsigned: true
    t.string "pfid", limit: 8, null: false, comment: "用戶浪ID。"
    t.string "nickname", limit: 190, collation: "utf8mb4_unicode_ci", comment: "主播暱稱。"
    t.integer "dau", limit: 3, null: false, comment: "統計人數。", unsigned: true
    t.timestamp "created_at", default: -> { "current_timestamp()" }, null: false
    t.timestamp "updated_at", default: -> { "current_timestamp()" }, null: false
    t.index ["date", "game_type", "rank"], name: "uni_date_gameType_rank", unique: true
  end

  create_table "godview_daily_anchors", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", comment: "上帝模式報告第一部分", force: :cascade do |t|
    t.date "report_date", comment: "結算日期"
    t.integer "pfid", null: false, comment: "用戶浪代號。", unsigned: true
    t.decimal "duration", precision: 6, scale: 1, comment: "開播時長"
    t.integer "times", limit: 2, comment: "開播次數", unsigned: true
    t.integer "revenue", comment: "開播收入", unsigned: true
    t.timestamp "updated_at", default: -> { "current_timestamp()" }, null: false
    t.timestamp "created_at", default: -> { "current_timestamp()" }, null: false
    t.index ["pfid", "report_date"], name: "idx_report_date", unique: true
  end

  create_table "godview_monthly_anchors", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", comment: "上帝模式報告第一部分", force: :cascade do |t|
    t.integer "report_month", limit: 3, comment: "累積當月", unsigned: true
    t.integer "pfid", null: false, comment: "用戶浪代號。", unsigned: true
    t.decimal "duration", precision: 6, scale: 1, comment: "開播時長"
    t.integer "times", limit: 2, comment: "開播次數", unsigned: true
    t.integer "revenue", comment: "開播收入", unsigned: true
    t.timestamp "updated_at", default: -> { "current_timestamp()" }, null: false
    t.timestamp "created_at", default: -> { "current_timestamp()" }, null: false
    t.integer "rank", limit: 2, comment: "排名", unsigned: true
    t.index ["pfid", "report_month"], name: "idx_report_month", unique: true
    t.index ["updated_at"], name: "index_godview_monthly_anchors_on_updated_at"
  end

  create_table "im_user_profile_map", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", comment: "IM用戶訊息+浪對應表", force: :cascade do |t|
    t.integer "pfid"
    t.integer "moyin_id"
    t.string "nickname", limit: 256
    t.boolean "gender", default: false, null: false, comment: "性别：0未知1男2女"
    t.boolean "sex_judged", default: false, null: false, comment: "判定性別:0-未判定 1-男 2-女"
    t.date "birthday"
    t.string "mobile", limit: 50
    t.datetime "reg_time", comment: "im註冊時間utc+0"
    t.integer "origin", limit: 1, comment: "註冊来源，1wechat，2fb，3g+，4手机，5line"
    t.integer "upload_cts", limit: 2, default: 0, null: false, comment: "影片上傳總數", unsigned: true
    t.datetime "last_upload_time", comment: "最後上傳時間"
    t.datetime "last_login_time", comment: "最後登入時間"
    t.datetime "lrfm_update_time", comment: "im_lrfm 更新時間"
    t.datetime "db_insert_time", default: -> { "current_timestamp()" }, null: false, comment: "系統建立時間"
    t.datetime "db_update_time", default: -> { "current_timestamp()" }, null: false, comment: "系統更新時間"
    t.index ["db_update_time"], name: "idx_db_update_time"
    t.index ["last_login_time"], name: "idx_last_login_time"
    t.index ["last_upload_time"], name: "idx_last_upload_time"
    t.index ["moyin_id"], name: "idx_moyin_id"
    t.index ["pfid"], name: "uni_key", unique: true
  end

  create_table "lang_abtest_performance", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", comment: "abtest 評估表", force: :cascade do |t|
    t.string "type", limit: 5, comment: "tab名稱"
    t.date "cal_date", comment: "計算日期"
    t.integer "start_app", limit: 2, comment: "當日註冊且進入直播主頁人數"
    t.float "stay_time", comment: "平均停留主頁時間"
    t.float "slip_times", comment: "平均主頁向下滑動格數"
    t.integer "ent_people2", limit: 2, comment: "進入相反tab總人數"
    t.integer "ent_people", limit: 2, comment: "進入該tab總人數"
    t.integer "ent_times", limit: 2, comment: "進入該tab總次數"
    t.integer "ent_times2", limit: 2, comment: "進入相反tab總次數"
    t.integer "retention2", limit: 2, comment: "次留 需進入直播主頁"
    t.integer "retention3", limit: 2, comment: "三留 需進入直播主頁"
    t.float "view_time", comment: "由tab進入直播間觀看平均時長"
    t.integer "fan_anchor", limit: 2, comment: "加入粉絲團主播數"
    t.integer "fan_pfid", limit: 2, comment: "加入粉絲團用戶數"
    t.integer "fan", limit: 2, comment: "加入粉絲團次數"
    t.integer "follow_anchor", limit: 2, comment: "追蹤主播主播數"
    t.integer "follow_pfid", limit: 2, comment: "追蹤主播用戶數"
    t.integer "follow", limit: 2, comment: "追蹤主播次數"
    t.integer "num_share", limit: 2, comment: "分享直播間次數"
    t.integer "share_pfid", limit: 2, comment: "分享直播間人數"
    t.integer "num_order", limit: 2, comment: "首充人數"
    t.integer "cash", comment: "充值金額"
    t.integer "gold", comment: "充值浪花"
    t.integer "extra_gold", comment: "充值額外浪花"
    t.integer "num_consume", limit: 2, comment: "花費浪花人數"
    t.integer "prod_total", comment: "花費浪花"
    t.integer "num_consume_s", limit: 2, comment: "消費人數-預設頁面進入直播間"
    t.integer "prod_total_s", comment: "消費浪花-預設頁面進入直播間"
    t.integer "num_consume_c", limit: 2, comment: "消費人數-比較頁面進入直播間"
    t.integer "prod_total_c", comment: "消費浪花-比較頁面進入直播間"
    t.datetime "db_insert_time", default: -> { "current_timestamp()" }, null: false
    t.datetime "db_update_time", default: -> { "current_timestamp()" }, null: false
    t.index ["cal_date"], name: "idx_cal_date"
    t.index ["db_update_time"], name: "idx_db_update_time"
    t.index ["type", "cal_date"], name: "uni_key", unique: true
  end

  create_table "lang_abtest_performance_v2", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", comment: "abtest_v2 評估表", force: :cascade do |t|
    t.date "cal_date", comment: "計算日期"
    t.integer "type", limit: 2, default: 1, comment: "日範圍"
    t.integer "start_app", limit: 2, default: 0, comment: "當日註冊且進入直播主頁人數"
    t.float "stay_time", default: 0.0, comment: "平均停留主頁時間"
    t.float "stay_time_op", default: 0.0, comment: "平均停留相對主頁時間"
    t.float "slip_times", default: 0.0, comment: "平均主頁向下滑動格數"
    t.float "slip_times_op", default: 0.0, comment: "平均相對主頁向下滑動格數"
    t.integer "ent_people", default: 0, comment: "進入該tab總人數"
    t.integer "ent_people_op", default: 0, comment: "進入相對tab總人數"
    t.integer "ent_times", default: 0, comment: "進入該tab總次數"
    t.integer "ent_times_op", default: 0, comment: "進入相反tab總次數"
    t.float "retention", default: 0.0, comment: "留存(跟著type)"
    t.float "view_time", default: 0.0, comment: "由tab進入直播間觀看平均時長"
    t.float "view_time_op", default: 0.0, comment: "由相反tab進入直播間觀看平均時長"
    t.integer "follow_number", limit: 2, default: 0, comment: "主要頁面追蹤主播次數"
    t.integer "follow_number_op", limit: 2, default: 0, comment: "相反頁面追蹤主播次數"
    t.integer "prod_total", default: 0, comment: "主頁頁面進房花費浪花"
    t.integer "prod_total_op", default: 0, comment: "相反頁面進房花費浪花"
    t.integer "cash_num", default: 0, comment: "充值人數"
    t.integer "cash", default: 0, comment: "充值金額"
    t.datetime "db_insert_time", default: -> { "current_timestamp()" }, null: false
    t.datetime "db_update_time", default: -> { "current_timestamp()" }, null: false
    t.index ["cal_date"], name: "idx_cal_date"
    t.index ["db_update_time"], name: "idx_db_update_time"
    t.index ["type", "cal_date"], name: "uni_key", unique: true
  end

  create_table "lang_anchor_history_live_story", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.integer "pfid", default: 0, null: false, comment: "主播號"
    t.integer "year", comment: "年份"
    t.integer "days", comment: "開播天數"
    t.integer "hours", comment: "開播時數"
    t.integer "view_users", comment: "直播間人數"
    t.integer "increase_fans", comment: "新增關注"
    t.string "favotite_discover", limit: 250, comment: "用最多次封面照"
    t.string "top_hot_dynamic", limit: 200, comment: "多人感兴趣的文章"
    t.integer "live_days", default: 0, null: false, comment: "註冊距2019-12-31多少天"
    t.datetime "db_insert_time", default: -> { "current_timestamp()" }, null: false, comment: "系統寫入時間"
    t.datetime "db_update_time", default: -> { "current_timestamp()" }, null: false, comment: "系統更新時間"
    t.date "h_date", comment: "開播最久的日期"
    t.date "f_date", comment: "被追蹤最多的日期"
    t.integer "hour_est", comment: "開播最久的時數"
    t.integer "follow_est", comment: "最多追蹤的次數"
    t.integer "anchor_score", comment: "主播數值"
    t.integer "img_cnt", comment: "封面照使用次數"
    t.integer "post_comment", comment: "動態評論數"
    t.integer "post_like", comment: "動態讚數"
    t.index ["year", "pfid"], name: "uni_key", unique: true
  end

  create_table "lang_anchor_history_tops", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", comment: "年度主播收禮TOP數據表", force: :cascade do |t|
    t.integer "t_pfid", comment: "主播編號"
    t.integer "pfid", comment: "用戶編號"
    t.integer "ranks", comment: "名次"
    t.integer "values", comment: "浪花數"
    t.datetime "db_insert_time", default: -> { "current_timestamp()" }, null: false
    t.datetime "db_update_time", default: -> { "current_timestamp()" }, null: false
    t.index ["t_pfid", "ranks"], name: "uni_key", unique: true
  end

  create_table "lang_anchor_history_tops_10", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", comment: "年度主播收禮TOP數據表", force: :cascade do |t|
    t.integer "t_pfid"
    t.integer "pfid"
    t.integer "ranks"
    t.integer "val"
    t.datetime "db_insert_time", default: -> { "current_timestamp()" }, null: false
    t.datetime "db_update_time", default: -> { "current_timestamp()" }, null: false
    t.index ["t_pfid", "ranks"], name: "uni_key", unique: true
  end

  create_table "lang_audio_daily", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", comment: "音頻場次數據表", force: :cascade do |t|
    t.date "cal_date", comment: "計算日期(關播)"
    t.integer "pfid", comment: "主播編號"
    t.string "live_id", limit: 200, comment: "Live_id"
    t.float "duration", default: 0.0, null: false, comment: "總開播時長（分鐘)"
    t.integer "diamond", default: 0, null: false, comment: "主播收入鑽石數"
    t.integer "balance", default: 0, null: false, comment: "用戶花費浪花數"
    t.datetime "db_insert_time", default: -> { "current_timestamp()" }, null: false, comment: "系統建立時間"
    t.datetime "db_update_time", default: -> { "current_timestamp()" }, null: false, comment: "系統更新時間"
    t.index ["cal_date"], name: "idx_cal_date"
    t.index ["live_id", "cal_date"], name: "idx_uni_key", unique: true
    t.index ["pfid"], name: "idx_pfid"
  end

  create_table "lang_daily_retention", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.datetime "reg_time"
    t.integer "diff_day"
    t.integer "val"
    t.datetime "db_insert_time", default: -> { "current_timestamp()" }, null: false
    t.datetime "db_update_time", default: -> { "current_timestamp()" }, null: false
    t.index ["reg_time", "diff_day"], name: "uni_key", unique: true
  end

  create_table "lang_first_followed_recommend", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", comment: "主播首次被追蹤率報表", force: :cascade do |t|
    t.integer "t_pfid", comment: "主播號"
    t.decimal "ratio", precision: 5, scale: 2, comment: "粉絲追蹤率"
    t.datetime "db_insert_time", default: -> { "current_timestamp()" }, null: false
    t.datetime "db_update_time", default: -> { "current_timestamp()" }, null: false
    t.index ["t_pfid"], name: "uni_key", unique: true
  end

  create_table "lang_first_followed_recommend_log", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", comment: "主播首次被追蹤率報表日誌-保留60天", force: :cascade do |t|
    t.date "cal_date", null: false, comment: "名單產出日"
    t.integer "t_pfid", comment: "主播號"
    t.decimal "ratio", precision: 5, scale: 2, comment: "粉絲追蹤率"
    t.datetime "db_insert_time", default: -> { "current_timestamp()" }, null: false
    t.datetime "db_update_time", default: -> { "current_timestamp()" }, null: false
    t.index ["t_pfid", "cal_date"], name: "uni_key", unique: true
  end

  create_table "lang_first_followed_report", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", comment: "主播首次被追蹤率報表", force: :cascade do |t|
    t.date "cal_date", null: false, comment: "日期。時區：UTC+08"
    t.integer "new_users", default: 0, null: false, comment: "新用戶註冊數"
    t.integer "keep_user", default: 0, null: false, comment: "留存人數"
    t.integer "s_view_times", default: 0, null: false, comment: "觀看人次"
    t.integer "s_view_user", default: 0, null: false, comment: "觀看人數"
    t.integer "s_view_anchor", default: 0, null: false, comment: "觀看主播人數"
    t.integer "s_view_n_follow_anchor", default: 0, null: false, comment: "觀看未追蹤主播人數"
    t.integer "ns_view_times", default: 0, null: false, comment: "非秀場觀看人次"
    t.integer "ns_view_user", default: 0, null: false, comment: "非秀場觀看人數"
    t.integer "n_view_user", default: 0, null: false, comment: "無觀看人數"
    t.integer "remd_folow_times", default: 0, null: false, comment: "有推薦有追蹤人次"
    t.integer "remd_folow_users", default: 0, null: false, comment: "有推薦有追蹤主播數"
    t.decimal "remd_folow_ration", precision: 5, scale: 2, default: "0.0", null: false, comment: "有推薦有追蹤平均用戶追蹤率"
    t.integer "n_remd_folow_times", default: 0, null: false, comment: "無推薦有追蹤人次"
    t.integer "n_remd_folow_users", default: 0, null: false, comment: "無推薦有追蹤主播數"
    t.decimal "n_remd_folow_ration", precision: 5, scale: 2, default: "0.0", null: false, comment: "無推薦有追蹤平均用戶追蹤率"
    t.datetime "db_insert_time", default: -> { "current_timestamp()" }, null: false
    t.datetime "db_update_time", default: -> { "current_timestamp()" }, null: false
    t.index ["cal_date"], name: "uni_key", unique: true
    t.index ["db_insert_time"], name: "idx_db_insert_time"
  end

  create_table "lang_first_view_anchor_report", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.date "cal_date", comment: "統計日期"
    t.integer "t_pfid", comment: "主播號"
    t.integer "first_view", default: 0, null: false
    t.integer "first_view_follow", default: 0, null: false
    t.decimal "ratio", precision: 5, scale: 2, default: "0.0", null: false
    t.datetime "db_insert_time", default: -> { "current_timestamp()" }, null: false, comment: "utc+0"
    t.datetime "db_update_time", default: -> { "current_timestamp()" }, null: false, comment: "utc+0"
    t.index ["cal_date"], name: "idx_cal_date"
    t.index ["t_pfid", "cal_date"], name: "t_pfid", unique: true
    t.index ["t_pfid"], name: "idx_t_pfid"
  end

  create_table "lang_monthly_retention", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.datetime "reg_time"
    t.integer "diff_month"
    t.integer "val"
    t.datetime "db_insert_time", default: -> { "current_timestamp()" }, null: false
    t.datetime "db_update_time", default: -> { "current_timestamp()" }, null: false
    t.index ["reg_time", "diff_month"], name: "uni_key", unique: true
  end

  create_table "lang_recommend_performance", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", comment: "推薦成效報告", force: :cascade do |t|
    t.date "cal_date", null: false, comment: "統計日期"
    t.integer "r_type", limit: 1, comment: "推薦類型"
    t.integer "user_ent_count", default: 0, null: false, comment: "進房人數"
    t.integer "user_ent_times", default: 0, null: false, comment: "進房人次"
    t.integer "anchor_count", limit: 2, default: 0, null: false, comment: "推薦進房主播數(主播id去重)"
    t.integer "tracking_user", limit: 2, default: 0, null: false, comment: "當日追蹤觀眾人數"
    t.integer "tracked_anchor", limit: 2, default: 0, null: false, comment: "當日被追蹤主播數"
    t.integer "tracked_times", default: 0, null: false, comment: "追蹤人次", unsigned: true
    t.datetime "db_insert_time", default: -> { "current_timestamp()" }, null: false
    t.datetime "db_update_time", default: -> { "current_timestamp()" }, null: false
    t.index ["cal_date"], name: "idx_cal_date"
    t.index ["r_type", "cal_date"], name: "uni_key", unique: true
  end

  create_table "lang_revenue_monthly", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.integer "pfid", comment: "用戶編號"
    t.integer "cal_month", default: 0, comment: "月份"
    t.decimal "total_money", precision: 12, scale: 3, default: "0.0", null: false, comment: "當月儲值(202001是歷史儲值)"
    t.datetime "db_insert_time", default: -> { "current_timestamp()" }, null: false
    t.datetime "db_update_time", default: -> { "current_timestamp()" }, null: false
    t.index ["cal_month"], name: "idx_cal_month"
    t.index ["pfid", "cal_month"], name: "uni_key", unique: true
  end

  create_table "lang_shortvideo_lrfm", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", comment: "浪短視頻LRFM", force: :cascade do |t|
    t.integer "pfid", comment: "主播編號"
    t.datetime "first_date", comment: "第一次觀看短影時間"
    t.integer "L", default: 0, null: false, comment: "距上一次登入天數"
    t.datetime "last_time", comment: "最後觀看時間"
    t.integer "total_video_counts", default: 0, null: false, comment: "總觀看影片數"
    t.bigint "total_view_time", default: 0, null: false, comment: "總觀看時長"
    t.datetime "db_insert_time", default: -> { "current_timestamp()" }, null: false
    t.datetime "db_update_time", default: -> { "current_timestamp()" }, null: false
    t.index ["first_date"], name: "idx_first_date"
    t.index ["last_time"], name: "idx_last_time"
    t.index ["pfid"], name: "uni_key", unique: true
  end

  create_table "lang_shortvideo_report_daily", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", comment: "浪短視頻日報", force: :cascade do |t|
    t.date "cal_date", comment: "統計日期"
    t.integer "sv_dau", default: 0, null: false, comment: "短視頻DAU"
    t.float "avg_duration", default: 0.0, comment: "平均觀看秒數"
    t.float "avg_duration_valid", default: 0.0, comment: "平均有效觀看秒數"
    t.float "sv_avg_view_video", default: 0.0, null: false, comment: "人均觀看影片數"
    t.float "new_user_keep_ratio", default: 0.0, null: false, comment: "短視頻新用戶次留"
    t.integer "sv_only_member", default: 0, null: false, comment: "只看短視頻用戶數"
    t.integer "live_only_member", default: 0, null: false, comment: "只看秀場用戶數"
    t.integer "sv_and_live_member", default: 0, null: false, comment: "短視頻與秀場交集用戶數"
    t.float "o_sv_avg_vt", default: 0.0, comment: "只看短視頻人均觀看時長"
    t.float "o_sv_avg_vc", default: 0.0, comment: "只看短視頻人均觀看視頻數"
    t.float "o_sv_likes", default: 0.0, comment: "只看短視頻按讚視頻數"
    t.float "o_sv_comment", default: 0.0, comment: "只看短視頻評論視頻數"
    t.float "valid_view_recording", default: 0.0, null: false, comment: "人均有效觀看影片數"
    t.float "valid_view_user", default: 0.0, null: false, comment: "影均有效觀看用戶數"
    t.float "complete_view_recording", default: 0.0, null: false, comment: "人均完整觀看影片數"
    t.float "complete_view_user", default: 0.0, null: false, comment: "影均完整觀看用戶數"
    t.integer "like_recording", default: 0, null: false, comment: "按讚視頻數"
    t.integer "like_member", default: 0, null: false, comment: "按讚用戶數"
    t.integer "comment_recording", default: 0, null: false, comment: "評論視頻數"
    t.integer "comment_member", default: 0, null: false, comment: "評論用戶數"
    t.integer "lang_sv_likes", default: 0, comment: "浪短視頻點讚數"
    t.integer "lang_sv_comments", default: 0, comment: "浪短視頻評論數"
    t.datetime "db_insert_time", default: -> { "current_timestamp()" }, null: false, comment: "系統寫入時間 utc+0"
    t.datetime "db_update_time", default: -> { "current_timestamp()" }, null: false, comment: "系統更新時間 utc+0"
    t.index ["cal_date"], name: "cal_date", unique: true
  end

  create_table "lang_single_act", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", comment: "浪單日活動成效表", force: :cascade do |t|
    t.date "cal_date", comment: "活動日期"
    t.integer "types", limit: 1, default: 0, comment: "活動類型"
    t.integer "act_id", comment: "活動id"
    t.integer "prod_id", comment: "禮物id"
    t.integer "islucky", limit: 1, default: 0, null: false, comment: "是否為爆擊禮物"
    t.integer "prod_price", default: 0, null: false, comment: "禮物牌價"
    t.string "prod_name", limit: 50, comment: "名稱"
    t.integer "times", comment: "抽獎次數"
    t.integer "generate_count", comment: "中獎道具數"
    t.integer "members", comment: "中獎人數"
    t.integer "fragment_id", comment: "碎片id"
    t.string "fragment_name", limit: 40, comment: "碎片名稱"
    t.integer "block", comment: "兌換需求碎片數"
    t.datetime "db_insert_time", default: -> { "current_timestamp()" }, null: false, comment: "系統建立時間 utc+0"
    t.datetime "db_update_time", default: -> { "current_timestamp()" }, null: false, comment: "系統更新時間 utc+0"
    t.index ["act_id", "fragment_id"], name: "idx_act_id_fragment_id"
    t.index ["act_id", "prod_id"], name: "idx_act_id_prod_id"
    t.index ["cal_date"], name: "idx_cal_date"
    t.index ["db_update_time"], name: "idx_db_update_time"
    t.index ["types"], name: "idx_types"
  end

  create_table "lang_single_act_master", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", comment: "浪單日活動成效主檔表", force: :cascade do |t|
    t.date "cal_date", comment: "活動日期"
    t.integer "act_id"
    t.string "act_name", limit: 50, comment: "活動名稱"
    t.integer "total_user", comment: "總抽獎人數"
    t.integer "total_lucky_time", default: 0, null: false, comment: "總抽獎次數"
    t.datetime "db_insert_time", default: -> { "current_timestamp()" }, null: false, comment: "系統建立時間 utc+0"
    t.datetime "db_update_time", default: -> { "current_timestamp()" }, null: false, comment: "系統更新時間 utc+0"
    t.index ["act_id"], name: "act_id", unique: true
    t.index ["cal_date"], name: "idx_cal_date"
    t.index ["db_update_time"], name: "idx_db_update_time"
  end

  create_table "lang_user_history_live_story", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.integer "pfid", comment: "用戶編號"
    t.integer "year", default: 2019, comment: "年度"
    t.integer "view_anchors", comment: "看過多少主播"
    t.integer "midnight_days", comment: "多少天午夜觀看"
    t.date "special_date", comment: "特別的一天10萬浪花"
    t.string "likes_anchor", limit: 200, comment: "喜愛的主播"
    t.string "forget_anchors", limit: 200, comment: "前九個月看，近三個月沒看"
    t.string "helped_anchors", limit: 200, comment: "幫助過得主播"
    t.float "total_hours", comment: "年度在線時長"
    t.integer "live_days", default: 0, null: false, comment: "註冊距2019-12-31多少天"
    t.datetime "db_insert_time", default: -> { "current_timestamp()" }, null: false
    t.datetime "db_update_time", default: -> { "current_timestamp()" }, null: false
    t.integer "first_view_anchor", comment: "第一個觀看主播"
    t.integer "follow_anchors_all", comment: "追蹤過主播數"
    t.datetime "latest_date", comment: "最晚日子"
    t.datetime "earliest_date", comment: "最早日子"
    t.integer "first_follow_anchor", comment: "第一個關注主播"
    t.datetime "first_follow_date", comment: "第一個關注時間"
    t.bigint "total_balance", comment: "總消費浪花"
    t.float "ranks_percentile", comment: "百分比"
    t.index ["pfid", "year"], name: "uni_key", unique: true
  end

  create_table "lang_user_history_tops", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", comment: "年度用戶送禮TOP數據表", force: :cascade do |t|
    t.integer "t_pfid", comment: "主播編號"
    t.integer "pfid", comment: "用戶編號"
    t.integer "ranks", comment: "名次"
    t.integer "values", comment: "浪花數"
    t.datetime "db_insert_time", default: -> { "current_timestamp()" }, null: false
    t.datetime "db_update_time", default: -> { "current_timestamp()" }, null: false
    t.index ["pfid", "ranks"], name: "pfid", unique: true
  end

  create_table "lang_user_history_tops_10", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", comment: "年度用戶喜愛TOP數據表", force: :cascade do |t|
    t.integer "t_pfid", comment: "主播號"
    t.integer "pfid", comment: "用戶編號"
    t.integer "ranks", comment: "排名"
    t.float "val", comment: "觀看時長（小時）"
    t.datetime "db_insert_time", default: -> { "current_timestamp()" }, null: false
    t.datetime "db_update_time", default: -> { "current_timestamp()" }, null: false
    t.index ["pfid", "ranks"], name: "pfid", unique: true
  end

  create_table "lang_user_profile", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", comment: "用戶基本訊息", force: :cascade do |t|
    t.integer "pfid", comment: "主播編號"
    t.boolean "sex_judged", default: false, null: false, comment: "判定性別:0-未判定 1-男 2-女"
    t.datetime "last_ent_time", comment: "最後進房時間"
    t.integer "ent_anchor", comment: "最後進房主播"
    t.integer "lastday_view_time", default: 0, null: false, comment: "最近一天觀看時長"
    t.integer "lastweek_view_time", default: 0, null: false, comment: "最近七日觀看時長"
    t.boolean "lastweek_view_day", default: false, null: false, comment: "最近七日觀看天數"
    t.datetime "last_live_time", comment: "最後開播時間"
    t.datetime "last_dynamic_time", comment: "最後發佈動態時間"
    t.integer "dynamic_cts", default: 0, null: false, comment: "發佈動態總數"
    t.integer "msg_cts", default: 0, null: false, comment: "最近七日私信量"
    t.integer "msg_users", default: 0, null: false, comment: "最近七日私信人數"
    t.datetime "last_msg_time", comment: "最後私信時間"
    t.datetime "last_task_gold_time", comment: "最後任務兌換浪花時間"
    t.integer "total_task_gold", default: 0, null: false, comment: "任務兌換浪花總數"
    t.integer "last_task_gold", default: 0, null: false, comment: "最後任務兌換浪花數量"
    t.datetime "last_task_cash_time", comment: "最後任務提現時間"
    t.integer "total_task_cash", default: 0, null: false, comment: "任務提領總金額"
    t.integer "last_task_cash", default: 0, null: false, comment: "最後任務提領金額"
    t.datetime "last_consume_time", comment: "最後送禮時間"
    t.integer "consume_anchor", comment: "最後送禮主播"
    t.datetime "last_noble_time", comment: "貴族最後購買時間"
    t.boolean "noble_id", default: false, null: false, comment: "1~7(騎士、勛爵、子爵、伯爵、侯爵、公爵、國王) 0:無貴族"
    t.integer "fans_number", default: 0, null: false, comment: "有效未過期粉絲團數"
    t.bigint "total_gold", default: 0, null: false, comment: "歷史消耗浪花數"
    t.datetime "db_insert_time", default: -> { "current_timestamp()" }, null: false, comment: "系統建立時間"
    t.datetime "db_update_time", default: -> { "current_timestamp()" }, null: false, comment: "系統更新時間"
    t.index ["db_update_time"], name: "idx_db_update_time"
    t.index ["last_consume_time"], name: "idx_last_consume_time"
    t.index ["last_ent_time"], name: "idx_last_ent_time"
    t.index ["pfid"], name: "uni_key", unique: true
  end

  create_table "lang_user_profile_consume", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", comment: "用戶基本訊息消費相關", force: :cascade do |t|
    t.integer "pfid", comment: "用戶編號"
    t.integer "lastday_total_cosume", default: 0, comment: "最近一天總消耗浪花"
    t.integer "lastday_lucky_consume", default: 0, comment: "最近一天爆擊消耗浪花"
    t.integer "lastday_lucky_return", default: 0, comment: "最近一天爆擊返還浪花"
    t.integer "lastday_bt_consume", default: 0, comment: "最近一天拼團消耗浪花"
    t.integer "lastday_bt_return", default: 0, comment: "最近一天拼團返還浪花"
    t.integer "thismon_total_cosume", default: 0, comment: "當月總消耗浪花"
    t.integer "thismon_lucky_consume", default: 0, comment: "當月爆擊消耗浪花"
    t.integer "thismon_lucky_return", default: 0, comment: "當月爆擊返還浪花"
    t.integer "thismon_bt_consume", default: 0, comment: "當月拼團消耗浪花"
    t.integer "thismon_bt_return", default: 0, comment: "當月拼團返還浪花"
    t.integer "lastmon_total_cosume", default: 0, comment: "上個月總消耗浪花"
    t.integer "lastmon_lucky_consume", default: 0, comment: "上個月爆擊消耗浪花"
    t.integer "lastmon_lucky_return", default: 0, comment: "上個月爆擊返還浪花"
    t.integer "lastmon_bt_consume", default: 0, comment: "上個月拼團消耗浪花"
    t.integer "lastmon_bt_return", default: 0, comment: "上個月拼團返還浪花"
    t.integer "last2mon_total_cosume", default: 0, comment: "上兩個月總消耗浪花"
    t.integer "last2mon_lucky_consume", default: 0, comment: "上兩個月爆擊消耗浪花"
    t.integer "last2mon_lucky_return", default: 0, comment: "上兩個月爆擊返還浪花"
    t.integer "last2mon_bt_consume", default: 0, comment: "上兩個月拼團消耗浪花"
    t.integer "last2mon_bt_return", default: 0, comment: "上兩個月拼團返還浪花"
    t.datetime "last_update_time", comment: "數據最後參考時間"
    t.datetime "db_insert_time", default: -> { "current_timestamp()" }, null: false, comment: "系統建立時間"
    t.datetime "db_update_time", default: -> { "current_timestamp()" }, null: false, comment: "系統更新時間"
    t.index ["db_update_time"], name: "idx_db_update_time"
    t.index ["last_update_time"], name: "idx_last_update_time"
    t.index ["pfid"], name: "uni_key", unique: true
  end

  create_table "lang_user_profile_topn", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", comment: "用戶基本訊息topn", force: :cascade do |t|
    t.integer "pfid", comment: "用戶編號"
    t.integer "key_id", limit: 1, comment: "數據欄位定義代碼"
    t.integer "rank", limit: 1, comment: "topn"
    t.string "value", limit: 30
    t.string "value2", limit: 30, default: ""
    t.datetime "db_insert_time", default: -> { "current_timestamp()" }, null: false, comment: "系統建立時間"
    t.datetime "db_update_time", default: -> { "current_timestamp()" }, null: false, comment: "系統更新時間"
    t.index ["db_update_time"], name: "idx_db_update_time"
    t.index ["pfid", "key_id", "rank"], name: "uni_key", unique: true
  end

  create_table "lang_user_profile_topn_mapping", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", comment: "用戶基本訊息topn_mapping表", force: :cascade do |t|
    t.integer "key_id", limit: 1, comment: "數據欄位代碼"
    t.string "key_name", comment: "欄位定義"
    t.datetime "last_update_time", comment: "數據最後更新時間"
    t.datetime "db_insert_time", default: -> { "current_timestamp()" }, null: false, comment: "系統建立時間"
    t.datetime "db_update_time", default: -> { "current_timestamp()" }, null: false, comment: "系統更新時間"
    t.index ["db_update_time"], name: "idx_db_update_time"
    t.index ["key_id"], name: "uni_key", unique: true
  end

  create_table "lang_vip_report_weekly", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", comment: "VIP客服充值KPI日報", force: :cascade do |t|
    t.date "cal_date", comment: "日期"
    t.decimal "level1_money", precision: 18, scale: 3, default: "0.0", null: false, comment: "單筆1萬以上充值"
    t.integer "level1_user", default: 0, comment: "單筆1萬以上人數"
    t.decimal "level2_money", precision: 18, scale: 3, default: "0.0", null: false, comment: "單筆5萬以上充值"
    t.integer "level2_user", default: 0, comment: "單筆5萬以上人數"
    t.datetime "db_insert_time", default: -> { "current_timestamp()" }, null: false
    t.datetime "db_update_time", default: -> { "current_timestamp()" }, null: false
    t.index ["cal_date"], name: "pfid", unique: true
  end

  create_table "lang_weekly_retention", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.datetime "reg_time"
    t.integer "diff_week"
    t.integer "val"
    t.datetime "db_insert_time", default: -> { "current_timestamp()" }, null: false
    t.datetime "db_update_time", default: -> { "current_timestamp()" }, null: false
    t.index ["reg_time", "diff_week"], name: "uni_key", unique: true
  end

  create_table "live_rooms", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.datetime "date", null: false, comment: "日期。主播關播日期。"
    t.integer "pfid", null: false, comment: "用戶浪代號。", unsigned: true
    t.string "nickname", limit: 190, collation: "utf8mb4_unicode_ci", comment: "用戶暱稱。主播。"
    t.integer "live_no", limit: 1, null: false, comment: "主播第幾次有效開播。"
    t.datetime "start_time", null: false, comment: "主播開播時間。"
    t.datetime "end_time", null: false, comment: "主播關播時間。"
    t.integer "max_heat", null: false, comment: "直播間在開播期間的最大熱度。", unsigned: true
    t.integer "diamond", null: false, comment: "主播在該次直播間的鑽石總收入。", unsigned: true
    t.integer "view_times", limit: 2, null: false, comment: "直播間被觀看次數（包含回放被觀看）。", unsigned: true
    t.integer "uniq_user_view_times", limit: 2, null: false, comment: "直播間在開播期間的觀看人數（去重）。", unsigned: true
    t.string "app_version", limit: 10, null: false, comment: "主播在開播時，所使用「浪Live」的版本號。"
    t.string "device_model", limit: 32, null: false, comment: "主播在開播時，所使用的手機模型。"
    t.string "device_platform", limit: 10, null: false, comment: "主播在開播時，所使用手機的軟體系統。Android 或 IOS 。"
    t.string "device_platform_version", limit: 9, null: false, comment: "主播在開播時，所使用手機的軟體系統版本。"
    t.datetime "db_create_time", default: -> { "current_timestamp()" }, null: false, comment: "資料建立時間。時區：UTC±00。"
    t.datetime "db_update_time", default: -> { "current_timestamp()" }, null: false, comment: "資料更新時間。時區：UTC±00。"
    t.index ["date", "pfid", "live_no"], name: "uni_date_pfid_live_no", unique: true
  end

  create_table "live_time_intervals", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.datetime "date", null: false, comment: "結算時間。"
    t.integer "duration", limit: 2, null: false, comment: "時間範圍。單位分鐘。", unsigned: true
    t.integer "login_user_count", limit: 2, null: false, comment: "用戶在當日時段，首次登入的人數。", unsigned: true
    t.integer "entering_count", limit: 2, null: false, comment: "用戶在當日時段，首次進房的人數。", unsigned: true
    t.integer "create_count", limit: 2, null: false, comment: "主播在當日時段，有效開播的開播次數。", unsigned: true
    t.integer "close_count", limit: 2, null: false, comment: "主播在當日時段，有效開播的關播次數。", unsigned: true
    t.integer "max_anchor_number", limit: 2, null: false, comment: "主播在當日時段，同時直播的最大主播數。", unsigned: true
    t.timestamp "updated_at", default: -> { "current_timestamp()" }, null: false
    t.timestamp "created_at", default: -> { "current_timestamp()" }, null: false
    t.index ["date", "duration"], name: "uni_date_duration", unique: true
  end

  create_table "lucky_report_daily", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", comment: "轉盤日報1", force: :cascade do |t|
    t.date "cal_date", null: false, comment: "開播日期"
    t.integer "typ", default: 1, null: false, comment: "1:幸運,2:黃金,3:日抽"
    t.integer "lottery_user", null: false, comment: "抽獎人數"
    t.integer "ones_user", null: false, comment: "抽1次人數"
    t.decimal "day_3_order", precision: 15, scale: 3, null: false, comment: "抽1次人數近3天儲值"
    t.decimal "day_7_order", precision: 15, scale: 3, null: false, comment: "抽1次人數近7天儲值"
    t.integer "ten_user", null: false, comment: "10連抽人數"
    t.decimal "ten_3_order", precision: 15, scale: 3, null: false, comment: "10連抽進三天儲值"
    t.decimal "ten_7_order", precision: 15, scale: 3, null: false, comment: "10連抽進七天儲值"
    t.integer "h_user", null: false, comment: "100連抽人數"
    t.decimal "h_3_order", precision: 15, scale: 3, null: false, comment: "100連抽進三天儲值"
    t.decimal "h_7_order", precision: 15, scale: 3, null: false, comment: "100連抽進七天儲值"
    t.float "keep_ratio", null: false, comment: "昨日第一次抽獎今日有抽留存"
    t.float "avg_gold", null: false, comment: "月均儲值"
    t.integer "today_first_users", default: 0, null: false, comment: "今日歷史第一次抽人數"
    t.integer "yest_first_users", default: 0, null: false, comment: "昨日歷史第一次抽人數"
    t.integer "yest_first_and_today_continue", default: 0, null: false, comment: "昨日首抽且今日有抽用戶數"
    t.timestamp "db_insert_time", default: -> { "current_timestamp()" }, null: false
    t.timestamp "db_update_time", default: -> { "current_timestamp()" }, null: false
    t.index ["db_update_time"], name: "idx_db_update_time"
    t.index ["typ", "cal_date"], name: "uni_key", unique: true
  end

  create_table "lucky_report_daily_2", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", comment: "轉盤日報2", force: :cascade do |t|
    t.date "cal_date", null: false, comment: "開播日期"
    t.integer "typ", default: 1, null: false, comment: "1:幸運,2:黃金,3:日抽"
    t.integer "level1_user", default: 0, null: false, comment: "vip等級1人數"
    t.integer "level2_user", default: 0, null: false, comment: "vip等級2人數"
    t.integer "level3_user", default: 0, null: false, comment: "vip等級3人數"
    t.integer "level4_user", default: 0, null: false, comment: "vip等級4人數"
    t.integer "level5_user", default: 0, null: false, comment: "vip等級5人數"
    t.integer "level6_user", default: 0, null: false, comment: "vip等級6人數"
    t.timestamp "db_insert_time", default: -> { "current_timestamp()" }, null: false
    t.timestamp "db_update_time", default: -> { "current_timestamp()" }, null: false
    t.index ["db_update_time"], name: "idx_db_update_time"
    t.index ["typ", "cal_date"], name: "uni_key", unique: true
  end

  create_table "max_pcu_logs", id: :integer, comment: "流水號", unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", comment: "每個房間最大pcu紀錄表", force: :cascade do |t|
    t.integer "pfid", comment: "主播編號"
    t.string "live_id", limit: 18, comment: "房間編號"
    t.integer "max_pcu", comment: "最大PCU"
    t.timestamp "pcu_reg_time", default: -> { "current_timestamp()" }, null: false, comment: "最大PCU發生時間點（擇一）"
    t.integer "uv", default: -1, null: false, comment: "UV"
    t.integer "pv", default: -1, null: false, comment: "PV"
    t.integer "commercial_duration", comment: "總工商時間"
    t.integer "reg_pcu", default: 0, null: false, comment: "reg_pcu"
    t.integer "n_max_pcu", default: 0, null: false, comment: "回推估算最大pcu"
    t.datetime "n_max_pcu_time", comment: "回推估算最大pcu發生時間"
    t.integer "n_max_reg_pcu", default: 0, null: false, comment: "回推估算最大註冊用戶pcu(最高同時在線註冊用戶數)"
    t.datetime "n_max_reg_pcu_time", comment: "回推估算最大註冊用戶pcu發生時間"
    t.integer "fix_uv", default: 0, null: false, comment: "修正uv - 修正重複IP等等"
    t.integer "o_m_user", default: 0, null: false, comment: "一分鐘觀看人數"
    t.decimal "v_duration", precision: 10, scale: 2, default: "0.0", null: false, comment: "總觀看時長(分)"
    t.integer "n_u_follow", default: 0, null: false, comment: "新用戶追蹤數"
    t.timestamp "created_at", default: -> { "current_timestamp()" }, null: false, comment: "系統建立時間"
    t.timestamp "updated_at", default: -> { "current_timestamp()" }, null: false, comment: "系統更新時間"
    t.index ["live_id"], name: "idx_live_id"
    t.index ["pcu_reg_time"], name: "idx_pcu_reg_time"
    t.index ["pfid", "live_id"], name: "uni_pfid_live_id", unique: true
    t.index ["updated_at"], name: "idx_updated_at"
  end

  create_table "monitor_simulation_lists", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "pfid", unsigned: true
    t.datetime "reg_date"
    t.string "ent_ip", limit: 15
    t.timestamp "created_at", default: -> { "current_timestamp()" }
    t.timestamp "updated_at", default: -> { "current_timestamp()" }
    t.index ["pfid", "reg_date"], name: "uni_pfid_reg_date", unique: true
  end

  create_table "monthly_anchor_diamond_revenue", id: :integer, comment: "自增主鍵。", unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", comment: "簽約主播鑽石收益月報。作者：Jerry<jerry.chen@langlive.com>。", force: :cascade do |t|
    t.integer "pfid", null: false, comment: "簽約主播浪ID。", unsigned: true
    t.string "nickname", limit: 190, collation: "utf8mb4_unicode_ci", comment: "主播暱稱"
    t.string "agency_company", limit: 45, null: false, comment: "經紀公司"
    t.integer "guarantee", comment: "保底鑽石數", unsigned: true
    t.integer "salary_type", limit: 1, default: 1, comment: "薪资制度(临时字段),0:旧制度,1:新制度,2:月薪制,3:保底制,5=特殊保底,8=扶持金制(CN),10=一般瞬升,11=瞬升保底,12=新制個人/經紀30,13=新制個人/經紀60,14=音頻瞬升降,15=音頻保底.", unsigned: true
    t.integer "max_hour", null: false, comment: "最大開播時數", unsigned: true
    t.datetime "start_time_contract", comment: "合約起始時間。時區：UTC±08。"
    t.datetime "end_time_contract", comment: "合約結束時間。時區：UTC±08。"
    t.datetime "start_time_cal", comment: "結算起始時間。時區：UTC±08。"
    t.datetime "end_time_cal", comment: "結算結束時間。時區：UTC±08。"
    t.integer "cal_year_month", comment: "統計年月份。時區：UTC±08。", unsigned: true
    t.integer "diamond_left", null: false, comment: "錢包數"
    t.integer "diamond_freeze", null: false, comment: "凍結鑽石數"
    t.datetime "lastupdtime_left_freeze", comment: "錢包數與鑽石凍結數最後更新時間"
    t.integer "diamond_income", null: false, comment: "收益", unsigned: true
    t.integer "diamond_withdraw", null: false, comment: "提領鑽石數", unsigned: true
    t.integer "diamond_exchange", null: false, comment: "兌換浪花", unsigned: true
    t.integer "activity_income", null: false, comment: "活動收益", unsigned: true
    t.integer "fans_group_income", null: false, comment: "粉絲團收益", unsigned: true
    t.integer "noble_income", null: false, comment: "貴族收益", unsigned: true
    t.integer "other_income", null: false, comment: "其他收益", unsigned: true
    t.integer "diamond_balance", null: false, comment: "結算"
    t.integer "cash", null: false, comment: "請款金額", unsigned: true
    t.integer "diamond_deduction", null: false, comment: "實際扣除鑽石數", unsigned: true
    t.datetime "db_create_time", default: -> { "current_timestamp()" }, null: false, comment: "資料建立時間。時區：UTC±00。"
    t.datetime "db_update_time", default: -> { "current_timestamp()" }, null: false, comment: "資料更新時間。時區：UTC±00。"
    t.index ["cal_year_month"], name: "idx_cal_year_month"
    t.index ["db_update_time"], name: "idx_db_update_time"
    t.index ["end_time_cal"], name: "idx_end_time_cal"
    t.index ["end_time_contract"], name: "idx_end_time_contract"
    t.index ["pfid", "cal_year_month"], name: "uni_pfid_calym", unique: true
    t.index ["start_time_cal"], name: "idx_start_time_cal"
    t.index ["start_time_contract"], name: "idx_start_time_contract"
  end

  create_table "monthly_anchor_salary", primary_key: "auto_id", id: :integer, comment: "自增主鍵ID。", unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", comment: "數據中心計算主播月升降時薪表", force: :cascade do |t|
    t.integer "pfid", default: 0, null: false, comment: "用戶浪Live號。", unsigned: true
    t.integer "t_month", default: 0, null: false, comment: "月份。時區：UTC+08。", unsigned: true
    t.decimal "hour_salary", precision: 10, scale: 2, default: "0.0", null: false, comment: "月計算升降後時薪"
    t.string "currency", limit: 20, default: "TWD", null: false, comment: "货币单位"
    t.datetime "db_insert_time", default: -> { "current_timestamp()" }, null: false, comment: "資料建立時間。時區：UTC±00。"
    t.datetime "db_update_time", default: -> { "current_timestamp()" }, null: false, comment: "資料更新時間。時區：UTC±00。"
    t.index ["db_update_time"], name: "idx_update"
    t.index ["t_month", "pfid"], name: "uni_key", unique: true
  end

  create_table "newregister_retention_order_bycity", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", comment: "新註冊用戶留存付費分析by渠道", force: :cascade do |t|
    t.datetime "reg_time", comment: "註冊時間"
    t.string "country_code", limit: 2, comment: "國家"
    t.string "city", limit: 30, comment: "城市"
    t.integer "num_people", comment: "媒體註冊數"
    t.integer "num_people_30", comment: "30天內付費人數"
    t.integer "cash_30", comment: "30天內付費金額"
    t.integer "num_people_60", comment: "60天內付費人數"
    t.integer "cash_60", comment: "60天內付費金額"
    t.integer "retention_0", comment: "當日行為人數"
    t.integer "retention_1", comment: "次留存"
    t.integer "retention_3", comment: "3留存"
    t.integer "retention_7", comment: "7留存"
    t.integer "retention_14", comment: "14留存"
    t.integer "retention_30", comment: "30留存"
    t.datetime "db_insert_time", default: -> { "current_timestamp()" }, null: false
    t.datetime "db_update_time", default: -> { "current_timestamp()" }, null: false
    t.index ["db_update_time"], name: "idx_db_update_time"
    t.index ["reg_time", "country_code", "city"], name: "uni_key", unique: true
  end

  create_table "newregister_retention_order_bypartner", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", comment: "新註冊用戶留存付費分析by渠道", force: :cascade do |t|
    t.datetime "reg_time", comment: "註冊時間"
    t.string "partner", limit: 30, comment: "媒體渠道"
    t.integer "num_people", comment: "媒體註冊數"
    t.integer "num_people_30", comment: "30天內付費人數"
    t.integer "cash_30", comment: "30天內付費金額"
    t.integer "num_people_60", comment: "60天內付費人數"
    t.integer "cash_60", comment: "60天內付費金額"
    t.integer "retention_0", comment: "當日行為人數"
    t.integer "retention_1", comment: "次留存"
    t.integer "retention_3", comment: "3留存"
    t.integer "retention_7", comment: "7留存"
    t.integer "retention_14", comment: "14留存"
    t.integer "retention_30", comment: "30留存"
    t.decimal "daily_online_time", precision: 10, scale: 2, comment: "日在線時長"
    t.integer "daily_online_count", comment: "日在線人數"
    t.decimal "weekly_online_time", precision: 10, scale: 2, comment: "週在線時長"
    t.integer "weekly_online_count", comment: "週在線人數"
    t.decimal "monthly_online_time", precision: 10, scale: 2, comment: "月在線時長"
    t.integer "monthly_online_count", comment: "月在線人數"
    t.datetime "db_insert_time", default: -> { "current_timestamp()" }, null: false
    t.datetime "db_update_time", default: -> { "current_timestamp()" }, null: false
    t.index ["db_update_time"], name: "idx_db_update_time"
    t.index ["reg_time", "partner"], name: "uni_key", unique: true
  end

  create_table "noble_daily", id: :integer, comment: "自增主鍵ID。", unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", comment: "貴族日報統計表", force: :cascade do |t|
    t.date "cal_date", null: false, comment: "日期。時區：UTC+08。"
    t.integer "noble_id", null: false, comment: "貴族階級id"
    t.integer "members", null: false, comment: "用戶數", unsigned: true
    t.datetime "db_insert_time", default: -> { "current_timestamp()" }, null: false, comment: "資料建立時間。時區：UTC±00。"
    t.datetime "db_update_time", default: -> { "current_timestamp()" }, null: false, comment: "資料更新時間。時區：UTC±00。"
    t.index ["cal_date"], name: "cal_date"
    t.index ["noble_id", "cal_date"], name: "uni_key", unique: true
  end

  create_table "order_history_all", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", comment: "用戶累積儲值表（換算台幣）", force: :cascade do |t|
    t.integer "pfid"
    t.integer "last_month"
    t.decimal "total_money", precision: 14, scale: 3
    t.datetime "db_insert_time", default: -> { "current_timestamp()" }, null: false
    t.datetime "db_update_time", default: -> { "current_timestamp()" }, null: false
    t.index ["last_month"], name: "idx_last_month"
    t.index ["pfid"], name: "idx_pfid", unique: true
  end

  create_table "order_history_all_new", primary_key: "pfid", id: :integer, default: 0, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", comment: "用戶累積儲值表（日暫存表）", force: :cascade do |t|
    t.integer "last_month"
    t.decimal "total_money", precision: 14, scale: 3
    t.datetime "db_insert_time", default: -> { "current_timestamp()" }, null: false
    t.datetime "db_update_time", default: -> { "current_timestamp()" }, null: false
  end

  create_table "permissions", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "role", limit: 15, null: false
    t.integer "role_id", limit: 2, null: false, unsigned: true
    t.integer "key_id", limit: 1, null: false, unsigned: true
    t.timestamp "updatedAt", default: -> { "current_timestamp()" }, null: false
    t.timestamp "createdAt", default: -> { "current_timestamp()" }, null: false
    t.index ["key_id"], name: "fk_statistic_permission"
    t.index ["role_id"], name: "idx_role_id"
  end

  create_table "pgc_newregister_follower_order", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", comment: "pgc新註冊用戶追蹤付費成效日表", force: :cascade do |t|
    t.integer "pfid", null: false, comment: "pgc編號"
    t.date "follow_date", null: false, comment: "追蹤日期"
    t.integer "follow_number", limit: 2, null: false, comment: "追蹤人數"
    t.integer "newregister_follow", limit: 2, null: false, comment: "追蹤人數(兩天內註冊)"
    t.integer "order_in7", null: false, comment: "註冊七日內總花費"
    t.integer "number_in7", limit: 2, null: false, comment: "註冊七日內付費人數"
    t.float "conversion_rate_in7", null: false, comment: "七日付費轉化率"
    t.float "ARPU_in7", null: false, comment: "七日ARPU"
    t.float "ARPPU_in7", null: false, comment: "七日ARPPU"
    t.integer "order_in30", null: false, comment: "註冊30日內總花費"
    t.integer "number_in30", limit: 2, null: false, comment: "註冊30日內付費人數"
    t.float "conversion_rate_in30", null: false, comment: "30日付費轉化率"
    t.float "ARPU_in30", null: false, comment: "30日ARPU"
    t.float "ARPPU_in30", null: false, comment: "30日ARPPU"
    t.integer "number_in60", limit: 2, null: false, comment: "註冊60日內付費人數"
    t.integer "order_in60", null: false, comment: "註冊60日內總花費"
    t.integer "ltv_cash", comment: "ltv180天付費金額"
    t.integer "ltv_people", comment: "ltv180天付費人數"
    t.timestamp "db_insert_time", default: -> { "current_timestamp()" }, null: false
    t.timestamp "db_update_time", default: -> { "current_timestamp()" }, null: false
    t.index ["db_update_time"], name: "idx_db_update_time"
    t.index ["follow_date"], name: "idx_follow_date"
    t.index ["pfid", "follow_date"], name: "uni_key", unique: true
  end

  create_table "pgc_performance_fans", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", comment: "pgc粉絲收益開播表", force: :cascade do |t|
    t.integer "pfid", null: false, comment: "pgc編號"
    t.date "live_date", null: false, comment: "開播日期"
    t.integer "live_times", limit: 2, null: false, comment: "開播次數"
    t.integer "live_min", limit: 2, null: false, comment: "總開播時長(分鐘)"
    t.integer "consume_number", null: false, comment: "觀眾送禮人數"
    t.integer "diamond", null: false, comment: "主播收到鑽石數(觀眾)"
    t.integer "gold", null: false, comment: "觀眾送出浪花數"
    t.integer "consume_number_fans", null: false, comment: "粉絲送禮人數"
    t.integer "diamond_fans", null: false, comment: "主播收到鑽石數(粉絲)"
    t.integer "gold_fans", null: false, comment: "粉絲送出浪花數"
    t.float "fans_watch_rate", null: false, comment: "粉絲觀看率"
    t.timestamp "db_insert_time", default: -> { "current_timestamp()" }, null: false
    t.timestamp "db_update_time", default: -> { "current_timestamp()" }, null: false
    t.index ["db_update_time"], name: "idx_db_update_time"
    t.index ["pfid", "live_date"], name: "uni_key", unique: true
  end

  create_table "pkchicken_anchor_ratio", primary_key: "pfid", id: :integer, default: 0, comment: "主播編號", unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", comment: "pk吃雞賽主播小時收益比值", force: :cascade do |t|
    t.float "ratio", default: 0.0, null: false, comment: "無用"
    t.integer "total_mins", limit: 2, default: 0, null: false, comment: "無用"
    t.integer "total_diamond", default: 0, null: false, comment: "近十五天鑽石收入"
    t.datetime "db_insert_time", default: -> { "current_timestamp()" }, null: false, comment: "資料建立時間。時區：UTC±00"
    t.datetime "db_update_time", default: -> { "current_timestamp()" }, null: false, comment: "資料更新時間。時區：UTC±00"
    t.index ["db_update_time"], name: "idx_db_update_time"
  end

  create_table "pkchicken_growth_qualify", primary_key: "pfid", id: :integer, default: 0, comment: "主播編號", unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", comment: "pk吃雞發育賽資格", force: :cascade do |t|
    t.integer "deleted", limit: 1, default: 0, null: false, comment: "是否刪除", unsigned: true
    t.integer "upstandard_mins", limit: 2, default: 0, null: false, comment: "達標時數"
    t.integer "upstandard_diamonds", default: 0, null: false, comment: "達標鑽石數"
    t.datetime "db_insert_time", default: -> { "current_timestamp()" }, null: false, comment: "資料建立時間。時區：UTC±00"
    t.datetime "db_update_time", default: -> { "current_timestamp()" }, null: false, comment: "資料更新時間。時區：UTC±00"
    t.index ["db_update_time"], name: "idx_db_update_time"
    t.index ["deleted"], name: "idx_deleted"
  end

  create_table "platform_anchor_rankings", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", comment: "每日主播榜", force: :cascade do |t|
    t.date "report_date", null: false, comment: "結算日期"
    t.integer "rank", limit: 1, null: false, comment: "排名", unsigned: true
    t.integer "pfid", null: false, comment: "用戶浪代號。", unsigned: true
    t.string "nickname", limit: 190, collation: "utf8mb4_unicode_ci", comment: "暱稱"
    t.integer "income", default: 0, null: false, comment: "用戶送禮浪花"
    t.integer "normal_income", default: 0, null: false, comment: "一般送禮浪花"
    t.integer "lucky_income", default: 0, null: false, comment: "爆擊禮物浪花"
    t.integer "diamond", default: 0, null: false, comment: "主播收鑽"
    t.timestamp "updated_at", default: -> { "current_timestamp()" }, null: false
    t.timestamp "created_at", default: -> { "current_timestamp()" }, null: false
    t.index ["report_date", "rank"], name: "uni_platform_anchor_rankings", unique: true
    t.index ["updated_at"], name: "idx_updated_at"
  end

  create_table "platform_daily_statistics", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", comment: "平台日報數據(單欄位)", force: :cascade do |t|
    t.date "report_date", comment: "結算日期"
    t.integer "key_id", null: false, comment: "數據欄位定義代碼"
    t.decimal "value", precision: 13, scale: 3
    t.timestamp "updated_at", default: -> { "current_timestamp()" }, null: false
    t.timestamp "created_at", default: -> { "current_timestamp()" }, null: false
    t.index ["key_id", "report_date"], name: "idx_platform_statistics", unique: true
  end

  create_table "platform_rich_rankings", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", comment: "每日富豪榜", force: :cascade do |t|
    t.date "report_date", comment: "結算日期"
    t.integer "rank", limit: 1, null: false, comment: "排名", unsigned: true
    t.integer "pfid", null: false, comment: "用戶浪代號。", unsigned: true
    t.string "nickname", limit: 190, collation: "utf8mb4_unicode_ci", comment: "暱稱"
    t.integer "expend", null: false, comment: "花費", unsigned: true
    t.integer "normal_expend", default: 0, null: false, comment: "一般送禮"
    t.integer "lucky_expend", default: 0, null: false, comment: "爆擊送禮"
    t.integer "back_balance", default: 0, null: false, comment: "爆擊返還"
    t.timestamp "updated_at", default: -> { "current_timestamp()" }, null: false
    t.timestamp "created_at", default: -> { "current_timestamp()" }, null: false
    t.index ["report_date", "rank"], name: "uni_ platform_anchor_rankings", unique: true
    t.index ["updated_at"], name: "idx_updated_at"
  end

  create_table "platform_statistics_keys", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "key_id", limit: 1, null: false, comment: "數據欄位代碼", unsigned: true
    t.string "key_name", null: false, comment: "欄位定義"
    t.integer "group_id", limit: 1, null: false, comment: "數據分類", unsigned: true
    t.integer "order", limit: 1, null: false, comment: "欄位排序", unsigned: true
    t.integer "category_id", limit: 2, default: 1, null: false, comment: "分類頁面", unsigned: true
    t.index ["key_id"], name: "idx_platform_statistics_keys"
  end

  create_table "platform_statistics_keys_mapping", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", comment: "浪日報欄位對應", force: :cascade do |t|
    t.integer "key_id", null: false, comment: "數據欄位代碼"
    t.string "key_name", null: false, comment: "欄位定義"
    t.integer "group_id", limit: 1, null: false, comment: "數據分類", unsigned: true
    t.integer "order", limit: 1, null: false, comment: "欄位排序", unsigned: true
    t.integer "category_id", limit: 2, default: 1, null: false, comment: "分類頁面", unsigned: true
    t.timestamp "created_at", default: -> { "current_timestamp()" }, null: false
    t.timestamp "updated_at", default: -> { "current_timestamp()" }, null: false
    t.index ["group_id"], name: "idx_group_id"
    t.index ["key_id"], name: "idx_platform_statistics_keys"
  end

  create_table "platform_subscribe", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", comment: "浪日報訂閱表", force: :cascade do |t|
    t.string "email", limit: 200, null: false, comment: "address"
    t.integer "groups", comment: "receive_groups"
    t.integer "deleted", limit: 1, default: 0, null: false, comment: "是否訂閱"
    t.datetime "db_insert_time", default: -> { "current_timestamp()" }, null: false
    t.datetime "db_update_time", default: -> { "current_timestamp()" }, null: false
    t.index ["db_update_time"], name: "db_update_time"
    t.index ["groups", "email"], name: "uni_key", unique: true
  end

  create_table "product_infos", id: :bigint, comment: "自增主鍵。", unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", comment: "[浪] 產品報表數據。作者：Allen <allen.chang@langlive.com>。", force: :cascade do |t|
    t.datetime "date", null: false, comment: "日期。"
    t.string "category", limit: 50, comment: "報表名稱。"
    t.string "item_name", limit: 30, comment: "項目名稱。"
    t.decimal "value", precision: 13, scale: 2, default: "0.0", comment: "項目價值。"
    t.datetime "db_create_time", default: -> { "current_timestamp()" }, null: false, comment: "資料建立時間。時區：UTC±00。"
    t.datetime "db_update_time", default: -> { "current_timestamp()" }, null: false, comment: "資料更新時間。時區：UTC±00。"
    t.index ["category", "item_name", "date"], name: "uni_category_itemName_date", unique: true
    t.index ["date"], name: "idx_date"
    t.index ["db_update_time"], name: "idx_dbUpdateTime"
  end

  create_table "realtime_anchor_recent_days", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "pfid"
    t.integer "diamond"
    t.timestamp "created_at", default: -> { "current_timestamp()" }, comment: "系統建立時間"
    t.timestamp "updated_at", default: -> { "current_timestamp()" }, comment: "系統更新時間"
    t.index ["pfid"], name: "pfid", unique: true
  end

  create_table "realtime_anchor_recent_hours", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "pfid"
    t.integer "diamond"
    t.timestamp "created_at", default: -> { "current_timestamp()" }, comment: "系統建立時間"
    t.timestamp "updated_at", default: -> { "current_timestamp()" }, comment: "系統更新時間"
    t.index ["pfid"], name: "pfid", unique: true
  end

  create_table "realtime_audience_recent_days", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "pfid"
    t.integer "diamond"
    t.timestamp "created_at", default: -> { "current_timestamp()" }, comment: "系統建立時間"
    t.timestamp "updated_at", default: -> { "current_timestamp()" }, comment: "系統更新時間"
    t.index ["pfid"], name: "pfid", unique: true
  end

  create_table "realtime_audience_recent_hours", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "pfid"
    t.integer "diamond"
    t.timestamp "created_at", default: -> { "current_timestamp()" }, comment: "系統建立時間"
    t.timestamp "updated_at", default: -> { "current_timestamp()" }, comment: "系統更新時間"
    t.index ["pfid"], name: "pfid", unique: true
  end

  create_table "recommendation_newsfeeds", primary_key: ["pfid", "recom_pfid"], options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "pfid", null: false, comment: "用戶浪代號。", unsigned: true
    t.integer "recom_pfid", null: false, comment: "推薦主播浪代號。", unsigned: true
    t.integer "rank", limit: 2, null: false, comment: "推薦主播名單的排序。", unsigned: true
    t.timestamp "created_at", default: -> { "current_timestamp()" }, null: false
    t.timestamp "updated_at", default: -> { "current_timestamp()" }, null: false
    t.index ["updated_at"], name: "idx_updated_at"
  end

  create_table "register_behavior", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", comment: "新用戶行為表", force: :cascade do |t|
    t.integer "pfid", comment: "用戶編號"
    t.integer "ent", limit: 1, comment: "進房"
    t.integer "pv", limit: 1, comment: "點tab"
    t.integer "svideo", limit: 1, comment: "短影"
    t.integer "small", limit: 1, comment: "小號"
    t.integer "sign", limit: 1, comment: "簽到"
    t.integer "platform", limit: 1, comment: "unknow=0, ios=1, andriod=2"
    t.integer "live_cts", default: 0, null: false, comment: "直播間數"
    t.integer "ret1", limit: 1, default: 0, null: false, comment: "次留"
    t.integer "ret3", limit: 1, default: 0, null: false, comment: "3留"
    t.integer "ret7", limit: 1, default: 0, null: false, comment: "7留"
    t.integer "ret14", limit: 1, default: 0, null: false, comment: "14留"
    t.integer "ret30", limit: 1, default: 0, null: false, comment: "30留"
    t.integer "cash_1", default: 0, null: false, comment: "充值-1d"
    t.integer "cash_2", default: 0, null: false, comment: "充值-2d"
    t.integer "cash_3", default: 0, null: false, comment: "充值-3d"
    t.integer "cash_7", default: 0, null: false, comment: "充值-7d"
    t.integer "cash_14", default: 0, null: false, comment: "充值-14d"
    t.integer "cash_30", default: 0, null: false, comment: "充值-30d"
    t.integer "cash_60", default: 0, null: false, comment: "充值30-60d"
    t.datetime "db_create_time", default: -> { "current_timestamp()" }, null: false
    t.datetime "db_update_time", default: -> { "current_timestamp()" }, null: false
    t.index ["db_update_time"], name: "idx_db_update_time"
    t.index ["pfid"], name: "idx_uni_key", unique: true
  end

  create_table "register_funnel", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", comment: "註冊轉換行為", force: :cascade do |t|
    t.date "cal_date", comment: "計算日期"
    t.string "dv", limit: 200, comment: "渠道"
    t.integer "num_reg", comment: "註冊人數"
    t.integer "num_ent", comment: "進房人數"
    t.integer "num_pv", comment: "點tab人數"
    t.integer "num_svideo", comment: "觀看短影人數"
    t.integer "num_small", comment: "有小號人數"
    t.integer "num_total", comment: "有行為人數"
    t.datetime "db_create_time", default: -> { "current_timestamp()" }, null: false
    t.datetime "db_update_time", default: -> { "current_timestamp()" }, null: false
    t.integer "android", comment: "未知且為安卓用戶"
    t.integer "ios", comment: "未知且為ios用戶"
    t.integer "unknow", comment: "未知用戶"
    t.index ["db_update_time"], name: "idx_db_update_time"
    t.index ["dv", "cal_date"], name: "idx_uni_key", unique: true
  end

  create_table "report_mail_services", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", comment: "[浪] 報表郵件權限總覽。作者：Allen<allen.chang@langlive.com>。", force: :cascade do |t|
    t.string "report_name", limit: 50, null: false, comment: "報表名稱。"
    t.string "frequency", limit: 15, null: false, comment: "報表週期。"
    t.string "mail_dept", limit: 30, null: false, comment: "郵件寄送部門或群體。"
    t.string "mail_form", limit: 15, null: false, comment: "郵件表格名稱。"
    t.string "mail_content", limit: 3000, null: false, comment: "郵件表格內容。"
    t.integer "status", limit: 1, null: false, comment: "最近一次發送狀態。0：失敗；1：成功。"
    t.integer "enable", limit: 1, default: 0, null: false, comment: "啟用狀態。0：關閉；1：啟用。", unsigned: true
    t.datetime "db_create_time", default: -> { "current_timestamp()" }, null: false, comment: "資料建立時間。時區：UTC±00。"
    t.datetime "db_update_time", default: -> { "current_timestamp()" }, null: false, comment: "資料更新時間。時區：UTC±00。"
    t.index ["db_update_time"], name: "idx_dbUpdateTime"
    t.index ["report_name", "mail_dept", "mail_form"], name: "uni_reportName_mailDept_mailForm", unique: true
  end

  create_table "rpt_daily_recommend_convert", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", comment: "lang短影進房推薦成效報告", force: :cascade do |t|
    t.date "cal_date", null: false, comment: "統計日期"
    t.integer "ent_times", comment: "進房人次"
    t.integer "ent_members", default: 0, null: false, comment: "進房人數"
    t.integer "ent_anchors", default: 0, null: false, comment: "進房主播數"
    t.integer "followed", limit: 2, default: 0, null: false, comment: "已追蹤用戶數"
    t.integer "new_follow", limit: 2, default: 0, null: false, comment: "當日追蹤用戶數"
    t.integer "non_followed", limit: 2, default: 0, null: false, comment: "為追蹤用戶數"
    t.integer "user_spend_balance", default: 0, null: false, comment: "消費浪花數"
    t.integer "user_spend_members", default: 0, null: false, comment: "消費浪花用戶數"
    t.datetime "db_insert_time", default: -> { "current_timestamp()" }, null: false
    t.datetime "db_update_time", default: -> { "current_timestamp()" }, null: false
    t.index ["cal_date"], name: "uni_key", unique: true
    t.index ["db_update_time"], name: "db_update_time"
  end

  create_table "rpt_fans_buyings", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", comment: "粉絲團購買", force: :cascade do |t|
    t.integer "t_pfid", comment: "主播編號", unsigned: true
    t.date "cal_date", comment: "計算日期"
    t.boolean "isfirst", comment: "第一次獲得粉絲團"
    t.integer "buying_counts", limit: 3, comment: "粉絲團人數", unsigned: true
    t.integer "buying_months", limit: 3, comment: "粉絲團購買月數", unsigned: true
    t.timestamp "created_at", default: -> { "current_timestamp()" }, comment: "系統建立日期"
    t.timestamp "updated_at", default: -> { "current_timestamp()" }, comment: "系統更新日期"
    t.index ["cal_date", "t_pfid"], name: "uni_cal_date_t_pfid", unique: true
    t.index ["isfirst"], name: "idx_isfirst"
  end

  create_table "rpt_fans_continues", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", comment: "粉絲團續買統計", force: :cascade do |t|
    t.date "cal_date", null: false, comment: "續買日期"
    t.integer "pfid", null: false, comment: "用戶編號", unsigned: true
    t.integer "t_pfid", null: false, comment: "主播編號", unsigned: true
    t.integer "continue_counts", limit: 3, comment: "累積購買總月數", unsigned: true
    t.timestamp "created_at", default: -> { "current_timestamp()" }, comment: "系統建立日期"
    t.timestamp "updated_at", default: -> { "current_timestamp()" }, comment: "系統更新日期"
    t.index ["cal_date", "t_pfid", "pfid"], name: "uni_cal_date_t_pfid_pfid"
  end

  create_table "rpt_fans_expireds", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", comment: "粉絲團過期統計", force: :cascade do |t|
    t.integer "t_pfid", null: false, comment: "主播編號", unsigned: true
    t.date "cal_date", null: false, comment: "到期日期"
    t.integer "pfid", comment: "用戶編號", unsigned: true
    t.timestamp "created_at", default: -> { "current_timestamp()" }, comment: "系統建立日期"
    t.timestamp "updated_at", default: -> { "current_timestamp()" }, comment: "系統更新日期"
    t.index ["cal_date", "t_pfid", "pfid"], name: "uni_cal_date_t_pfid_pfid"
  end

  create_table "rpt_user_buyings", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", comment: "粉絲團購買", force: :cascade do |t|
    t.integer "pfid", comment: "用戶編號", unsigned: true
    t.date "cal_date", comment: "計算日期"
    t.boolean "isfirst", comment: "第一次獲得粉絲團"
    t.integer "buying_counts", limit: 3, comment: "粉絲團數", unsigned: true
    t.integer "buying_months", limit: 3, comment: "購買月數", unsigned: true
    t.timestamp "created_at", default: -> { "current_timestamp()" }, comment: "系統建立日期"
    t.timestamp "updated_at", default: -> { "current_timestamp()" }, comment: "系統更新日期"
    t.index ["cal_date", "pfid"], name: "uni_cal_date_pfid", unique: true
    t.index ["isfirst"], name: "idx_isfirst"
  end

  create_table "rs_anchor_similar_faces", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", comment: "[浪] 熱門頁推薦系統：主播的相似臉排名。上海同步。後台調用。作者：Allen<allen.chang@langlive.com>。", force: :cascade do |t|
    t.integer "anchor_pfid", null: false, comment: "主播浪號。", unsigned: true
    t.integer "similarity_rank", limit: 2, null: false, comment: "相似排序。1：第1相似；2：第2相似⋯⋯依此類推。", unsigned: true
    t.integer "similar_face_pfid", null: false, comment: "相似臉的主播浪號。", unsigned: true
    t.datetime "create_time", default: -> { "current_timestamp()" }, null: false, comment: "資料建立時間。時區：UTC±00。"
    t.datetime "update_time", default: -> { "current_timestamp()" }, null: false, comment: "資料更新時間。時區：UTC±00。"
    t.decimal "distance", precision: 8, scale: 6, comment: "相似度距離。"
    t.index ["anchor_pfid", "similarity_rank"], name: "uni_anchorPfid_similarityRank", unique: true
    t.index ["create_time"], name: "idx_createTime"
    t.index ["update_time"], name: "idx_updateTime"
  end

  create_table "rs_user_preferences", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", comment: "[浪] 熱門頁推薦系統：用戶對主播的偏好排名。上海同步。後台調用。作者：Allen<allen.chang@langlive.com>。", force: :cascade do |t|
    t.integer "pfid", null: false, comment: "用戶浪號。", unsigned: true
    t.integer "preference_rank", limit: 2, null: false, comment: "偏好排序。1：第1偏好；2：第2偏好⋯⋯依此類推。", unsigned: true
    t.integer "anchor_pfid", null: false, comment: "主播浪號。", unsigned: true
    t.datetime "create_time", default: -> { "current_timestamp()" }, null: false, comment: "資料建立時間。時區：UTC±00。"
    t.datetime "update_time", default: -> { "current_timestamp()" }, null: false, comment: "資料更新時間。時區：UTC±00。"
    t.index ["create_time"], name: "idx_createTime"
    t.index ["pfid", "preference_rank"], name: "uni_pfid_preferenceRank", unique: true
    t.index ["update_time"], name: "idx_updateTime"
  end

  create_table "rs_user_similar_preferences", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", comment: "[浪] 熱門頁推薦系統：用戶相似偏好推薦。上海同步。後台調用。作者：Allen<allen.chang@langlive.com>。", force: :cascade do |t|
    t.integer "pfid", null: false, comment: "用戶浪號。", unsigned: true
    t.integer "preference_rank", limit: 2, null: false, comment: "推薦排序。1：第1推薦；2：第2推薦⋯⋯依此類推。", unsigned: true
    t.integer "anchor_pfid", null: false, comment: "主播浪號。", unsigned: true
    t.integer "recom_reason", comment: "推薦原因。一般是用戶過去最愛的主播。", unsigned: true
    t.datetime "create_time", default: -> { "current_timestamp()" }, null: false, comment: "資料建立時間。時區：UTC±00。"
    t.datetime "update_time", default: -> { "current_timestamp()" }, null: false, comment: "資料更新時間。時區：UTC±00。"
    t.index ["create_time"], name: "idx_createTime"
    t.index ["pfid", "preference_rank"], name: "uni_pfid_preferenceRank", unique: true
    t.index ["update_time"], name: "idx_updateTime"
  end

  create_table "square_anchors", primary_key: "pfid", id: :integer, comment: "用戶浪代號。", unsigned: true, default: nil, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", comment: "廣場用戶表", force: :cascade do |t|
    t.decimal "duration", precision: 10, scale: 2, comment: "累積開播"
    t.timestamp "created_at", default: -> { "current_timestamp()" }, comment: "系統建立時間"
    t.timestamp "updated_at", default: -> { "current_timestamp()" }, comment: "系統更新時間"
    t.index ["updated_at"], name: "idx_update"
  end

  create_table "tb_live_commercial_sync", id: :integer, unsigned: true, default: nil, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", comment: "直播工商同步表’;", force: :cascade do |t|
    t.integer "duration", comment: "时长，单位：秒"
    t.integer "pcu_max", comment: "MAX PCU值"
    t.datetime "max_at", comment: "MAX PCU发生时刻"
    t.timestamp "dw_updated_at", default: -> { "current_timestamp()" }, null: false
    t.timestamp "dw_created_at", default: -> { "current_timestamp()" }, null: false
    t.index ["dw_updated_at"], name: "idx_dw_update"
  end

  create_table "tb_order_user_month", primary_key: "auto_id", id: :integer, comment: "自增主键", unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", comment: "用户储值浪花月表", force: :cascade do |t|
    t.integer "t_month", null: false, comment: "月份", unsigned: true
    t.integer "pfid", null: false, comment: "id", unsigned: true
    t.integer "s_gold", default: 0, comment: "当月储值的浪花和 sum(gold +extra_gold)"
    t.timestamp "db_insert_time", default: -> { "current_timestamp()" }, null: false, comment: "写入时间"
    t.timestamp "db_update_time", default: -> { "current_timestamp()" }, null: false, comment: "更新时间"
    t.index ["db_update_time"], name: "idx_update"
    t.index ["t_month", "pfid"], name: "unq_idx", unique: true
  end

  create_table "tb_rate_anchor", primary_key: "pfid", id: :integer, comment: "主播id", unsigned: true, default: nil, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", comment: "主播评级表 --created by xiaoyi.shen;", force: :cascade do |t|
    t.integer "rate_income", limit: 1, comment: "收入等级", unsigned: true
    t.integer "score_income", limit: 1, comment: "收入得分"
    t.integer "rate_adnc", limit: 1, comment: "观众等级", unsigned: true
    t.integer "score_adnc", limit: 1, comment: "观众得分"
    t.timestamp "db_insert_time", default: -> { "current_timestamp()" }, null: false, comment: "写入时间"
    t.timestamp "db_update_time", default: -> { "current_timestamp()" }, null: false, comment: "更新时间"
    t.index ["db_insert_time"], name: "idx_insert"
    t.index ["db_update_time"], name: "idx_update"
  end

  create_table "tb_rate_anchor_day", primary_key: "auto_id", id: :integer, comment: "逻辑主键", unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", comment: "主播评级数据日表 --created by xiaoyi.shen;", force: :cascade do |t|
    t.date "t_day", null: false, comment: "日期"
    t.integer "pfid", null: false, comment: "主播id", unsigned: true
    t.integer "duration", default: 0, comment: "直播时长-秒", unsigned: true
    t.integer "is_signed", limit: 1, default: 0, null: false, comment: "0=unsigned, 1=signed.", unsigned: true
    t.integer "rate_income", limit: 1, comment: "收入等级", unsigned: true
    t.integer "rate_adnc", limit: 1, comment: "观众等级", unsigned: true
    t.timestamp "db_insert_time", default: -> { "current_timestamp()" }, null: false, comment: "写入时间"
    t.timestamp "db_update_time", default: -> { "current_timestamp()" }, null: false, comment: "更新时间"
    t.index ["db_insert_time"], name: "idx_insert"
    t.index ["db_update_time"], name: "idx_update"
    t.index ["pfid"], name: "idx_pfid"
    t.index ["t_day", "pfid"], name: "unq_idx", unique: true
  end

  create_table "tb_rate_anchor_log", primary_key: ["t_month", "pfid"], options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", comment: "主播评级表月份log表 --created by Wendell.huang;", force: :cascade do |t|
    t.date "t_month", null: false, comment: "計算月份"
    t.integer "pfid", null: false, comment: "主播id", unsigned: true
    t.integer "rate_income", limit: 1, comment: "收入等级", unsigned: true
    t.integer "score_income", limit: 1, comment: "收入得分"
    t.integer "rate_adnc", limit: 1, comment: "观众等级", unsigned: true
    t.integer "score_adnc", limit: 1, comment: "观众得分"
    t.timestamp "db_insert_time", default: -> { "current_timestamp()" }, null: false, comment: "写入时间"
    t.timestamp "db_update_time", default: -> { "current_timestamp()" }, null: false, comment: "更新时间"
    t.index ["db_insert_time"], name: "idx_insert"
    t.index ["db_update_time"], name: "idx_update"
    t.index ["pfid"], name: "idx_pfid"
  end

  create_table "tb_rate_anchor_month", primary_key: "auto_id", id: :integer, comment: "逻辑主键", unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", comment: "主播评级数据月表 --created by xiaoyi.shen;", force: :cascade do |t|
    t.date "t_month", null: false, comment: "月份,每月的第一天."
    t.integer "pfid", null: false, comment: "主播id", unsigned: true
    t.integer "is_signed", limit: 1, default: 0, null: false, comment: "0=unsigned, 1=signed.", unsigned: true
    t.integer "company_id", comment: "经纪公司id", unsigned: true
    t.integer "income_rate", limit: 1, comment: "收入等级", unsigned: true
    t.integer "income_increase", limit: 1, comment: "收入等级增长"
    t.decimal "income_score", precision: 11, scale: 2, comment: "收入得分"
    t.integer "income_sc_increase", limit: 1, comment: "收入得分增长"
    t.integer "adnc_rate", limit: 1, comment: "观众等级", unsigned: true
    t.integer "adnc_increase", limit: 1, comment: "观众等级增长"
    t.decimal "adnc_score", precision: 11, scale: 2, comment: "观众得分"
    t.integer "adnc_sc_increase", limit: 1, comment: "观众得分增长"
    t.timestamp "db_insert_time", default: -> { "current_timestamp()" }, null: false, comment: "写入时间"
    t.timestamp "db_update_time", default: -> { "current_timestamp()" }, null: false, comment: "更新时间"
    t.index ["db_insert_time"], name: "idx_insert"
    t.index ["db_update_time"], name: "idx_update"
    t.index ["pfid"], name: "idx_pfid"
    t.index ["t_month", "pfid"], name: "unq_idx", unique: true
  end

  create_table "tb_rate_anchor_month_kpi", primary_key: "auto_id", id: :integer, comment: "逻辑主键", unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", comment: "主播评级数据月明细表 --created by xiaoyi.shen;", force: :cascade do |t|
    t.date "t_month", null: false, comment: "月份日期,每月的第一天."
    t.integer "pfid", null: false, comment: "主播id", unsigned: true
    t.integer "key_id", limit: 1, null: false, comment: "数据定义代码", unsigned: true
    t.decimal "key_value", precision: 11, scale: 2, comment: "数据"
    t.decimal "increase", precision: 11, scale: 2, comment: "涨幅，可以负"
    t.integer "weight", limit: 1, comment: "权重", unsigned: true
    t.integer "rate", limit: 1, comment: "等级", unsigned: true
    t.integer "account", limit: 1, null: false, comment: "评级得分", unsigned: true
    t.decimal "score", precision: 11, scale: 2, comment: "单项得分"
    t.timestamp "db_insert_time", default: -> { "current_timestamp()" }, null: false, comment: "写入时间"
    t.timestamp "db_update_time", default: -> { "current_timestamp()" }, null: false, comment: "更新时间"
    t.index ["db_insert_time"], name: "idx_insert"
    t.index ["db_update_time"], name: "idx_update"
    t.index ["pfid"], name: "idx_pfid"
    t.index ["t_month", "pfid", "key_id"], name: "unq_idx", unique: true
  end

  create_table "tb_rate_stat_day_adnc", primary_key: "auto_id", id: :integer, comment: "逻辑主键", unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", comment: "主播评级日统计表(观众) --created by xiaoyi.shen;", force: :cascade do |t|
    t.date "t_day", null: false, comment: "日期"
    t.integer "dau", comment: "Daily Active User", unsigned: true
    t.integer "num_signed", comment: "签约主播数", unsigned: true
    t.integer "num_unsigned", comment: "未签约主播数", unsigned: true
    t.integer "num_total", comment: "主播总数", unsigned: true
    t.integer "s_signed", comment: "签约主播数", unsigned: true
    t.integer "s_unsigned", comment: "未签约主播数", unsigned: true
    t.integer "s_total", comment: "主播总数", unsigned: true
    t.integer "a_signed", comment: "签约主播数", unsigned: true
    t.integer "a_unsigned", comment: "未签约主播数", unsigned: true
    t.integer "a_total", comment: "主播总数", unsigned: true
    t.integer "b_signed", comment: "签约主播数", unsigned: true
    t.integer "b_unsigned", comment: "未签约主播数", unsigned: true
    t.integer "b_total", comment: "主播总数", unsigned: true
    t.integer "c_signed", comment: "签约主播数", unsigned: true
    t.integer "c_unsigned", comment: "未签约主播数", unsigned: true
    t.integer "c_total", comment: "主播总数", unsigned: true
    t.integer "d_signed", comment: "签约主播数", unsigned: true
    t.integer "d_unsigned", comment: "未签约主播数", unsigned: true
    t.integer "d_total", comment: "主播总数", unsigned: true
    t.timestamp "db_insert_time", default: -> { "current_timestamp()" }, null: false, comment: "写入时间"
    t.timestamp "db_update_time", default: -> { "current_timestamp()" }, null: false, comment: "更新时间"
    t.index ["db_insert_time"], name: "idx_insert"
    t.index ["db_update_time"], name: "idx_update"
    t.index ["t_day"], name: "unq_idx", unique: true
  end

  create_table "tb_rate_stat_day_income", primary_key: "auto_id", id: :integer, comment: "逻辑主键", unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", comment: "主播评级日统计表(收入) --created by xiaoyi.shen;", force: :cascade do |t|
    t.date "t_day", null: false, comment: "日期"
    t.integer "dau", comment: "Daily Active User", unsigned: true
    t.integer "num_signed", comment: "签约主播数", unsigned: true
    t.integer "num_unsigned", comment: "未签约主播数", unsigned: true
    t.integer "num_total", comment: "主播总数", unsigned: true
    t.integer "s_signed", comment: "签约主播数", unsigned: true
    t.integer "s_unsigned", comment: "未签约主播数", unsigned: true
    t.integer "s_total", comment: "主播总数", unsigned: true
    t.integer "a_signed", comment: "签约主播数", unsigned: true
    t.integer "a_unsigned", comment: "未签约主播数", unsigned: true
    t.integer "a_total", comment: "主播总数", unsigned: true
    t.integer "b_signed", comment: "签约主播数", unsigned: true
    t.integer "b_unsigned", comment: "未签约主播数", unsigned: true
    t.integer "b_total", comment: "主播总数", unsigned: true
    t.integer "c_signed", comment: "签约主播数", unsigned: true
    t.integer "c_unsigned", comment: "未签约主播数", unsigned: true
    t.integer "c_total", comment: "主播总数", unsigned: true
    t.integer "d_signed", comment: "签约主播数", unsigned: true
    t.integer "d_unsigned", comment: "未签约主播数", unsigned: true
    t.integer "d_total", comment: "主播总数", unsigned: true
    t.timestamp "db_insert_time", default: -> { "current_timestamp()" }, null: false, comment: "写入时间"
    t.timestamp "db_update_time", default: -> { "current_timestamp()" }, null: false, comment: "更新时间"
    t.index ["db_insert_time"], name: "idx_insert"
    t.index ["db_update_time"], name: "idx_update"
    t.index ["t_day"], name: "unq_idx", unique: true
  end

  create_table "tb_rate_stat_month_adnc", primary_key: "auto_id", id: :integer, comment: "逻辑主键", unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", comment: "主播评级月统计表(观众) --created by xiaoyi.shen;", force: :cascade do |t|
    t.date "t_month", null: false, comment: "月份日期,每月的第一天."
    t.integer "num_signed", comment: "签约主播数", unsigned: true
    t.integer "num_unsigned", comment: "未签约主播数", unsigned: true
    t.integer "num_total", comment: "主播总数", unsigned: true
    t.integer "s_signed", comment: "签约主播数", unsigned: true
    t.integer "s_unsigned", comment: "未签约主播数", unsigned: true
    t.integer "s_total", comment: "主播总数", unsigned: true
    t.integer "a_signed", comment: "签约主播数", unsigned: true
    t.integer "a_unsigned", comment: "未签约主播数", unsigned: true
    t.integer "a_total", comment: "主播总数", unsigned: true
    t.integer "b_signed", comment: "签约主播数", unsigned: true
    t.integer "b_unsigned", comment: "未签约主播数", unsigned: true
    t.integer "b_total", comment: "主播总数", unsigned: true
    t.integer "c_signed", comment: "签约主播数", unsigned: true
    t.integer "c_unsigned", comment: "未签约主播数", unsigned: true
    t.integer "c_total", comment: "主播总数", unsigned: true
    t.integer "d_signed", comment: "签约主播数", unsigned: true
    t.integer "d_unsigned", comment: "未签约主播数", unsigned: true
    t.integer "d_total", comment: "主播总数", unsigned: true
    t.timestamp "db_insert_time", default: -> { "current_timestamp()" }, null: false, comment: "写入时间"
    t.timestamp "db_update_time", default: -> { "current_timestamp()" }, null: false, comment: "更新时间"
    t.index ["db_insert_time"], name: "idx_insert"
    t.index ["db_update_time"], name: "idx_update"
    t.index ["t_month"], name: "unq_idx", unique: true
  end

  create_table "tb_rate_stat_month_income", primary_key: "auto_id", id: :integer, comment: "逻辑主键", unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", comment: "主播评级月统计表(收入) --created by xiaoyi.shen;", force: :cascade do |t|
    t.date "t_month", null: false, comment: "月份日期,每月的第一天."
    t.integer "num_signed", comment: "签约主播数", unsigned: true
    t.integer "num_unsigned", comment: "未签约主播数", unsigned: true
    t.integer "num_total", comment: "主播总数", unsigned: true
    t.integer "s_signed", comment: "签约主播数", unsigned: true
    t.integer "s_unsigned", comment: "未签约主播数", unsigned: true
    t.integer "s_total", comment: "主播总数", unsigned: true
    t.integer "a_signed", comment: "签约主播数", unsigned: true
    t.integer "a_unsigned", comment: "未签约主播数", unsigned: true
    t.integer "a_total", comment: "主播总数", unsigned: true
    t.integer "b_signed", comment: "签约主播数", unsigned: true
    t.integer "b_unsigned", comment: "未签约主播数", unsigned: true
    t.integer "b_total", comment: "主播总数", unsigned: true
    t.integer "c_signed", comment: "签约主播数", unsigned: true
    t.integer "c_unsigned", comment: "未签约主播数", unsigned: true
    t.integer "c_total", comment: "主播总数", unsigned: true
    t.integer "d_signed", comment: "签约主播数", unsigned: true
    t.integer "d_unsigned", comment: "未签约主播数", unsigned: true
    t.integer "d_total", comment: "主播总数", unsigned: true
    t.timestamp "db_insert_time", default: -> { "current_timestamp()" }, null: false, comment: "写入时间"
    t.timestamp "db_update_time", default: -> { "current_timestamp()" }, null: false, comment: "更新时间"
    t.index ["db_insert_time"], name: "idx_insert"
    t.index ["db_update_time"], name: "idx_update"
    t.index ["t_month"], name: "unq_idx", unique: true
  end

  create_table "tb_user_revenue_day", primary_key: "auto_id", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", comment: "用户每日充值，消费，余额汇总表 gw.yang@langlive.com", force: :cascade do |t|
    t.integer "pfid", default: 0, null: false, comment: "用户pfid", unsigned: true
    t.date "day", null: false, comment: "日期utc+8"
    t.decimal "recharge_total", precision: 11, scale: 2, default: "0.0", null: false, comment: "储值金额"
    t.integer "balance_total", default: 0, null: false, comment: "获得浪花", unsigned: true
    t.integer "consume_total", default: 0, null: false, comment: "消耗总数", unsigned: true
    t.timestamp "db_insert_time", default: -> { "current_timestamp()" }, null: false, comment: "数据写入时间utc+0"
    t.timestamp "db_update_time", default: -> { "current_timestamp()" }, null: false, comment: "数据更新时间utc+0"
    t.index ["day"], name: "idx_day"
    t.index ["pfid", "day"], name: "idx_uniq", unique: true
  end

  create_table "tb_uv_coe", primary_key: ["tp", "wd"], options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", comment: "统计计算参数表", force: :cascade do |t|
    t.integer "tp", null: false, comment: "计算类型,1=uv.", unsigned: true
    t.integer "wd", limit: 1, null: false, comment: "weekday index(0 = Monday, 1 = Tuesday, … 6 = Sunday).", unsigned: true
    t.integer "coe", limit: 1, default: 1, null: false, comment: "系数"
    t.string "notes", comment: "注释"
    t.timestamp "created_at", default: -> { "current_timestamp()" }, null: false, comment: "写入时间"
    t.timestamp "updated_at", default: -> { "current_timestamp()" }, null: false, comment: "更新时间"
    t.index ["updated_at"], name: "idx_update"
  end

  create_table "total_pkchicken_report", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", comment: "pk吃雞總報", force: :cascade do |t|
    t.integer "serial", default: 0, null: false, comment: "吃鸡赛期号", unsigned: true
    t.boolean "race_name", comment: "0:發育, 1決賽:"
    t.integer "pk", default: 0, comment: "主播pk場次"
    t.integer "consume", default: 0, comment: "用戶消耗浪花"
    t.integer "diamonds", default: 0, comment: "主播收益"
    t.integer "anchor_users", default: 0, comment: "參與主播數量"
    t.integer "consume_users", default: 0, comment: "送禮用戶數"
    t.integer "half_cash", default: 0, comment: "拿一半現金的金額"
    t.integer "half_cash_users", default: 0, comment: "拿一半現金的人數"
    t.integer "cash", default: 0, comment: "總發放金額"
    t.datetime "db_insert_time", default: -> { "current_timestamp()" }, null: false, comment: "系統建立時間"
    t.datetime "db_update_time", default: -> { "current_timestamp()" }, null: false, comment: "系統更新時間"
    t.index ["db_update_time"], name: "idx_db_update_time"
    t.index ["serial", "race_name"], name: "uni_key", unique: true
  end

  create_table "user_alive_n_days", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.datetime "date", null: false, comment: "日期。結算日。"
    t.integer "retention_unit", limit: 1, null: false, comment: "第 n 天用戶留存。從結算日往前追朔 3、7、30 日（不含結算日）。", unsigned: true
    t.integer "retention", limit: 3, null: false, comment: "留存人數。", unsigned: true
    t.timestamp "updated_at", default: -> { "current_timestamp()" }, null: false
    t.timestamp "created_at", default: -> { "current_timestamp()" }, null: false
    t.index ["date", "retention_unit"], name: "uni_date_retention_unit", unique: true
  end

  create_table "user_daus", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.datetime "date", null: false, comment: "日期。"
    t.integer "new_user_count", limit: 3, null: false, comment: "新註冊用戶數。", unsigned: true
    t.integer "dau", limit: 3, null: false, comment: "每日活躍用戶（daily active user）。包含當日註冊用戶。", unsigned: true
    t.integer "login_count", limit: 3, null: false, comment: "當日登入次數。", unsigned: true
    t.timestamp "updated_at", default: -> { "current_timestamp()" }, null: false
    t.timestamp "created_at", default: -> { "current_timestamp()" }, null: false
    t.index ["date"], name: "uni_date", unique: true
  end

  create_table "user_retentions", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.datetime "date", null: false, comment: "日期。結算日期。"
    t.datetime "register_date", null: false, comment: "用戶註冊日期。"
    t.integer "retention", limit: 2, null: false, comment: "用戶留存數。", unsigned: true
    t.integer "register_count", limit: 2, null: false, comment: "用戶註冊數。", unsigned: true
    t.timestamp "updated_at", default: -> { "current_timestamp()" }, null: false
    t.timestamp "created_at", default: -> { "current_timestamp()" }, null: false
    t.index ["date", "register_date"], name: "uni_date_register_date", unique: true
  end

  create_table "user_statuses", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.datetime "date", null: false, comment: "日期。"
    t.string "login_by", limit: 32
    t.integer "new_user_count", null: false, comment: "新註冊用戶數。", unsigned: true
    t.integer "login_count", null: false, comment: "用戶登入次數。", unsigned: true
    t.integer "uniq_login_count", null: false, comment: "登入用戶數（去重）。", unsigned: true
    t.timestamp "updated_at", default: -> { "current_timestamp()" }, null: false
    t.timestamp "created_at", default: -> { "current_timestamp()" }, null: false
    t.index ["date", "login_by"], name: "uni_date_login_by", unique: true
  end

  create_table "user_vip_billing_infos", id: :integer, comment: "自增主鍵。", unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", comment: "[浪] 用戶：VIP 每日金流總覽。上海同步。後台調用。作者：Allen<allen.chang@langlive.com>。", force: :cascade do |t|
    t.date "date", null: false, comment: "日期。"
    t.integer "pfid", null: false, comment: "VIP 浪號。", unsigned: true
    t.integer "balance_gold", default: 0, null: false, comment: "VIP 剩餘浪花。", unsigned: true
    t.integer "consume_gold", default: 0, null: false, comment: "VIP 消耗浪花。", unsigned: true
    t.integer "recharge_gold", default: 0, null: false, comment: "VIP 儲值浪花。", unsigned: true
    t.timestamp "db_create_time", default: -> { "current_timestamp()" }, null: false, comment: "資料建立時間。時區：UTC±00。"
    t.timestamp "db_update_time", default: -> { "current_timestamp()" }, null: false, comment: "資料更新時間。時區：UTC±00。"
    t.index ["date"], name: "idx_date"
    t.index ["db_update_time"], name: "idx_dbUpdateTime"
    t.index ["pfid", "date"], name: "uni_pfid_date", unique: true
  end

  create_table "user_vip_donate_infos", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", comment: "[浪] 用戶：VIP 貢獻總覽。上海同步。後台調用。作者：Allen<allen.chang@langlive.com>。", force: :cascade do |t|
    t.integer "pfid", null: false, comment: "VIP 浪號。"
    t.integer "rank_type", limit: 1, null: false, comment: "VIP 貢獻榜類型。0：總榜；1：週榜。", unsigned: true
    t.integer "rank", limit: 1, null: false, comment: "貢獻榜序號。", unsigned: true
    t.integer "anchor_pfid", null: false, comment: "主播浪號。"
    t.bigint "diamond", default: 0, null: false, comment: "VIP 貢獻主播的鑽石數。", unsigned: true
    t.timestamp "create_time", default: -> { "current_timestamp()" }, null: false
    t.timestamp "update_time", default: -> { "current_timestamp()" }, null: false
    t.index ["pfid", "rank_type", "rank"], name: "uni_pfid_rankType_rank", unique: true
    t.index ["update_time"], name: "idx_updateTime"
  end

  create_table "user_vip_infos", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", comment: "[浪] 用戶：VIP 總覽。上海同步。後台調用。作者：Allen<allen.chang@langlive.com>。", force: :cascade do |t|
    t.integer "pfid", null: false, comment: "VIP 浪號。"
    t.integer "vip_level", limit: 1, default: 1, null: false, comment: "VIP 等級。", unsigned: true
    t.datetime "vip_time", null: false, comment: "用戶成為 VIP 的時間。時區：UTC±08。"
    t.datetime "last_login_time", null: false, comment: "VIP 最後登錄時間。時區：UTC±08。"
    t.datetime "last_pay_time", null: false, comment: "VIP 最後儲值時間。時區：UTC±08。"
    t.datetime "last_consume_time", comment: "VIP 最後消費時間。時區：UTC±08。"
    t.decimal "total_cash", precision: 12, scale: 3, null: false, comment: "VIP 總充值金額。貨幣：新臺幣。", unsigned: true
    t.decimal "two_month_ago_cash", precision: 12, scale: 3, default: "0.0", null: false, comment: "VIP 上上月充值金額。貨幣：新臺幣。", unsigned: true
    t.decimal "last_month_cash", precision: 12, scale: 3, default: "0.0", null: false, comment: "VIP 上月充值金額。貨幣：新臺幣。", unsigned: true
    t.decimal "mthly_cash", precision: 12, scale: 3, null: false, comment: "VIP 月充值金額。貨幣：新臺幣。", unsigned: true
    t.decimal "wkly_cash", precision: 12, scale: 3, null: false, comment: "VIP 週充值金額。貨幣：新臺幣。", unsigned: true
    t.decimal "daily_cash", precision: 12, scale: 3, null: false, comment: "VIP 日充值金額。貨幣：新臺幣。", unsigned: true
    t.string "currency", limit: 3, default: "TWD", null: false, comment: "VIP 最常使用的國際貨幣別(ISO 4217)。"
    t.integer "yesterday_gold", default: 0, null: false, comment: "VIP 昨日消耗浪花。", unsigned: true
    t.integer "balance", null: false, comment: "VIP 剩餘浪花。", unsigned: true
    t.timestamp "create_time", default: -> { "current_timestamp()" }, null: false
    t.timestamp "update_time", default: -> { "current_timestamp()" }, null: false
    t.index ["last_login_time"], name: "idx_lastLoginTime"
    t.index ["pfid"], name: "uni_pfid", unique: true
    t.index ["update_time"], name: "idx_updateTime"
    t.index ["vip_level"], name: "idx_vipLevel"
  end

  create_table "users", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "email", null: false
    t.string "password", null: false
    t.timestamp "updatedAt", default: -> { "current_timestamp()" }, null: false
    t.timestamp "createdAt", default: -> { "current_timestamp()" }, null: false
    t.integer "role_id", limit: 2, null: false, unsigned: true
    t.string "name", limit: 50
    t.index ["email"], name: "uni_email", unique: true
    t.index ["name"], name: "idx_name"
    t.index ["role_id"], name: "fk_user_permission"
  end

  add_foreign_key "permissions", "platform_statistics_keys", column: "key_id", primary_key: "key_id", name: "fk_statistic_permission"
  add_foreign_key "users", "permissions", column: "role_id", primary_key: "role_id", name: "fk_user_permission"
end
