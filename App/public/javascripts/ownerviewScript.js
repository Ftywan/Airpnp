function bidAddress() {
    var bid = document.getElementById("bidding").value;
    var min = Number(document.getElementById('min').innerHTML);

    console.log(bid)
    console.log(min);

    if(bid == "" || bid <= min) {
        alert("Please input a valid value");
        return 0;
    }

    var address = "ownerview?id=" + document.getElementById('id').value + "&bid=" + document.getElementById("bidding").value + "&action=bid";

    return location.href=address;
}