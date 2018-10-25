
// query form
const form = document.getElementById('query-form');

// text input field
const query = document.getElementById('query');
const list = document.getElementById('list-data')

// set onsubmit
form.onsubmit = function(event) {
	event.preventDefault();

	// get value in input field
	const queryTerm = query.value;
	getTaggedPhotos(queryTerm)
	console.log(queryTerm)
}



function getTaggedPhotos(tagName) {
	fetch('https://api.tumblr.com/v2/tagged?tag=' + tagName + '&api_key=NexDD4F8ZXkabBNMsPanC2A6melsESSKJO5lyQVfqhYGsgRRoU')
		.then(function(response) {

			if (!response.ok){
				window.alert('Hey, seems like something went wrong, please email <email address> for reports!');
				return;
			}
			return response.json();
		})
		.then(function(result) {

			if (!result){
				return;
			}

			list.innerHTML = '';

			const items = result.response;

			for (let i = 0; i < items.length; i++) {

				const item = items[i];

				if (item.photos != undefined) {
					const altSizes = item.photos[0].alt_sizes
					const imgSrc = altSizes[altSizes.length - 2].url;

					const img = document.createElement('img');
					img.src = imgSrc;

					const li = document.createElement('li');
					li.appendChild(img)

					list.appendChild(li)
				}
			}
		})
		.catch(function(err) {
			window.alert('Hey, seems like the Tumblr API is down, please try again later!')
			console.log("Message: " + err)
		})
}
