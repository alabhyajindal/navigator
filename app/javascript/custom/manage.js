document.body.style.backgroundColor = 'lightblue'

const input = document.getElementById('search-input')
const search = document.getElementById('search-button')
const suggestionsContainer = document.getElementById('suggestions')

search.addEventListener('click', async (e) => {
  const query = input.value
  const res = await fetch(`https://api.mapbox.com/geocoding/v5/mapbox.places/${query}.json?proximity=ip&types=place%2Clocality&access_token=pk.eyJ1IjoiYWxhYmh5YWppbmRhbCIsImEiOiJjbG5tcmYweW0ya2ZzMmxybDJwYTczZTUzIn0.v3HHB3BcrxYP4TRUJV1Qqw`)
  const data = await res.json()
  showSuggestions(data.features)
})

function showSuggestions(suggestions) {
  suggestionsContainer.innerHTML = ''
  const placesNames = suggestions.map(s => {
    const p = document.createElement('p')
    p.textContent = s.place_name
    p.id = 'suggestion'
    suggestionsContainer.appendChild(p)

    p.addEventListener('click', (e) => {
      selectSuggestion(s)
    })
  })
}

async function selectSuggestion(suggestion) {
  const token = document.querySelector('meta[name="csrf-token"]')
  await fetch('/locations', {
    method: 'POST',
    body: JSON.stringify(suggestion.geometry),
    headers: {'Content-Type': 'application/json', 'X-CSRF-Token': token.content }
  }).then(() => {
    location.reload()
  })
}