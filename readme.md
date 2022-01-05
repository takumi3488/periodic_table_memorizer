# CLIで周期表覚えるやつ

## リンク

- [GitHub](https://github.com/takumi3488/periodic_table_memorizer)
- [replit](https://replit.com/@TakumiMori/Zhou-Qi-Biao-Jue-eruyatu?v=1)

## 使い方

### replit上で使う場合
- RUNを押せば覚えられます
- 解答履歴を保存したい場合は、必ずForkして使ってください
  - replitのRubyはデフォルトでは日本語非対応なので、事前に設定が必要です。
  - サイドバーから`Secrets`を選択し、keyに`RUBYOPT`、valueに`-EUTF-8`を入力し、`Add new secret`を押して追加してから使ってください

### ローカルで使う場合

- Rubyがインストールされている必要があります
  - バージョン2.7.4以降を推奨します
- [GitHub](https://github.com/takumi3488/periodic_table_memorizer)からダウンロードし、periodic_table_memorizerフォルダ内で`ruby main.rb`で実行できます
- targets.txtに覚えたい元素の元素番号を書くことで、範囲を絞れます
  - 書き方は`targets.txtの書き方`の項を参照してください
- 番号のみの周期表を見ながら解答したい場合には、number_table.pngを片側に開いておくことをお勧めします。ただし、自分用に88番までしか作っていないので、もっと欲しい方は自分で作ってみてください。ExcelやGoogleスプレッドシートで簡単に作れるはず
- 元素記号が入った周期表を眺めたい方はsymbol_table.pngを見てみてください

## 権利関係

- symbol_table.pngは[Wikipedia](https://ja.wikipedia.org/wiki/%E5%85%83%E7%B4%A0%E3%81%AE%E4%B8%80%E8%A6%A7)からの引用です
- その他のファイルはすべて[MIT License](https://github.com/takumi3488/periodic_table_memorizer/blob/main/LICENSE)とします
