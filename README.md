# README

本リポジトリでは、[langchainrb_rails](https://github.com/andreibondarev/langchainrb_rails)と[pgvector](https://github.com/pgvector/pgvector)を利用した
簡単なRAGを開発しています。
現在まだ開発途中なので、うまく動かない部分もありますことをご了承ください。

## 環境
* ruby 3.2.2
* Rails 7.1.1
* langchainrb_rails 0.1.3
* OpenAIのAPIキーが必要です。

## setup
* Rails7系を使っているため、nodeやHotwire関連のセットアップが必要です。

1. PostgreSQLをインストール
2. 本リポジトリをダウンロード
3. .envファイルをリポジトリ直下に作成、必要な情報を入力
5. ```yarn install```
6. ```bundle install```
7. ```bundle exec rails db:create```
8. psqlにて作成したデータベースに接続し、```CREATE EXTENSION vector```を実行
9. ```bundle exec rails db:migrate```
10. ```bundle exec rails s```
