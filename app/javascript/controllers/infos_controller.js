import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="infos"
export default class extends Controller {
  static targets = ["info"]
  infoSlide() {
    this.infoTarget.classList.add("show");
  }
  slideOff (event) {
      this.infoTarget.classList.remove('show');
  }
}
