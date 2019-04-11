function myfunction() {
    alert("Hello! I am an alert box!");
}

function sortTable() {
    var table, rows, switching, i, x, y, shouldSwitch;
    table = document.getElementById("listings");
    switching = true;
    /* Make a loop that will continue until
    no switching has been done: */
    while (switching) {
        // Start by saying: no switching is done:
        switching = false;
        rows = table.rows;
        /* Loop through all table rows (except the
        first, which contains table headers): */
        for (i = 1; i < (rows.length - 1); i++) {
            // Start by saying there should be no switching:
            shouldSwitch = false;
            /* Get the two elements you want to compare,
            one from current row and one from the next: */
            x = rows[i].getElementsByTagName("TD")[0];
            y = rows[i + 1].getElementsByTagName("TD")[0];
            // Check if the two rows should switch place:
            if (Number(x.innerHTML) > Number(y.innerHTML)) {
                shouldSwitch = true;
                break;
            }
        }
        if (shouldSwitch) {
            /* If a switch has been marked, make the switch
            and mark that a switch has been done: */
            rows[i].parentNode.insertBefore(rows[i + 1], rows[i]);
            switching = true;
        }
    }
}

function priceAddress() {
    var low = document.getElementById("lowPrice").value;
    var high = document.getElementById("highPrice").value;


    var url = 'index?filter=price&low=' + low + '&high=' + high;
    if (low == '' || high == '') {
        alert("Please input value");
        return 0;
    }

    else if (low > high) {
        alert('Input invalid!');
        return 0;
    }
    else {
        return location.href = url;
    }
}

function dateAddress() {
    var low = document.getElementById("startTime").value;
    var high = document.getElementById("endTime").value;


    var url = 'index?filter=time&start=' + low + '&end=' + high;
    if (low == '' || high == '') {
        alert("Please input value");
        return 0;
    }

    else if (new Date(low) > new Date(high)) {
        alert('Input invalid!');
        return 0;
    }
    else {
        return location.href = url;
    }
}

function capacityAddress() {
    var capacity = document.getElementById("capacity").value;


    var url = 'index?filter=capacity&capacity=' + capacity;
    if (capacity == '') {
        alert("Please input value");
        return 0;
    }

    else {
        return location.href = url;
    }
}

function dateStartAddress() {
    return location.href = 'index?filter=sort&value=start';
}

function dateEndAddress() {
    return location.href = 'index?filter=sort&value=end';
}

function priceSortAddress() {
    return location.href = 'index?filter=sort&value=price';
}

function capacitySortAddress() {
    return location.href = 'index?filter=sort&value=capacity';
}

// parsing function
function getQueryVariable(variable) {
    var query = window.location.search.substring(1);
    var vars = query.split("&");
    for (var i = 0; i < vars.length; i++) {
        var pair = vars[i].split("=");
        if (pair[0] == variable) { return pair[1]; }
    }
    return (false);
}
function formatDate(string, id) {
    var substring = string.split();
    var formattedDate = substring[0] + ', ' + substring[1] + substring[2] + substring[3];

    document.getElementById(id).innerHTML = formattedDate;
}