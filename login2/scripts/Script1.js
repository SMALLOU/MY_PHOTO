function small(IDname) {
    var obj;
    obj = document.getElementById(IDname);
    obj.style.maxHeight = "600px";
    obj.style.maxWidth = "900px";
}

function normal(IDname) {
    var obj;
    obj = document.getElementById(IDname);
    obj.style.maxHeight = "200px";
    obj.style.maxWidth = "300px";
}

function pop(IDname) {
    var obj;
    obj = document.getElementById(IDname);
    if (obj.value === "") {
        obj.style.fontStyle = "italic";
        obj.style.color = "grey";
        if (IDname === "email") {
            obj.value = "如xm@163.com";
        }
        else if (IDname === "phone") {
            obj.value = "11位,全数字";
        }
        else if (IDname === "text") {
            obj.value = "可以补充一下";
        }
    }
}

function InputText(IDname) {
    var obj;
    obj = document.getElementById(IDname);
    if (obj.value === "如xm@163.com" | obj.value === "11位,全数字" | obj.value === "可以补充一下") {
        obj.value = "";
    }
    obj.style.fontStyle = "normal";
    obj.style.color = "black";
}
