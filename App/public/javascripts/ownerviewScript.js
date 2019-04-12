function bidAddress() {
    var bid = Number(document.getElementById("bidding").value);
    var min = Number(document.getElementById('min').innerHTML);



    if(bid == "" || bid <= min) {
        alert("Please input a valid value");
        return 0;
    }

    var address = "ownerview?id=" + document.getElementById('id').value + "&bid=" + document.getElementById("bidding").value + "&action=bid";

    return location.href=address;
}

function commentAddress() {
    var text = document.getElementById('comment').value;
    var id = document.getElementById('id').value;

    if(text == '') {
        alert("Please input before comment!");
        return 0;
    }

    var address = "ownerview?id=" + id + "&action=comment" + "&text=" + text;
    return location.href=address;
}