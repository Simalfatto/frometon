import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="roulette"
export default class extends Controller {
  static targets = ["parameters", "button"]

  display() {
    console.log(this.buttonTarget)
    this.parametersTarget.classList.toggle("d-none")
    this.buttonTarget.classList.toggle("d-none")
  }

}
