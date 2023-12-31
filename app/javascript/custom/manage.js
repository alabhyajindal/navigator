document.documentElement.addEventListener("turbo:load", async function (e) {
    // Hack to run this file where originally intended. Not able to find documentation to keep this scoped when using Turbo
    if (window.location.pathname === '/manage') {

      const input = document.getElementById('search-input')
      const search = document.getElementById('search-button')
      const suggestionsContainer = document.getElementById('suggestions')

      input.addEventListener('keydown', async (e) => {
        handleInput(e)
      })

      search.addEventListener('click', (e) => {
        handleInput(e)
      })

      async function handleInput(e) {
        if (e.key === 'Enter') {
          const query = input.value
          const res = await fetch(`https://api.mapbox.com/geocoding/v5/mapbox.places/${query}.json?proximity=ip&types=place%2Clocality&access_token=pk.eyJ1IjoiYWxhYmh5YWppbmRhbCIsImEiOiJjbG5tcmYweW0ya2ZzMmxybDJwYTczZTUzIn0.v3HHB3BcrxYP4TRUJV1Qqw`)
          const data = await res.json()
          showSuggestions(data.features)
        }
      }

      function showSuggestions(suggestions) {
        if (suggestions.length === 0) {
          alert('No matching locations found.')
          input.value = ''
        }
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
        const body = {
          data: {
            coordinates: suggestion.geometry.coordinates,
            city: suggestion.place_name
          }
        }
        const res = await fetch('/locations', {
          method: 'POST',
          body: JSON.stringify(body),
          headers: {'Content-Type': 'application/json', 'X-CSRF-Token': token.content}
        })
        const data = await res.json()
        if (data.status === 'success') {
          alert('Location added!')
        } else {
          alert('Location already added!')
        }
        suggestionsContainer.innerHTML = ''
        input.value = ''
        input.focus()
        location.reload()
      }
    }
  }
)
