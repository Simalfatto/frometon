import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="slide-cards"
export default class extends Controller {

  static targets = ["recipes", "wine", "story", "card", "tinderButtons", "cheeseButtons", "iconCross", "signIn"]

  slideOn(event) {
    if (event.target.innerText === "Recettes"){
      this.recipesTarget.classList.add("show");
      this.iconCrossTarget.classList.add("d-none");
    } else if (event.target.innerText === "Vins") {
      this.wineTarget.classList.add("show");
      this.iconCrossTarget.classList.add("d-none");
    } else if (event.target.innerText === "Histoire") {
      this.storyTarget.classList.add("show");
      this.iconCrossTarget.classList.add("d-none");
    }
  }

  slideOff(event){
    if (event.target.id == "icon-cross-recipe"){
      this.recipesTarget.classList.remove("show");
      this.iconCrossTarget.classList.remove("d-none");
    }else if (event.target.id == "icon-cross-wine") {
      this.wineTarget.classList.remove("show");
      this.iconCrossTarget.classList.remove("d-none");
    } else if (event.target.id == "icon-cross-story") {
      this.storyTarget.classList.remove("show");
      this.iconCrossTarget.classList.remove("d-none");
    }
  }

  user(){
    this.cardTarget.classList.toggle('mini');
    this.cheeseButtonsTarget.classList.toggle('remove');
    this.tinderButtonsTarget.classList.toggle('display');
    this.iconCrossTarget.classList.toggle('none');
  }

  visitor(){
    this.cardTarget.classList.toggle('mini');
    this.cheeseButtonsTarget.classList.toggle('remove');
    this.signInTarget.classList.add('display');
    this.iconCrossTarget.classList.add('none');
  }
}
