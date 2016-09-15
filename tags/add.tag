<!-- <add>
  <div class="row">&nbsp;</div>
  <ul each={error in opts.errors}><li>{error}</li></ul>
  <div class="row">
    <form>
      <div class="ten columns"><input class="u-full-width" type="text" name="addTodo" placeHolder="Java" /></div>
      <div class="two columns"><button type="submit" onclick={this.add}><i class="fa fa-flag-o" aria-hidden="true"></i>&nbsp;add</button></div>
    </form>
  </div>
  <script>
    add() {
      if (this.addTodo.value) {
        opts.errors = []
        const newTodo = { "id": Date.now(), "todo" : this.addTodo.value, "done": false }
        store.todos.unshift(newTodo)
        this.addTodo.value = null
        store.trigger('refresh')
      } else {
        opts.errors = []
        opts.errors.push('required!')
      }
    }
  </script>
</add> -->
