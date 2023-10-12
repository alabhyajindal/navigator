// const data = {
//   "features": [
//     {
//       "type": "Feature",
//       "properties": {
//         "title": "Lincoln Park",
//         "description": "A northside park that is home to the Lincoln Park Zoo"
//       },
//       "geometry": {
//         "coordinates": [-87.637596, 41.940403],
//         "type": "Point"
//       }
//     },
//     {
//       "type": "Feature",
//       "properties": {
//         "title": "Grant Park",
//         "description": "A downtown park that is the site of many of Chicago's favorite festivals and events"
//       },
//       "geometry": {
//         "coordinates": [-87.619185, 41.876367],
//         "type": "Point"
//       }
//     },
//     {
//       "type": "Feature",
//       "properties": {
//         "title": "Humboldt Park",
//         "description": "A large park on Chicago's northwest side"
//       },
//       "geometry": {
//         "coordinates": [-87.70199, 41.905423],
//         "type": "Point"
//       }
//     },
//   ],
//   "type": "FeatureCollection"
// }
//
// mapboxgl.accessToken = 'pk.eyJ1IjoiYWxhYmh5YWppbmRhbCIsImEiOiJjbG5sYjk1b28waWc0MmxwYm9ocTR2cXRxIn0.-OJ40jmCpxQ6ndHh9MWM9g';
// var map = new mapboxgl.Map({
//   container: 'map',
//   style: 'mapbox://styles/mapbox/light-v11',
//   center: data.features[data.features.length - 1]?.geometry
//     ?.coordinates || [14.421253, 50.087465],
//   zoom: 5,
// });
//
// for (const [_index, feature] of data.features.entries()) {
//   const el = document.createElement('div')
//   el.className = 'marker'
//   new mapboxgl.Marker(el).setLngLat(feature.geometry.coordinates).addTo(map)
// }

