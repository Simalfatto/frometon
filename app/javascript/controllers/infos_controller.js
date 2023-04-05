import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="infos"
export default class extends Controller {
  static targets = ["info"]
  infoSlide() {
    this.infoTarget.classList.add("show");
    document.addEventListener('click', this.closeDiv.bind(this));
  }
  closeDiv(event) {
    if (!this.element.contains(event.target)) {
      this.infoTarget.classList.remove('show');
      document.removeEventListener('click', this.closeDiv);
    }
  }
}
