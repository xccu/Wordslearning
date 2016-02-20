function changeChecked(obj) {

    if ($(obj).attr("class") == "checked") {
        $(obj).attr("class", "unchecked");
        return;
    }
    if ($(obj).attr("class") == "unchecked") {
        $(obj).attr("class", "checked");
        return;
    }
}

function setCheckValue() {
    var result = "";
    var child = document.getElementsByClassName("checklist")[0].childNodes;
    for (i = 0; i < child.length; i++) {
        var nextChild = child[i].childNodes
        for (j = 0; j < nextChild.length; j++) {
            if ($(nextChild[j]).attr("class") == "checked") {
                result += $(nextChild[j]).attr("Id");
            }
        }
    }

    var reg = new RegExp("Check", "g"); //创建正则RegExp对象   
    result = result.replace(reg, "");
    return(result);
}

function getCheckValue(Str) {
    var array = Str.split('_')
    for (i = 0; i < array.length - 1; i++) {
        var Id = "Check_" + array[i];
        $("#"+Id).attr("class", "checked");
    }
}