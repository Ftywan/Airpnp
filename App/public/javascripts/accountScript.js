function addAddress() {
    var name = document.getElementById("petName").value;
    var type = document.getElementById("type").value;
    var url = 'account?process=add&petName=' + name + '&type=' + type;
    return location.href = url;
}

function deleteAddress() {
    var name = document.getElementById("petName2").value;
    var url = 'account?process=delete&petName=' + name;
    return location.href = url;
}

function changeAddress() {
    var oldP = document.getElementById("oldP").value;
    var newP = document.getElementById("newP").value;
    var url = 'account?process=change&oldP=' + oldP + "&newP=" + newP;
    if (oldP == newP) {
        alert("New password needs to be different");
        return 0;
    }
    else return location.href = url;
}