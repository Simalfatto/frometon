import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="navbar"
export default class extends Controller {
  static targets = ["value", "logo", "link"]

  connect() {
    this.valueTarget.value = ""
  }
  display() {
    this.logoTarget.classList.add("no-display");
    document.addEventListener("click", this.handleClickOutside.bind(this));
  }

  handleClickOutside(event) {
    // Check if the click happened outside the form
    if (!event.target.closest("form")) {
      // Remove the "d-none" class from the logo element
      setTimeout(() => {
        this.logoTarget.classList.remove("no-display");
      }, 1000);

      // Remove the event listener from the document
      document.removeEventListener("click", this.handleClickOutside.bind(this));
    }
  }
  displayLink() {

    this.linkTarget.classList.toggle("d-none")
    // recuperer div allLink(target)
    // enlever la class d'none
  }
}
