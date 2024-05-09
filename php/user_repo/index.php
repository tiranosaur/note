<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
</head>
<body>
<div id="main"></div>
<button id="button">sldkjf</button>
<script>
    let main = document.getElementById("main");

    let button = document.getElementById("button");
    button.addEventListener("click", setUsers);

    function setUsers() {
        main.innerHTML = "";
        return fetch('/user.php', {
            method: 'POST',
            headers: {'Content-Type': 'application/json;charset=utf-8'}
        }).then(response => {
            if (!response.ok) {
                throw new Error('Network response was not ok');
            }
            return response.json();
        }).then(result => {
            result.forEach(item => {
                main.innerHTML += `<div>${item["id"]} - ${item["username"]}</div>`;
            });
        }).catch(error => {
            console.error('There was a problem with the fetch operation:', error);
        });
    }
</script>
</body>
</html>