DB Migration
====================

## Test script usage

```bash
# switch aws profile first, if you need to download docker images from aws ecr

# awsp
./migration.sh
```

## How to create db migration

```bash
docker exec -it ruby sh

bundle exec rake db:new_migration name=create_your_scheme

vi db/migrate/20180920035140_create_your_scheme.rb
```

```ruby
class CreateYourScheme < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      DBA提供的SQL語法
    SQL
  end
  def down
    自行編寫反向的SQL語法
  end
end
```

## index naming format (using CamelCase)

**UNIQUE** KEY
- **uni**_userId (user_id)
- **uni**_roleId_permissionId (role_id, permission_id)

**KEY**
- **idx**_signInAt (signed_in_at)
- **idx**_stickDay_impression (stick_day, impression)


# How to test DB migration

```bash
docker exec -it ruby sh

bundle exec rake db:migrate:status
bundle exec rake db:migrate
bundle exec rake db:rollback

bundle exec rake db:migrate
bundle exec rake db:migrate
```
