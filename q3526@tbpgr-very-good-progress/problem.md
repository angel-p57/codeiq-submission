# 概要
## タイトル
[進捗ヴェリーグッドマーク](https://codeiq.jp/q/3526)

## 問題
X行、幅Xの「進捗ヴェリーグッドマーク」を出力する。  
「進捗ヴェリーグッドマーク」とは、最初の2行は両端、次の2行は両端の1つ内側、…というように2行毎に内側に1つずつずれていく場所に`v`を配置し、最終行は真ん中のみに`v`を配置した ( その他は`.`の ) パターンである。  
なお、Xが偶数の場合は「真ん中の点」がないため、このパターンが作れない。 そこで代わりに`invalid`を出力する

# 入出力
## 入力
* 整数X ( 1≦X≦100 )

## 出力
* 「進捗ヴェリーグッドマーク」のパターン或いは`invalid`

# 例
|入力|出力|
|-|-|
|1|v|
|3|v.v\nv.v\n.v.|
|5|v...v\nv...v\n.v.v.\n.v.v.\n..v..|
|2|invalid|