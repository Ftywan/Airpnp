function bidAddress() {
    var bid = document.getElementById("bidding").value;

    if(bid == "") {
        alert("Please input a valid value");
        return 0;
    }

    var address = "ownerview?id=" + document.getElementById('id').value + "&bid=" + document.getElementById("bidding").value + "&action=bid";

    return location.href=address;
}