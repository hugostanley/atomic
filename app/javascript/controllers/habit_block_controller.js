import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="habit-block"
export default class extends Controller {
  static values = {
    amount: Number,
    frequency: Number
  }
  initialize(){
  }
  connect() {
    console.log(this.amountValue)
    console.log(this.frequencyValue)
  }
}
