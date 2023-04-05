import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="navbar"
export default class extends Controller {
  static targets = ["btn", "btn2", "value", "logo", "link"]

  connect() {
    this.valueTarget.value = ""
  }
  display() {
    console.log("ok")
    this.logoTarget.classList.add("no-display");
    setTimeout(() => {
      this.btnTarget.classList.add("d-none")
      this.btn2Target.classList.remove("d-none")
    }, 500)
    document.addEventListener("click", this.handleClickOutside.bind(this));
  }

  handleClickOutside(event) {
    console.log("ok2")
    // Check if the click happened outside the form
    if (!event.target.closest("form")) {
      // Remove the "d-none" class from the logo element
      this.btnTarget.classList.remove("d-none")
      this.btn2Target.classList.add("d-none")
      setTimeout(() => {
        this.logoTarget.classList.remove("no-display");
      }, 500);

      // Remove the event listener from the document
      document.removeEventListener("click", this.handleClickOutside.bind(this));
    }
  }
  displayLink() {
    this.linkTarget.classList.add("show");
    document.addEventListener('click', this.closeMenu.bind(this));
  }

  closeMenu(event) {
    if (!this.element.contains(event.target)) {
      this.linkTarget.classList.remove('show');
      document.removeEventListener('click', this.closeMenu);
    }
  }
}
