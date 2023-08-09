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
    let percentage = (this.amountValue / this.frequencyValue) * 100
    this.habitDivTarget.style.background = `linear-gradient(90deg, rgb(74 222 128) ${percentage}%, rgb(255 255 255) ${percentage}%)`
  }

  fillColor(){

  }

}
