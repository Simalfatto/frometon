import { Controller } from "@hotwired/stimulus"
import mapboxgl from 'mapbox-gl' // Don't forget this!

  export default class extends Controller {
    static values = {
      apiKey: String,
      markers: Array
    }

    connect() {
      mapboxgl.accessToken = this.apiKeyValue

      const map = new mapboxgl.Map({
        container: this.element,
        style: "mapbox://styles/ju-dev/clg2b42i801gs01pexus8zesb",
        center: [2.00714, 47.101435],
        zoom: 4.25,
      })

      map.on('style.load', () => {

        map.addSource('regions', {
          "type": 'geojson',
          'data': 'https://france-geojson.gregoiredavid.fr/repo/regions.geojson',
        });

        map.addLayer({
          'id': 'regions',
          'type': 'fill',
          'source': 'regions',
          'paint': {
          'fill-color': '#fff',
          'fill-outline-color': '#11101E'
          }
          });
      });

      this.map = map

      map.on('click', 'regions', (e) => {
        const regionName = e.features[0].properties.nom;
        const url = `cheeses?query=${encodeURIComponent(regionName)}`

        fetch(url)
        .then(response => response.text())
        .then(data => {
          console.log(data)
        })
      });
    }
  }
