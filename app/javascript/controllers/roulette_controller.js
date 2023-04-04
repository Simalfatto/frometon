import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="roulette"
export default class extends Controller {
  static targets = ["svg", "form", "parameters", "button", "btn2"];
  static values = { acceleration: Number };

  connect() {
    this.currentRotation = - 6;
    this.accelerationValue = this.accelerationValue || 1;
    this.svgTarget.style.transform = `rotate(${this.currentRotation}deg)`;
  }

  rotate() {
    this.currentRotation += Math.floor(Math.random() * 400 + 600) * this.accelerationValue;
    this.accelerationValue += 0.5;
    this.svgTarget.style.transform = `rotate(${this.currentRotation}deg)`;
    setTimeout(() => {
      this.formTarget.submit();
    }, 2000);
  }

  rotateBis(event) {
    event.preventDefault()
    this.currentRotation += Math.floor(Math.random() * 400 + 600) * this.accelerationValue;
    this.accelerationValue += 0.5;
    this.svgTarget.style.transform = `rotate(${this.currentRotation}deg)`;
    setTimeout(() => {
      location.href = "/result?search_all"
    }, 2000);
  }

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
