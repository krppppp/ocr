# README

アプリにアップロードした文字の入ったスクショ画像をGoogleのcloud vision apiをつかって画像認証を行う

その結果で得た文字列をブラウザに表示するまでがこのアプリ

https://a244.hateblo.jp/entry/2016/09/01/233000
↑参考

rootでアップロードをして送信ボタンを押すと画像indexに遷移。

本当はimages#createのアクション内でrubyファイルを実行して画像認識まで行いたいが
https://qiita.com/tyabe/items/56c9fa81ca89088c5627
↑ruby



cannot load such file -- google/apis/vision_v1

このエラーが帰ってきて実現せず。

結果アップロードしたあと手動でターミナルに

$ ruby app/helpers/ocr.rb

を打ち込んで実行している。
