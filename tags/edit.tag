<!-- <edit>
  <div class="row">&nbsp;</div>
  <ul each={error in opts.errors}><li>{error}</li></ul>
  <div class="row">&nbsp;</div>
  <div class="row">
    <form>
      <div class="row">
        <div class="ten columns">
          <input class="u-full-width" type="text" id="todo" value={opts.form.todo} placeHolder="Java" />
        </div>
        <div class="two columns">
          <button type="submit" onclick={this.edit}>update</button>
        </div>
      </div>
      <div class="row">
        <div class="eight columns">&nbsp;</div>
        <div class="two columns">
          <input type="checkbox" id="done" checked={opts.form.done} />&nbsp;<i class="fa fa-flag" aria-hidden="true"></i>
        </div>
        <div class="two columns">
          <button onclick={this.cancel}>cancel</button>
        </div>
      </div>
    </form>
  </div>
  <script>
    // DBから取得するイメージ
    opts.form = store.todos.filter(function(s){return s.id == opts.id})[0]
    // 更新処理を行う関数
    edit() {
      if (this.todo.value) {
        opts.errors = []
        opts.form = { "id": opts.id, "todo" : this.todo.value, "done": this.done.checked }
        store.todos = store.todos.filter(function(s){return s.id != opts.id})
        store.todos.unshift(opts.form)
        riot.route('todo')
      } else {
        opts.errors = []
        opts.errors.push('required!')
      }
    }
    // キャンセル時
    cancel() {
      riot.route('todo')
    }
  </script>
</edit> -->
