## セットアップ

環境構築方法。

## rails setup

1. 初期化

```
$ bundle init
```

2. GemfileのRailsのコメントアウトを外す

3. Railsインストール

```
$ bundle install --path=vendor/bundle
```

4. Railsアプリケーション作成

```
$ bundle exec rails new .
```

5. ライブラリインストール

```
$ bundle install --path=vendor/bundle
```

## heroku setup

1. herokuをbrewでダウンロード

```
$ brew install heroku/brew/heroku
```

2. herokuへログイン

```
$ heroku login
Enter your Heroku credentials.
Email: user@example.com
Password:
```

3. herokuドメイン作成

```
$ heroku create line-botmatsumoto
```

※ その他heroku便利コマンド

```
$ heroku open #herokuサーバページ開く
$ heroku run rake db:migrate #herokuにデプロイしたアプリケーションのデータベースを更新します。
$ heroku logs #ログ確認
$ heroku logs | grep error #エラーのみ表示
$ heroku config #heroku設定内容確認
```

## ローカル実行方法

Terminalで下記コマンド

```
$ bundle exec rails s
```

http://localhost:3000/ へアクセス。

## ローカルでmysql

ローカルでmysqlをセットアップしたのでメモ

```
$ brew install mysql
```

以上。

## mysql操作方法

- mySQL起動

```
$ mysql.server start
```

- 初期設定

```
$ mysql_secure_installation
```

- mySQL実行

```
$ mysql -uroot -p
```

- mySQL終了

```
$ mysql.server stop
```

## localで確認するために

- mysql操作

```
mysql> CREATE USER 'y-maki'@'localhost'; //ユーザ作成
mysql> grant all on *.* to 'y-maki'@'localhost'; //アクセス権限付与
```

※参考

```
mysql> select User,Host from mysql.user; //ユーザ一覧表示
```

- rails側操作

新規データベース作成

```
$ bundle exec rake db:create
```

- モデルを作成

```
$ bundle exec rails g scaffold home name:string body:text email:string
```

- migrate

```
$ bundle exec rake db:migrate
```

