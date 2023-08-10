import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="report-graph"
export default class extends Controller {
  static values = {
    percentage: Number
  }

  connect() {
    if (this.percentageValue < 20) {
      this.element.style.backgroundColor = '#EBEDF0'
      return
    } else if (this.percentageValue < 40) {
      this.element.style.backgroundColor = '#9be9a8'
      return
    } else if (this.percentageValue < 60) {
      this.element.style.backgroundColor = '#30c463'
      return
    } else if(this.percentageValue < 80) {
      this.element.style.backgroundColor = '#30a14e'
      return
    } else if(this.percentageValue <= 100){
      this.element.style.backgroundColor = '#216e39'
    }
  }

}
