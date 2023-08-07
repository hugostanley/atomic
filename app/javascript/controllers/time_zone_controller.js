import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="time-zone"
export default class extends Controller {
  connect() {
    this.element.value = Intl.DateTimeFormat().resolvedOptions().timeZone
  }
}
