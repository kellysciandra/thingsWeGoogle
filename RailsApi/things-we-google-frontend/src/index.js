const BASE_URL = "http://localhost:3000"
const SEARCHES_URL = `${BASE_URL}/searches`
const USERS_URL = `${BASE_URL}/users`
const FAVORITES_URL = `${BASE_URL}/favorites`
const collectionofSearches = document.querySelector('#searches-collection')
const formContainer = document.querySelector('#search-form')
const collectionOfFavorites = document.querySelector('#favorite-collection')
const likeButton = document.querySelector('.smiley')
const signupForm = document.querySelector('#signup-form')
const searchForm = document.querySelector('#search-form')
const signupInputs = document.querySelectorAll(".signup-input")
const formInputs = document.querySelectorAll(".form-input")
// const header = document.querySelector('.header-banner')
let currentUser
searchForm.style.display = 'none'

class Search {
    constructor(searchAttributes) {
        this.content = searchAttributes.content;
        this.link = searchAttributes.link;
        this.id = searchAttributes.id;
    }

    render() {
        return `<div class="card text-black bg-light mb-3" style="max-length: 50rem;">
                    <div class="card-body text-center">
                      <h5 class="card-title">${this.content}</h5>
                      <h1 data-search-id=${this.id} class="smiley">☺</h1> 
                      <a href="${this.link}"> ---> </a>
                    </div>
                </div > `
    }
}

signupForm.addEventListener('submit', function (e) {
    e.preventDefault()
    fetch(USERS_URL, {
        method: "POST",
        headers: {
            "Content-Type": "application/json",
            Accept: "application/json"
        },
        body: JSON.stringify({
            user: {
                email: signupInputs[0].value,
                // password: signupInputs[1].value
            }
        })
    })
        .then(res => res.json())
        .then(function (object) {
            if (object.message) {
                alert(object.message)
            }
            else {
                loggedInUser(object)
            }
        })
})

function putSearchesOnDom(searchesArrayay) {
    collectionofSearches.innerHTML = `<h5 class="text-muted"> ☺ if you've ever had this thought </h5>
                                    <h5 class="text-muted"> ---> if you really want to see the result</h5 >
                                    <h4 class="favorites-link">View My Favorites ☺</h4>`
    searchesArrayay.forEach(search => {
        collectionofSearches.innerHTML += new Search(search).render()
    })
}


function putFavoritesOnDom(favoritesArray) {
    collectionOfFavorites.innerHTML = `<h2>My Favorites</h2 >
                                       <h3 class="back-link">←Back to List</h3>`
    favoritesArray.forEach(favorite => {
        collectionOfFavorites.innerHTML += `<div class="card">
                                        <div class="card bg-primary">
                                        <div class="card-body text-center">
                                          <h3 class="card-text">${favorite.search.content}</h>
                                          <h6 data-search-id=${favorite.search.id} class="smiley"></h6> 
                                        </div>
                                    </div>`
    })
}

function fetchSearches() {
    fetch(SEARCHES_URL)
        .then(res => res.json())
        .then(searches => putSearchesOnDom(searches))
}

function fetchFavorites() {
    fetch(BASE_URL + '/users/' + currentUser.id + '/favorites')
        .then(res => res.json())
        .then(favorites => putFavoritesOnDom(favorites))
}


collectionofSearches.addEventListener('click', function (e) {
    if (event.target.className == "favorites-link") {
        collectionofSearches.style.display = 'none';
        fetchFavorites();
        collectionOfFavorites.style.display = 'initial';
    }
})

collectionOfFavorites.addEventListener('click', function (e) {
    if (event.target.className == "back-link") {
        collectionOfFavorites.style.display = 'none';
        collectionofSearches.style.display = 'initial';
    }
})

searchForm.addEventListener('submit', function (e) {
    e.preventDefault()
    console.log(e.target)
    console.log(SEARCHES_URL)
    fetch(SEARCHES_URL, {
        method: "POST",
        headers: {
            "Content-Type": "application/json",
            Accept: "application/json"
        },
        body: JSON.stringify({
            content: formInputs[0].value,
        })
    })
        .then(res => res.json())
    fetchSearches()
})

function loggedInUser(object) {
    currentUser = object
    signupForm.style.display = 'none'
    welcome.innerHTML = `<h4>Hello, <i>${currentUser.email}</i></h4>
                            <h5> Here is a very real list of "phrases" that have been googled </h5><br>`
    searchForm.style.display = ''
    fetchSearches()
}

collectionofSearches.addEventListener('click', function (e) {
    if ((event.target.className == "smiley") && (event.target.style.color !== 'pink')) {
        let target = event.target
        fetch(FAVORITES_URL, {
            method: "POST",
            headers: {
                "Content-Type": "application/json",
                Accept: "application/json"
            },
            body: JSON.stringify({
                user_id: `${currentUser.id}`,
                search_id: `${event.target.dataset.searchId}`
            })
        })
            .then(res => res.json())
            .then(res => target.dataset.favId = res.id);
        event.target.style.color = 'pink';
    }
})

