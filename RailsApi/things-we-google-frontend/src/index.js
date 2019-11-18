const BASE_URL = "http://localhost:3000"
const SEARCHES_URL = `${BASE_URL}/searches`
const USERS_URL = `${BASE_URL}/users`
const FAVORITES_URL = `${BASE_URL}/favorites`
const searchesCollection = document.querySelector('#searches-collection')
const favCollection = document.querySelector('#fav-collection')
const likeButton = document.querySelector('.like-btn')
const signupForm = document.querySelector('#signup-form')
const signupInputs = document.querySelectorAll(".signup-input")
const header = document.querySelector('.header-banner')
const logout = document.querySelector('.logout')
const date = Date().slice(16, 21);

let currentUser

class Search {
    constructor(searchAttributes) {
        this.content = searchAttributes.content;
        this.link = searchAttributes.link;
        this.id = searchAttributes.id;
    }

    render() {
        // return `<div class="card text-white bg-info mb-3">
        //         <h5 class="card-title">${this.content}<h5>
        //           <p data-search-id=${this.id} class="like-btn">♡</p>
        //         </div>`




        return ` <div class="card">
        <div class="card bg-light">
          <div class="card-body text-center">
            <h4 class="card-text">${this.content}</h5>
            <h6 data-search-id=${this.id} class="like-btn">♡</h6> 
            <a href="${this.link}"> ----> </a>
          </div>
        </div>`
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
        }
        )
})

function putSearchesOnDom(searchArray) {
    searchesCollection.innerHTML = `<h5 class="text-muted"> ♡ if you've ever had this thought </h5>
                                     <h5 class="text-muted"> ----> if you really want to see the result </h5>
                                    <h4 class="favorites-link">View My Favorites ♡</h4>`
    searchArray.forEach(search => {
        searchesCollection.innerHTML += new Search(search).render()
    })
}

function putFavoritesOnDom(favArray) {
    favCollection.innerHTML = `<h2>My Favorites</h2>
                               <h3 class="back-link">←Back to Gifts</h3>`
    favArray.forEach(favorite => {
        favCollection.innerHTML +=
            // `<div class="card">
            // //   <p>${favorite.search.content}<p>
            // //   <p data-search-id=${favorite.search.id} class="like-btn" style="color:red;">♡</p>
            // // </div>`
            ` <div class="card">
        <div class="card bg-primary">
          <div class="card-body text-center">
            <h4 class="card-text">${favorite.search.content}</h5>
            <h6 data-search-id=${favorite.search.id} class="like-btn"></h6> 
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


searchesCollection.addEventListener('click', function (e) {
    if (event.target.className == "favorites-link") {
        searchesCollection.style.display = 'none';
        fetchFavorites();
        favCollection.style.display = 'initial';
    }
})
favCollection.addEventListener('click', function (e) {
    if (event.target.className == "back-link") {
        favCollection.style.display = 'none';
        searchesCollection.style.display = 'initial';
    }
})

function loggedInUser(object) {
    currentUser = object
    signupForm.style.display = 'none'
    welcome.innerHTML = `<h4>Hello, <i>${currentUser.email}</i></h4>
                            <h5> Here is a very real list of "things" that have been googled </h5>`
    fetchSearches()
}

searchesCollection.addEventListener('click', function (e) {
    // console.log(event.target.className, event.target.style.color)
    // e.preventDefault() was preventing images from being clickable
    if ((event.target.className == "like-btn") && (event.target.style.color !== 'red')) {
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
        event.target.style.color = 'red';
    }
    else if ((event.target.className == "like-btn") && (event.target.style.color == 'red')) {
        event.target.style.color = 'black';
        fetch(FAVORITES_URL + '/' + event.target.dataset.favId, {
            method: "DELETE"
        })
    }
})