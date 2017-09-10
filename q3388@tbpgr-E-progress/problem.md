# 概要
## タイトル
[進捗はいいじゃんマーク](https://codeiq.jp/q/3388)

## 問題
X行、幅Xの「進捗はいいじゃんマーク」を出力する
「進捗はいいじゃんマーク」とは、領域内一杯に英大文字Eのパターンを表したもので、
先頭、末尾の行は全て`e`、真ん中の行は行頭から行の真ん中までが`e`、
その他の行は行頭のみ`e`で、それ以外が全て`.`となっているものである。
なお、Xが偶数の場合は「真ん中の行/点」がないため、このパターンが作れない。
そこで代わりに`invalid`を出力する

# 入出力
## 入力
* 整数X ( 1≦X≦100 )

## 出力
* 「進捗はいいぞマーク」のパターン或いは`invalid`

# 例
|入力|出力|
|-|-|
|1|e|
|3|eee\nee.\neee|
|5|eeeee\ne....\neee..\ne....\neeeee|
|2|invalid|

※\nは改行を表す。なお、末尾の改行は省略 ( 多分必要 )