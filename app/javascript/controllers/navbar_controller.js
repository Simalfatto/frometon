import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="navbar"
export default class extends Controller {
  static targets = ["value", "logo"]

  connect() {
    this.valueTarget.value = ""
  }
  display() {
    this.logoTarget.classList.add("d-none");
  }
}
