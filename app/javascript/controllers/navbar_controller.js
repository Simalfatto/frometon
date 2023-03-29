import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="navbar"
export default class extends Controller {
  static targets = ["value"]

  connect() {
    this.valueTarget.value = ""
  }
}
