import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="slide-cards"
export default class extends Controller {

  static targets = ["recipes", "wine", "story"]

  slideOn(event) {
    if (event.target.innerText === "Recettes"){
      this.recipesTarget.classList.add("show");
    } else if (event.target.innerText === "Vins") {
      this.wineTarget.classList.add("show");
    } else if (event.target.innerText === "Histoire") {
      this.storyTarget.classList.add("show");
    }
  }

  slideOff(event){
    if (event.target.id == "recipes-list"){
      this.recipesTarget.classList.remove("show");
    }else if (event.target.id == "wine-list") {
      this.wineTarget.classList.remove("show");
    } else if (event.target.id == "story-list") {
      this.storyTarget.classList.remove("show");
    }
}}
