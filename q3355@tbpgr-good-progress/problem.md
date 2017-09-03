# 概要
## タイトル
[進捗はいいぞマーク](https://codeiq.jp/q/3355)

## 問題
X行、幅Xの「進捗はいいぞマーク」を出力する
「進捗はいいぞマーク」とは、縦横それぞれ真ん中の点を頂点とする
菱形状に`o`を配置した ( その他は `.` の ) パターンである
なお、Xが偶数の場合は「真ん中の点」がないため、このパターンが作れない。
そこで代わりに`invalid`を出力する

# 入出力
## 入力
* 整数X ( 1≦X≦100 )

## 出力
* 「進捗はいいぞマーク」のパターン或いは`invalid`

# 例
|入力|出力|
|-|-|
|1|o|
|3|.o.\no.o\n.o.|
|5|..o..\n.o.o.\no...o\n.o.o.\n..o..|
|2|invalid|

※\nは改行を表す。なお、末尾の改行は省略 ( 多分必要 )