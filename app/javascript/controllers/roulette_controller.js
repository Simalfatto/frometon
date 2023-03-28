import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="roulette"
export default class extends Controller {
  static targets = ["parameters"]

  display() {
    console.log(this.parametersTarget)
    this.parametersTarget.classList.toggle("d-none")
  }

}
