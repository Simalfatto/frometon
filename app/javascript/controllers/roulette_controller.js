import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="roulette"
export default class extends Controller {
  static targets = ["parameters", "button", "btn2"]

  display() {
    this.parametersTarget.classList.toggle("d-none")
    this.buttonTarget.classList.toggle("d-none")
    this.btn2Target.classList.toggle("d-none")
  }

  close() {
    this.parametersTarget.classList.toggle("d-none")
    this.buttonTarget.classList.toggle("d-none")
    this.btn2Target.classList.toggle("d-none")
  }

}
