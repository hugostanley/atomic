import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="habit-block"
export default class extends Controller {
  static values = {
    amount: Number,
    frequency: Number
  }

  static targets = ['habitDiv', 'bgDiv', 'habitBlockMoreBtn', 'deleteBtn']
  initialize() {
  }
  connect() {
  }

  fillColor(){

  }

  toggleMoreDropdown(e){
    this.deleteBtnTarget.classList.toggle('hidden')
  }
}
