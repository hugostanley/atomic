import { Controller } from "@hotwired/stimulus"
import Rails from '@rails/ujs'
import Sortable from 'sortablejs'

// Connects to data-controller="drag-list"
// DISABLE FOR NOW!!!
export default class extends Controller {
  initialize(){
  }

  connect() {
   //this.sortable =  Sortable.create(this.element, {
   //   onEnd: this.end.bind(this)
   // })
  }

  end(e){
    //const id = e.item.dataset.id
    //const data = new FormData()
    //data.append("position", e.newIndex + 1)
    //Rails.ajax({
    //  url: `/move/habit/${id}`,
    //  type: 'PATCH',
    //  data
    //})
  }
}
