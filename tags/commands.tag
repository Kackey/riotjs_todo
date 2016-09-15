<!-- <commands>
  <div if={opts.todo.done}>
    <i onclick={this.reopen} class="fa fa-flag-o" aria-hidden="true"></i>
    <i onclick={this.edit} class="fa fa-pencil-square-o" aria-hidden="true"></i>
    <i onclick={this.delete} class="fa fa-times" aria-hidden="true"></i>
  </div>
  <div if={!opts.todo.done}>
    <i onclick={this.done} class="fa fa-flag" aria-hidden="true"></i>
    <i onclick={this.edit} class="fa fa-pencil-square-o" aria-hidden="true"></i>
    <i onclick={this.delete} class="fa fa-times" aria-hidden="true"></i>
  </div>
  <script>
    edit() {
      // 3.route(to)が呼び出されたとき
      riot.route(`edit/${opts.todo.id}`)
    }
    reopen() {
      opts.todo.done = false
      store.todos = store.todos.filter(function(s) {return s.id != opts.todo.id})
      store.todos.unshift(opts.todo)
      // refreshイベントを発火させる
      store.trigger('refresh')
    }
    done() {
      opts.todo.done = true
      store.todos = store.todos.filter(function(s) {return s.id != opts.todo.id})
      store.todos.push(opts.todo)
      // refreshイベントを発火させる
      store.trigger('refresh')
    }
    delete() {
      store.todos = store.todos.filter(function(s) {return s.id != opts.todo.id})
      // refreshイベントを発火させる
      store.trigger('refresh')
    }
  </script>
</commands> -->
