import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="report-graph"
export default class extends Controller {
  static values = {
    percentage: Number
  }

  connect() {
    if (this.percentageValue < 25) {
      this.element.style.backgroundColor = 'rgb(187 247 208'
      return
    } else if (this.percentageValue < 50) {
      this.element.style.backgroundColor = 'rgb(22 163 74)'
      return
    } else if (this.percentageValue < 75) {
      this.element.style.backgroundColor = 'rgb(22 101 52)'
      return
    } else if(this.percentageValue <= 100) {
      this.element.style.backgroundColor = 'rgb(5 46 22)'
      return
    }
  }

}
