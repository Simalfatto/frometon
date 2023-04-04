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
        container: "map",
        style: "mapbox://styles/ju-dev/clg2d3pwe002d01mwcmss3tv7",
        center: [2.00714, 47.101435],
        zoom: 4.25,
      })

      map.on('load', () => {
        map.addSource('regions', {
          "type": 'geojson',
          'data': 'https://france-geojson.gregoiredavid.fr/repo/regions.geojson',
        });
      })

      map.addLayer({
        'id': 'regions-layer',
        'type': 'fill',
        'source': 'regions',
        'paint': {
        'fill-color': 'rgba(200, 100, 240, 0.4)',
        'fill-outline-color': 'rgba(200, 100, 240, 1)'
        }
        });
    }

  }
