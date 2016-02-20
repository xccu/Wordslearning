function GetTime() {
    var myDate = new Date();
    var nowDate = myDate.toLocaleDateString();
    var nowTime = myDate.toLocaleTimeString();
    document.getElementById("serverTime").innerHTML = nowDate + " " + nowTime;
    setTimeout("GetTime() ", 200);
}