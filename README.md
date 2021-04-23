# README

# アプリケーション名  
  Phase App

# アプリケーション概要
  画像を1度に複数枚投稿でき、ペットの成長など日常の変化をまとめる事ができるアプリケーションです。  
  他ユーザーの投稿にいいねを押すこととコメントを残す事ができる。

# URL


# テスト用アカウント
Basic認証
  ユーザー：fisher  
  パスワード：3191759  

テスト用アカウント  
  ユーザー：tt11uu  
  Eメール：tt11uu@tt11uu.jp  
  パスワード:tt11uu

# 利用方法
  ①ユーザーログインを行う。  
  ②新規登録ボタンから画像、タイトル、場所、説明文を入力し、登録を行う。  
  ③登録された投稿のタイトルまたは作成日と更新日をクリックすると、詳細画面に移行する。  
  ④詳細画面から投稿したユーザーは編集と削除を行う事ができ、その他のユーザーはいいねとコメントができる。  

 # 目指した課題解決
  ペットの成長記録や部屋の片付けの経過等、日頃の変化を記録し、見返したい人のためのアプリケーションを目指した。  
  また他ユーザーのコメントやいいね機能を実装することで、投稿へのアドバイスを貰う事ができるため、様々な問題解決を行える。  

 # 洗い出した要件
  新規登録/ログイン機能  
  ログアウト機能  
  新規投稿機能  
  投稿詳細機能  
  投稿削除機能  
  投稿編集機能  
  ヘルプ機能
  いいね機能  
  コメント機能  
  マイページ機能  
  投稿検索機能  
  画像拡大機能  
  画像名表示機能  
  エラー日本語表示  
  Basic認証  

  # 使用技術（開発環境）
  ## バックエンド  
  Ruby,Ruby on rails

  ## フロントエンド
  Haml,Sass,Java Script,JQuery,Ajax
  ## データベース
  MySQL, Sequel Pro
  ## インフラ
  AWS(EC2),Capistarno,Docker(開発環境)
  ## Webサーバ(本番環境)
  nginx
  ## アプリケーションサーバ(本番環境)
  unicorn
  ## ソース管理
  GitHub,GitHubDesktop
  ## テスト
  Rspec
  ## エディタ
  VSCode

 # 実装した機能についての画像やGIFおよびその説明
 ## トップページ
 [![Image from Gyazo](https://i.gyazo.com/6afa0fd06d22fd92ea583c16ec3fbd9e.gif)](https://gyazo.com/6afa0fd06d22fd92ea583c16ec3fbd9e)

・投稿画像はカーソルを合わせる事によって3倍に拡大され、画像名を表示する  
・上部の検索入力欄はタイトルと説明文の検索を行える  

 ### 実装予定 
 ・投稿の見た目をもっと見やすく、分かりやすくする

 ## 詳細表示画面
[![Image from Gyazo](https://i.gyazo.com/a8ce0fc674b9586cece4bfdb36fcff67.jpg)](https://gyazo.com/a8ce0fc674b9586cece4bfdb36fcff67)
・トップページ同様に、画像の拡大を行える
・投稿したユーザーは編集と削除を詳細表示画面から行える  
・その他ユーザーは投稿にいいねとコメントを付ける事ができる

 ### 実装予定
 ・投稿ユーザーとその他ユーザーで行える機能を分ける
 ・説明文の下に場所などの詳細な情報を記載できるようにする

 ## ユーザーのマイページ
 [![Image from Gyazo](https://i.gyazo.com/ee5939edfd74c50032ce0e28d4724308.jpg)](https://gyazo.com/ee5939edfd74c50032ce0e28d4724308)
・ユーザーの投稿を一覧として表示する  
・トップページ同様に、画像の拡大を行える

 ### 実装予定
 ・投稿の見た目をもっと見やすく、分かりやすくする

 # DB設計

 ## users テーブル

| Column              | Type   | Options                   |
| ------------------- | ------ | ------------------------- |
| nickname            | string | null: false               |
| email               | string | null: false, unique: true |
| encrypted_password  | string | null: false, unique: true |

### Association

- has_many    :comments
- has_many    :messages
- has_many    :likes

 ## messages テーブル

| Column              | Type       | Options                   |
| ------------------- | ---------- | ------------------------- |
| name                | string     | null: false               |
| content             | string     | null: false               |
| place               | string     | null: false               |
| user                | references | foreign_key: true         |

### Association

- has_many :comments
- has_many :likes

## likes テーブル

| Column            | Type       | Options           |
| ----------------- | ---------- | ----------------- |
| user              | references | foreign_key: true |
| message           | references | foreign_key: true |

- belongs_to :user
- belongs_to :message

## comments テーブル

| Column            | Type       | Options           |
| ----------------- | ---------- | ----------------- |
| user              | references | foreign_key: true |
| message           | references | foreign_key: true |

- belongs_to :user
- belongs_to :message

## E-R図
[![Image from Gyazo](https://i.gyazo.com/bd139549c8b2a51c752cfa792025a80f.png)](https://gyazo.com/bd139549c8b2a51c752cfa792025a80f)