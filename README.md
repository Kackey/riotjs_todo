# Riot.js を利用してTODOアプリケーション構築のハンズオンを作成しました #riotjs



# デモ

[http://omiend.github.io/riotjs_todo/](http://omiend.github.io/riotjs_todo/)



# はじめに

### Riot.jsとは

関連するHTMLとJavaScriptを結合し、再利用可能なコンポーネントとしてまとめたカスタムタグを利用してアプリケーションを構築することができる、超軽量Webフレームワークです。

[http://riotjs.com/ja/](http://riotjs.com/ja/)



### カスタム・タグ

Viewと対になるScriptを、一つのタグに定義したものです。

```
┏━━━━━━━━━━━━━━━┓
┃HTML                          ┃
┃                              ┃
┃  ┏━━━━━━━━━━━┓  ┃
┃  ┃Custom Tag            ┃  ┃
┃  ┃                      ┃  ┃
┃  ┃  ┏━━━━━━━┓  ┃  ┃
┃  ┃  ┃Custom Tag    ┃  ┃  ┃
┃  ┃  ┃              ┃  ┃  ┃
┃  ┃  ┃  ┏━━━┓  ┃  ┃  ┃
┃  ┃  ┃  ┃HTML  ┃  ┃  ┃  ┃
┃  ┃  ┃  ┣━━━┫  ┃  ┃  ┃
┃  ┃  ┃  ┃Script┃  ┃  ┃  ┃
┃  ┃  ┃  ┗━━━┛  ┃  ┃  ┃
┃  ┃  ┃              ┃  ┃  ┃
┃  ┃  ┗━━━━━━━┛  ┃  ┃
┃  ┃                      ┃  ┃
┃  ┃  ┏━━━━━━━┓  ┃  ┃
┃  ┃  ┃HTML          ┃  ┃  ┃
┃  ┃  ┣━━━━━━━┫  ┃  ┃
┃  ┃  ┃Script        ┃  ┃  ┃
┃  ┃  ┗━━━━━━━┛  ┃  ┃
┃  ┃                      ┃  ┃
┃  ┗━━━━━━━━━━━┛  ┃
┃                              ┃
┗━━━━━━━━━━━━━━━┛
```

### コンパイラ

インブラウザ・コンパイルとプリコンパイルから選べます。
私は普段、Webpackでプリコンパイル（＆トランスパイル）させて、BundleされたJSを読み込むようにしています。
このハンズオンでは環境構築を簡素化するために、表示時にコンパイルされるインブラウザ・コンパイルを採用しています。

[http://riotjs.com/ja/api/compiler/](http://riotjs.com/ja/api/compiler/)



### ルーティング

ルーティングにはriot.routeを利用します。

下記アクションでURLが変更されると、与えられたcallback関数を実行します。

- 1.新しいURLが、ブラウザのロケーションバーに入力されたとき
- 2.ブラウザの戻る/進むボタンが押されたとき
- 3.route(to)が呼び出されたとき
- 4.アンカータグ<a>がクリックされたとき

当TODOアプリにおいては、URLの変更を検知→URLの状態を受け取り、callback関数にてカスタム・タグをマウントさせています。

```javascript
// 例えば、‘todo/1000/edit’にアクセスすると
// collection=‘todo’; id=‘1000’; action=’edit’がバインドされる
riot.route(function(collection, id, action){
  riot.mount('route', collection || 'home', {id: id})
})
```

参考までに、私は普段riot-routerを利用しています。

[riot-router](https://github.com/gabrielmoreira/riot-router)

こちらも気になっています。

[riot-routehandler](https://github.com/crisward/riot-routehandler)



# ハンズオン

### 注意点

独学なので、Riot.jsのお作法に則っていない可能性があります（お作法がアレば、の話ですが）

Global変数をそのまま触っており（良くない）、JavaScriptについては割りと~~乱暴に~~お手軽に実装しています。

※observableを利用して、fluxを取り入れるべきだなぁとは感じています。

また、ローカル環境においては、カスタムタグを外部ファイルとして読み込むため


```html
<script type="riot/tag" src="tags/home.tag"></script>
```

Google Chromeで起動すると下記のエラーが発生し、正常に動作しない可能性があります。

その際は、Google Chrome起動時に`--allow-file-access-from-files`を引数を指定して起動するか、Firefoxなどの別のブラウザでお試し下さい。

```shell
riot+compiler.min.js:2 XMLHttpRequest cannot load file://hoge-hoge/riotjs_todo/tags/home.tag. Cross origin requests are only supported for protocol schemes: http, data, chrome, chrome-extension, https, chrome-extension-resource.
```

Python（MacOSならば標準搭載）を利用し、SimpleServerを利用する手もあります。

[知らなかったPythonのSimpleServer](http://omiend.hatenablog.jp/entry/2016/09/13/203000)



### ローカル環境で動かしましょう

- [https://github.com/omiend/riotjs_todo](https://github.com/omiend/riotjs_todo)にアクセス

- Zipダウンロード → 解凍

```
git clone git@github.com:omiend/riotjs_todo.git でもどうぞ
```

- index.htmlをブラウザで開く



### 構成
```
.
├── css
│   ├── main.css      // ページの整形用に
│   ├── normalize.css // https://necolas.github.io/normalize.css/
│   └── skeleton.css  // わたくしomiendが好きな、軽量CSSフレームワークです（ http://getskeleton.com/）
├── images
│   └── riotjs.png    // riotをイメージした画像
├── index.html         // ブラウザが一番初めに読み込む単純なHTMLファイルです
├── scripts
│   └── app.js        // ルーティングと、予め登録されたデータを格納しています
└── tags               // カスタム・タグを配置しているディレクトリです
      ├── add.tag      // TODOデータの追加を行うカスタム・タグです
      ├── commands.tag // TODOデータに対して何らかの処理を行うコマンドを集めたカスタム・タグです
      ├── edit.tag     // TODOデータを更新するためのフォームが定義されたカスタム・タグです
      ├── home.tag     // ホーム画面を表示するための簡単なHTMLが定義されたカスタム・タグです
      ├── navi.tag     // ナビバーの単純なHTMLが定義されたカスタム・タグです
      └── todo.tag     // TODOデータを一覧したりなど、TODOアプリの基盤画面を定義したカスタム・タグです
```



### index.html

ブラウザで一番初めに読み込むファイルです。

内容は単純なHTMLですが、下記の要素が定義されています。

```html
<!-- カスタムタグがマウントされるセレクター 名称はrouteでなくても良いです -->
<route></route>
<!-- Riot.js本体と、コンパイラをCDNで読み込み -->
<script src="https://cdn.jsdelivr.net/riot/2.6/riot+compiler.min.js"></script>
<!-- ルーティングなどの読み込み -->
<script src="scripts/app.js" defer></script>
```



### tag/navi.tag

こちらは本当に単純なHTMLです。

コメントアウトを解除し、画面にナビバーが表示されることを確認してください。
正しく表示されていれば、naviタグが正しくマウントされているということです。



### tag/home.tag

ルーティング設定によって、「/」にアクセスされた時に<route>にマウントされるタグです。

同タグ内のScriptにて‘Riot.js’という値を返す関数「echo()」が定義されています。

「<h5>I Love {this.echo()} !</h5>」にて当該関数を実行し、 ‘Riot.js’を受け取ってレンダリングしています。

単純な例ですが、カスタム・タグの基本がわかると思います。



### tag/todo.tag

TODOアプリケーションの基盤的なカスタム・タグです。

まず、riotが提供するeachによってTODOデータをループし、表示しています。

```html
<div class="row" each={todo in store.todos}>
```

一行ごとにcommandsタグをマウントさせています。

commandsタグはtodoという名前を引数として、ループ中のtodoを受け取っています。

```html
<commands todo={todo}></commands>
```



### tag/commands.tag

todoタグから受け取ったTODOデータは、optsというriotが提供する特別な変数に格納されます。

optsは、Reactで言う所のpropsのイメージです。

```html
<div if={opts.todo.done}><!-- doneがtrueだったらレンダリング -->
```

commandsタグは、TODOデータに対してアクションを行うボタンを提供するために実装したカスタム・タグです。

editTagを<route>にマウントさせるために呼び出される関数。
フラグを更新する関数。
TODOデータを削除する関数を定義しています。

一つのカスタム・タグが、各行で各TODOデータのみを利用する動きとなっており、コンポーネントの再利用を意識した作りとしています。



### tag/add.tag

addタグがマウントされる<add>はtodoタグ内に定義されているので、addタグは子タグと呼べます。

子タグは親タグ（todoタグ）がマウントされた後に初期化されます。

TODO内容を入力し、ADDボタンがクリックされると、addタグに定義されたadd関数が実行され、storeに入力内容を保存します。

実はその後の「 `store.trigger('refresh')` 」が大切な処理です。

sroreはapp.jsにてobservableのオブジェクトとしており、add実行時にtriggerを実行することによって `refresh` イベントを発火させています。

```javascript
riot.observable(store)
```

storeに対する `refresh` イベントが発火されると、todoタグに定義された下記のcallback関数が実行され、todoタグが自身を更新し、TODO一覧に追加したTODOデータが表示されるという仕組みになっています。

```javascript
var self = this // callbackの中でtodoタグを参照するため
store.on('refresh', function(){
  self.update() // todoタグを更新
})
```

オブザーバブル（Observable）について
[http://riotjs.com/ja/api/observable/](http://riotjs.com/ja/api/observable/)



### tag/edit.tag

これまでの説明以上の目新しいことはしていません。

コメントアウトを解除して、更新画面が表示されることを確認してください。

commandsタグからリクエストパラメータでeditタグを呼び出し・・・

```javascript
edit() {
  riot.route(`edit/${opts.todo.id}`)
}
```

```javascript
riot.route(function(collection, id, action){
  // collection = edit
  // id = commandsタグの${opts.todo.id}で取得されたTODOデータのID
  riot.mount('route', collection || 'home', {id: id})
})
```

TODOデータのIDを `opts` を利用して受け取っています。

```javascript
opts.form = store.todos.filter(function(s){return s.id == opts.id})[0]
```



# 参考にさせていただいたモノ

### 基礎

- [オフィシャルサイト](http://riotjs.com/ja/)
- [オフィシャルのソースレベルの実装例集](https://github.com/riot/examples)
- [martinmuzatkoさんのチートシートなど](http://martinmuzatko.github.io/riot-cheatsheet/)
- [martinmuzatkoさんのチートシートなど](http://happy-css.com/lessons/riotjs/)
- [Qiitaの `riot` タグ](http://qiita.com/tags/riot)


### Router周り
- [https://github.com/gabrielmoreira/riot-router](https://github.com/gabrielmoreira/riot-router)
- [https://github.com/crisward/riot-routehandler](https://github.com/crisward/riot-routehandler)
- [https://codepen.io/crisward/pen/xwGJpM](https://codepen.io/crisward/pen/xwGJpM)</pre>
