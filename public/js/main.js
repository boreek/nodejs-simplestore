function addToCart(productID) {
    fetch('cart', {
        method: 'post',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({
            'productID': productID
        })
    })
        .then(res => {
            if (res.ok) return res.json()
        })
        .then(data => {
            var $content = document.getElementById('content');
            $content.innerHTML = data.content;
            initAutocomplete();
        })
}

var address;

function initAutocomplete() {
    autocomplete = new google.maps.places.Autocomplete(
        (document.getElementById('address')),
        { types: ['geocode'] });
}


function geolocate() {
    if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(function (position) {
            var geolocation = {
                lat: position.coords.latitude,
                lng: position.coords.longitude
            };
            var circle = new google.maps.Circle({
                center: geolocation,
                radius: position.coords.accuracy
            });
            autocomplete.setBounds(circle.getBounds());
        });
    }
}

function сartSubmit() {
    fetch('order', {
        method: 'post',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({
            'name': document.getElementById('name').value,
            'phone': document.getElementById('phone').value,
            'email': document.getElementById('email').value,
            'address': document.getElementById('address').value,
            'productID': document.getElementById('productID').value,
            'quantity': document.getElementById('quantity').value
        })
    }).then(res => {
        if (res.ok) {
            alert('Ваш заказ успешно оформлен');
            location.reload();
        } else {
            alert('Ошибка! Невозможно оформить заказ');
        }
    })
}