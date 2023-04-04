import { Controller } from "@hotwired/stimulus"
import mapboxgl from 'mapbox-gl' // Don't forget this!

  export default class extends Controller {
    static values = {
      apiKey: String,
      markers: Array
    }

    connect() {
      mapboxgl.accessToken = this.apiKeyValue

      this.map = new mapboxgl.Map({
        container: this.element,
        style: "mapbox://styles/ju-dev/clg2d3pwe002d01mwcmss3tv7",
        center: [2.00714, 47.101435],
        zoom: 4.25,
      })
    }

  }
