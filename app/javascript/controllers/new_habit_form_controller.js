import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="new-habit-form"
export default class extends Controller {
  static targets = ['newHabitBtn', 'bgOverlay', 'popUpForm', 'submitBtn',  'form']
  connect() {
  }

  submit(){
    this.formTarget.requestSubmit()
  }

  reset(){
    this.formTarget.reset()
    this.closeForm({target: this.bgOverlayTarget})
  }

  openForm() {
    this.bgOverlayTarget.classList.remove('hidden')
    this.popUpFormTarget.classList.remove('close-form')
    this.popUpFormTarget.classList.add('open-form')
  }

  closeForm(e = {}) {
    if (e.target == this.bgOverlayTarget) {
      this.popUpFormTarget.classList.remove('open-form')
      this.popUpFormTarget.classList.add('close-form')
      setTimeout(() => {
        this.bgOverlayTarget.classList.add('hidden')
      }, [100])
    }
  }

}
