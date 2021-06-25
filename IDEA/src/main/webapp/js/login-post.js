"use strict"

window.addEventListener("load", function () {
    function sendData() {
        let FD  = new FormData(form);
        fetch("./LoginApi", {
            body:FD,
            method:"POST"
        }).then(
            (response) => {
                response.json().then(j => {
                    if (j["success"]) {
                        window.location.href = "./index.jsp"
                    } else {
                        alert(j["message"])
                    }
                })
            } )
    }
    // 我们需要获取表单元素
    let form = document.getElementById("form1");

    // ...然后接管表单的提交事件
    form.addEventListener("submit", function (event) {
        event.preventDefault();

        sendData();
    });
});