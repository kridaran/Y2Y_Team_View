var butConfirmWindow_OK;

function newConfirmWindow( p_fillers, p_warning){
    var container = document.createElement("div");
    container.classList.add("confirmWindowContainer");

    var window = document.createElement("div");
    window.classList.add("confirmWindow");
    container.appendChild(window);

    var border = document.createElement("div");
    border.classList.add("confirmWindowBorder");
    window.appendChild(border);

    var header = document.createElement("h1");
    header.innerHTML = "Confirm";
    border.appendChild(header);

    var fillers = [];
    for(var i=0; i<p_fillers.length; i++){
        fillers.push(document.createElement("p"));
        fillers[i].innerHTML = p_fillers[i];
        border.appendChild(fillers[i]);
    }

    if(p_warning != undefined){
        var warning = document.createElement("p");
        warning.classList.add("warning");
        warning.style = "margin-top: 2%; font-family: var(--fontS_main);";
        warning.innerHTML = p_warning;
        border.appendChild(warning);
    }

    var buttonContainer = document.createElement("div");
    buttonContainer.style = "margin-top: 5%; display: inline-block; width: 100%";

    butConfirmWindow_OK = document.createElement("button");
    butConfirmWindow_OK.classList.add("bigBut");
    butConfirmWindow_OK.style = "width: 40%;";
    butConfirmWindow_OK.innerHTML = "Да";
    buttonContainer.appendChild(butConfirmWindow_OK);

    var butCancel = document.createElement("button");
    butCancel.classList.add("bigBut");
    butCancel.style = "width: 40%;";
    butCancel.innerHTML = "Отмена";
    butCancel.onclick = function () {
        this.parentElement.parentElement.parentElement.parentElement.remove();
    }
    buttonContainer.appendChild(butCancel);

    border.appendChild(buttonContainer);

    document.body.appendChild(container);
}