# TrainVision for JR東日本 中央線 E233

## What's this?
列車のドア上部に設置されたLCDディスプレイのエミュレータです。  
あくまで再現なので、完成度は低いです。単なる自己満足です。  
10inchぐらいのタブレットで表示することを想定して作られているため、中華タブレットとか買ってこれを表示すると同士でのネタにはなる(?)	

## How to build
最終的にはサーバーサイドでの処理は無く、すべてクライアントサイドで行えるのですが、  
CoffeeScriptで書いているため使用にはコンパイル処理が必要となります。  
~~ビルド済みのファイルを配布する気はありませんので、各自でコンパイルして下さい。~~  
また、フォントファイルもライセンスの都合で同梱することが出来ないため、  
各自の環境に合わせてindex.htmlのCSS部分を書き換えるなり、フォントを入れてください。  

### How to install CoffeeScript
CoffeeScriptをコンパイルするためにnode.jsが必要となります。  
*nixの場合はnvm等を使用して導入するとよいでしょう。  
Windowsの人はググッて頑張って入れましょう。私はWidowsでは動作を確認していません。自己責任でお願いします。  

コンソールから`node -v`と`npm -v`をして正常に動作するか確認して下さい。  
動作が確認できたら、`npm install`で自動的にcoffee-scriptが導入されます。  
導入が完了したら`coffee -v`で動作の確認をしてください。  

### build command
ビルドはcoffeeコマンドが使用可能の状態で  
`. ./build.sh`で行うことができます。  
~~ビルドはcoffeeコマンドで行うことが出来ます。~~  
~~`coffee -o ./src/js -c src/coffee/*.coffee`~~  
~~これでsrc/jsフォルダにコンパイルされたJavascriptファイルが出力されます。~~  
後はindex.htmlを開けば画面が出てくるはずです。  

### How to use
画面を(クリック|タッチ)すれば、下部にメニューが表示されるので、そこからメインメニューを開けます  
後は見たほうが早いです。  
~~index.htmlにGETパラメータを指定することで駅名を指定できます。~~  
~~例:吉祥寺駅にしたい場合 `index.html?station=kichijoji`~~  
~~src/coffee/Text.coffeeに記述されている駅が利用することが出来ます。~~  
~~また、そこに駅名を記述することで駅を追加することができます。~~  

## TODO

~~enchant.jsを使用しているのですが、Label周りがとっても汚いため、誰か書きなおしてプルリク下さいお願いします。~~  
tnlib.jsで書きなおすと同時にリポジトリ作りなおしました。  
font周りをどうにかしたいのと、Monacaか何かを使ってAndroid版とiPhone版をリリースしようかと思ってる。  
ブラウザで表示できるので、鯖に置いても良いのだが、ブラウザの上のバーを消せないと面白くない。  

## License
このソフトウェアはMITライセンスでリリースされています。詳細はLICENSE.mdを参照

This software is released under the MIT License, see LICENSE.md.  