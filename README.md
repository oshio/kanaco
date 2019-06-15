かなこ
===============
入力された文章のよみがなを表示するアプリ「かなこ」です。

## 動作に必要な環境

* iOS 12.2 or later
* iPhone, iPad, iPod touch

## 開発に必要な環境

* Xcode 10.2 or later (iOS SDK 12.2)
* Ruby 2.3.0 or later
* RubyGems 2.5 or later
* Bundler 2.0 or later

### 利用API
「かなこ」にはgooラボさんの「ひらがな化API」を利用しています。  
Xcodeでの実行にはgooラボさんのサイトで発行したAPIキーが必要です。

<a href="http://www.goo.ne.jp/">
<img src="//u.xgoo.jp/img/sgoo.png" alt="supported by goo"
title="supported by goo">
</a>

## 開発(Xcodeでの実行)の準備
プロジェクトのルートディレクトリにて以下を順番に実行します。
### gemのインストール
```
bundle install
```
### podのインストール
```
bundle exec pod install
```

pod installを初めて実行するときにはAPIKeyの値を入力を求められますので、「ひらがな化API」のAPIキーを入力します。  
入力したAPIキーはキーチェーンに保存されます。
