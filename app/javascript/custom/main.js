document.documentElement.addEventListener("turbo:load", async function (e) {
  // Hack to run this file where originally intended. Not able to find documentation to keep this scoped when using Turbo
  if (window.location.pathname === '/') {
    console.log('Source: https://github.com/alabhyajindal/navigator')
    const res = await fetch('/api/locations', {method: 'GET'})
    const data = await res.json()
    const locationsData = data.data

    mapboxgl.accessToken = 'pk.eyJ1IjoiYWxhYmh5YWppbmRhbCIsImEiOiJjbG5tcmYweW0ya2ZzMmxybDJwYTczZTUzIn0.v3HHB3BcrxYP4TRUJV1Qqw';
    const map = new mapboxgl.Map({
      container: 'map', // container ID
      style: 'mapbox://styles/mapbox/outdoors-v12', // style URL
      center: locationsData[locationsData.length - 1], // starting position [lng, lat]
      zoom: 2, // starting zoom
    });

    function drawPoints(locationsData) {
      for (const location of locationsData) {
        const el = document.createElement('div')
        el.className = 'marker'
        new mapboxgl.Marker(el).setLngLat(location).addTo(map)
      }
    }

    drawPoints(locationsData)
  }
})