# OurSUIT

## サイト概要
![main](https://user-images.githubusercontent.com/78584031/119243710-54670380-bba4-11eb-8151-4a34cf1c9405.png)

「OurSUIT」は、スーツスタイルの共有に特化した画像投稿SNSサイトです。
仕事、結婚式、成人式、普段着など、様々な場面で活躍するスーツをの魅力を、ユーザー間で共有できるSNSサイトです。画像の投稿や、いいね、コメント、ユーザーのフォローなどを活用し、自分に合ったスーツスタイルを見つけることができます。

### サイトテーマ

普段着には気を遣うが、仕事で着るだけのスーツにはあまり気を遣わないという人が多いと思います。そんな人を一人でも減らす為に考えたサービスです。スーツも普段着と同等に拘ることで、日々の仕事が楽しくなります。
また、最近では働き方が多様化し、仕事服のカジュアル化などでスーツを着る機会も減ってきましたが、そんな現代だからこそ感じることができるスーツの魅力を共有し、スーツスタイルを盛り上げていく事を目指しています。

### テーマを選んだ理由

私自信が紳士服業界で働いていた為、スーツに愛着があるという点もありますが、一番の理由は、働いていて感じた紳士服業界の問題点の改善に役立つサービスを作りたかったという点です。

その問題点は2つあります。1つ目は、スーツを売る側と買う側のテンションの差が大きいという点です。消耗品のビジネス服としてスーツを買いに来るお客様と、拘りのスーツを販売する店員側のテンションの差を、このサイトによって埋めることで、より楽しい買い物を実現して欲しいです。

2つ目は、お店で接客をしている店員が、お客様に紹介できる参考資料が少ないという問題点です。雑誌などではリアルなコーディネートを紹介しづらい為、このサイトを接客の際に活用して、スムーズなコーディネート提案に役立てて欲しいです。

### ターゲットユーザ

ビジネス、フォーマル、様々なシーンでスーツを着用するユーザー。また、紳士服業界で接客販売をするユーザー。

### 主な利用シーン

スーツのコーディネートを、沢山の投稿写真から参考にできます。また、コメントによりスーツ好き同士での意見交換もできます。

### 開発で意識した事

学習から3ヶ月の未経験者がサイトを作る上で、何を軸に開発を進めるべきか考えました。世の中で既に多くの人の役に立っているような完璧なサイトなど作れるはずもないので、私は何よりも「ユーザーが使いやすいかどうか」を軸に開発をしました。
サイトの機能や構成はシンプルなもので目新しくはありませんが、そういった単純な操作こそストレスなく直感的に行えるようなサイトを心掛けました。
また、GitHubを上手に活用できるようになる練習として、積極的にissueやbranch、pull requestなどを活用しました。

## 設計書

- ER 図

![ER図](https://user-images.githubusercontent.com/78584031/119248039-568f8900-bbc9-11eb-8607-0b16773a0a4c.png)

- テーブル定義書

  以下のリンク先から詳細をご覧ください。
  https://docs.google.com/spreadsheets/d/1OHf4J5Fxt38isWKnJ0sb5wcYJHy7onKfnvcY8giV9Vo/edit?usp=sharing

## 機能・導入技術一覧

- ユーザー登録、ログイン
- CRUD処理
- 画像アップロード
- タグ付け、タグ検索
- いいね
- コメント
- ランキング
- タイムライン
- 画像スライダー
- 非同期通信
- ページネーション
- Bootstrap4
- コードチェック(Rubocop)
- テスト(RSpec)
- 環境変数(gem 'dotenv-rails'を用いて機密情報を格納)
- データベース(MySQL)

## トップページ
![top](https://user-images.githubusercontent.com/78584031/119248384-c0a92d80-bbcb-11eb-94c2-77f3064a07fa.png)

## ランキングページ
![ranking](https://user-images.githubusercontent.com/78584031/119248415-f8b07080-bbcb-11eb-97aa-ac5286a96df0.png)

## 投稿ウィンドウ
![new](https://user-images.githubusercontent.com/78584031/119248456-331a0d80-bbcc-11eb-90e4-7761e1bf04e9.png)

## ユーザー詳細ページ
![user_show](https://user-images.githubusercontent.com/78584031/119248474-58a71700-bbcc-11eb-8783-9e744b97caae.png)

## 投稿詳細ページ
![post_show](https://user-images.githubusercontent.com/78584031/119248488-72485e80-bbcc-11eb-944f-f24b6420a282.png)

## プロフィール編集ページ
![edit](https://user-images.githubusercontent.com/78584031/119248510-9310b400-bbcc-11eb-93ee-486a4cdcf54f.png)

## フォロー一覧ウィンドウ
![follow](https://user-images.githubusercontent.com/78584031/119248527-af145580-bbcc-11eb-9c38-401de759af07.png)

## URL

http://oursuit.net/

## 開発環境

- OS：Linux(CentOS)
- 言語：HTML,CSS,JavaScript,Ruby,SQL
- フレームワーク：Ruby on Rails
- JS ライブラリ：jQuery
- IDE：Cloud9

## 使用素材

- Font Awesome

  https://fontawesome.com/

- Hatchful

  https://hatchful.shopify.com/ja/

- O-DAN

  https://o-dan.net/ja/

- お名前.com

  https://www.onamae.com/
