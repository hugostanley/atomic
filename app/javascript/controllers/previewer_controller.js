import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="previewer"
export default class extends Controller {
  static targets = ['daily', 'weekly', 'monthly']
  initialize(){
    const urlParams = new URLSearchParams(window.location.search)
    const viewParam = urlParams.get('view')
    if(viewParam == 'daily' || !viewParam ){
      this.index = 0
    } else if(viewParam == 'weekly') {
      this.index = 1
    } else {
      this.index = 2
    }
    this.toggleActive()
  }

  changeIndex(event){
    this.index = event.params.index
    this.toggleActive()
  }

  toggleActive(){
    switch(this.index){
      case 0:
        this.dailyTarget.classList.add('bg-gray-200')
        this.weeklyTarget.classList.remove('bg-gray-200')
        this.monthlyTarget.classList.remove('bg-gray-200')
        break
      case 1:
        this.dailyTarget.classList.remove('bg-gray-200')
        this.weeklyTarget.classList.add('bg-gray-200')
        this.monthlyTarget.classList.remove('bg-gray-200')
        break
      case 2:
        this.dailyTarget.classList.remove('bg-gray-200')
        this.weeklyTarget.classList.remove('bg-gray-200')
        this.monthlyTarget.classList.add('bg-gray-200')
        break
    }
  }
}
