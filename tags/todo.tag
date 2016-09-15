<!-- <todo>
  <add></add>
  <div class="row" each={todo in store.todos}>
    <div class="row">
      <div class="todo ten columns">
        <i if={todo.done} onclick={this.done} class="fa fa-flag" aria-hidden="true"></i>
        <i if={!todo.done} onclick={this.done} class="fa fa-flag-o" aria-hidden="true"></i>
        &nbsp;{todo.todo}
      </div>
      <div class="todo two columns"><commands todo={todo}></commands></div>
    </div>
  </div>
  <div class="row"><div class="ten columns">&nbsp;</div></div>
  <div class="row">
    <div class="ten columns">&nbsp;</div>
    <div class="two columns">
      <button onclick={this.clean}><i class="fa fa-flag" aria-hidden="true"></i>&nbsp;clean</button>
    </div>
  </div>
  <script>
    // clean() {
    //   // storeを直接触っているが、かなり乱暴な実装。Fluxを導入したい。
    //   store.todos = store.todos.filter(function(s){return !s.done})
    //   // 下記の様にもかけるが、Safariで動かなくなってしまう（Bable等を利用してプリコンパイルすると良い）
    //   // store.todos = store.todos.filter((s) => !s.done)
    // }
    var self = this
    // 監視を始める
    store.on('refresh', function(){
      self.update()
    })
  </script>
</todo> -->
