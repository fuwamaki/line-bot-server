# README

自前Line bot用のherokuサーバ。

# Ruby on Rails

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# railsセットアップした時の手順

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

# herokuセットアップ

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

# ローカルで実行する方法

Terminalで下記コマンド

```
$ bundle exec rails s
```