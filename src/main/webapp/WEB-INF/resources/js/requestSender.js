function request(action, method, parameters, parameterNames) {
    var form = document.createElement("form");
    form.action = action;
    form.method = method;
    var params = [];
    for (var i = 0; i < parameters.length; i++){
        params.push(document.createElement("input"));
        params[i].type = "text";
        params[i].value = parameters[i];
        params[i].name = parameterNames[i];
        form.appendChild(params[i]);
    }
    document.body.appendChild(form);
    form.submit();
    alert(get())
}