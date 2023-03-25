# README

## アプリケーション名
furima-38982

## アプリケーション概要
プログラミングスクールの最終課題制作としてフリーマーケットのアプリケーションを作成しました。  
ユーザーを登録すると商品を出品できるようになります。自身が出品した商品は、編集と削除をすることができます。  
他のユーザーが出品した商品は、クレジットカードを用いて購入することができます。  

クレジットカード購入機能については、PAY.JPが提供しているAPIを使用しています。  
HTML・CSSは配布されたテンプレートを使用しております。  

## 工夫した点
事前に必要となる機能について学習した点です。補足カリキュラムを先に学習することで、データベース設計をスムーズに完了させました。  
  
  また、事前に学習することで、具体的な作業内容や処理の流れをイメージすることができました。  
  
さらに、作業着手前に、全ての機能を実装するまでの工程を分割し、完成までのスケジューリングを行うことで期限を意識して取り組むことができました。  

## 開発で苦労したこと
新たに挑戦する購入機能の実装で、なかなかエラーを解決することができなかった点です。  
  
エラーメッセージやパラメータの中身をヒントに、原因の仮説をたて、インターネットで同様のエラーが派生した場合の対処を調べたり、記載済みのコーディングを見直したりすることで、解決に至りました。  
  
開発の現場では、アプリケーションに合わせて、別チームが記載したコードや、従来から使っているテンプレートにおいてもコードを見直す必要があることを学ぶことができました。

## URL
http://54.199.241.193/


## テスト用アカウント等
●Basic認証　※Basic認証は一部ページのみ  
    ・ID: hino  
    ・パスワード: hinohino  


● 購入者テスト用アカウント  
    ・メールアドレス : buyer_user@gmail.com  
    ・パスワード    : buyer00  

● 出品者テスト用アカウント  
    ・メールアドレス : seller_user@gmail.com  
    ・パスワード    : seller00      

 ●クレジットカード情報
    ・カード番号: 4242 4242 4242 4242  
    ・期限: 12/23（未来の 月 / 年 ）  
    ・CVC: 123  

## 利用方法
### 出品方法
1.トップページ右上より、テストアカウント：SELLERでログイン  
 （メールアドレス: seller_user@gmail.com：パスワード: seller00）  
  (注) 同時に複数の方がログインしている場合に、ログインできない可能性があります。  
2.トップページ右下から【出品】ボタン押下  
3.商品情報入力後、【出品する】ボタン押下  

### 購入方法
1.トップページ右上より、テストアカウント：BUYERでログイン  
 （メールアドレス: buyer_user@gmail.com：パスワード: buyer00）  
　 (注) 同時に複数の方がログインしている場合に、ログインできない可能性があります。  
2.トップページから商品選択し、詳細画面へ移動  
3.【購入画面に進む】より購入内容の確認ページへ移動  
  （購入用カード情報：番号：4242424242424242  
  期限：12 / 24（未来の 月 / 年 ）  
  セキュリティコード：123  
4.必要情報入力後【購入】ボタン押下  

# テーブル設計

## users テーブル

| Column              | Type   | Options                   |
| ------------------- | ------ | ------------------------- |
| email               | string | null: false ,unique: true |
| encrypted_password  | string | null: false               |
| nickname            | string | null: false               |
| family_name         | string | null: false               |
| first_name          | string | null: false               |
| family_name_reading | string | null: false               |
| first_name_reading  | string | null: false               |
| birthday            | date   | null: false               |

### Association

- has_many :items
- has_many :orders


## items テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| item_name       | string     | null: false                    |
| content         | text       | null: false                    |
| category_id     | integer    | null: false                    |
| condition_id    | integer    | null: false                    |
| postage_id      | integer    | null: false                    |
| prefecture_id   | integer    | null: false                    |
| shipping_day_id | integer    | null: false                    |
| price           | integer    | null: false                    |
| user            | references | null: false, foreign_key: true |

### Association

- belongs_to  :user
- has_one     :order


## orders テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| user            | references | null: false, foreign_key: true |
| item            | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one    :address


## addresses テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| post_code     | string     | null: false                    |
| prefecture_id | integer    | null: false                    |
| city          | string     | null: false                    |
| house_number  | string     | null: false                    |
| building      | string     |                                |
| phone_number  | string     | null: false                    |
| order         | references | null: false, foreign_key: true |

### Association

- belongs_to :order