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
        const url = `cheeses?region=${encodeURIComponent(regionName)}`

        const div = document.getElementById('fromage-list-region')
        const close = document.getElementById('icon-cross-region')
        const cheeses = document.getElementById('wrapper-child-region')
        div.classList.add('show')

        close.addEventListener("click", () => {
          div.classList.remove('show')
          cheeses.innerHTML = ""
        })

        fetch(url)
        .then(response => response.json())
        .then(fromages => {
          console.log(fromages)
          fromages.forEach(element => {
            const divCheese = document.createElement('div');
            divCheese.classList.add("card-body");
            console.log(divCheese)
            const img = document.createElement("img");
            divCheese.appendChild(img)
            img.classList.add("card-img-top");
            img.src = element.picture_url;
            console.log(divCheese)
            const titre = document.createElement("h5");
            divCheese.appendChild(titre)
            titre.innerText = element.name;
            console.log(divCheese)
            console.log(typeof divCheese)

            cheeses.appendChild(divCheese);
          });
        })
      });
    }
  }
