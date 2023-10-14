mapboxgl.accessToken = 'pk.eyJ1IjoiYWxhYmh5YWppbmRhbCIsImEiOiJjbG5tcmYweW0ya2ZzMmxybDJwYTczZTUzIn0.v3HHB3BcrxYP4TRUJV1Qqw';
const map = new mapboxgl.Map({
  container: 'map', // container ID
  style: 'mapbox://styles/mapbox/outdoors-v12', // style URL
  center: [77.209006, 28.613895], // starting position [lng, lat]
  zoom: 2, // starting zoom
});

document.body.style.backgroundColor = 'tomato'

const res = await fetch('/api/locations', {method: 'GET'})
const data = await res.json()

function drawPoints(locationsData) {
  console.log(locationsData)
  for (const location of locationsData) {
    const el = document.createElement('div')
    el.className = 'marker'
    new mapboxgl.Marker(el).setLngLat(location).addTo(map)
  }
}

drawPoints(data.data)