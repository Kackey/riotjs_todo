// riot.routeは下記の場合に動作する
// 1.新しいURLが、ブラウザのロケーションバーに入力されたとき
// 2.ブラウザの戻る/進むボタンが押されたとき
// 3.route(to)が呼び出されたとき
// 4.アンカータグ<a>がクリックされたとき
// 参考 : http://riotjs.com/ja/api/route/#riotroutecallback
riot.route(function(collection, id){
  // riot.mount(selector, tagName, [opts])
  // http://riotjs.com/ja/api/#a-namemount-taga-riotmountselector-tagname-opts
  riot.mount('route', collection || 'home', {id: id})
  riot.mount('navi', 'navi')
})

// ルーティングスタート
// URL変更の検知を開始する
// http://riotjs.com/ja/api/route/#riotroutestart
riot.route.start(true)

// Store
var store = {
  "todos" : [
    {"id": Date.now()+1, "done": false, "todo": "React"},
    {"id": Date.now()+2, "done": false, "todo": "Angular"},
    {"id": Date.now()+3, "done": false, "todo": "Riot"},
    {"id": Date.now()+4, "done": true, "todo": "Mythril"},
    {"id": Date.now()+5, "done": true, "todo": "Vue"}
  ]
}

// storeの変更を監視できるように、Observableに登録する
riot.observable(store)
