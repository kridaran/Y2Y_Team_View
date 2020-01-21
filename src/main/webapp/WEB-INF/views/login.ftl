<!DOCTYPE HTML>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="./styles/style.css">
    <title>Log in</title>
</head>
<body onload="getWarningMessage()">
<div class="loginForm">
    <form id="form" name="command" action="/index" method="post">
        <div style="margin: 3% 0 1% ">
            <p>Команда</p>
            <input type="text" name="name" id="name" class="textInput" value="${command.getName()}">
            <p>Пароль</p>
            <input type="text" name="password" id="password" class="textInput" value="${command.getPassword()}">
            <br>
        </div>

        <p id="warning" class="warning"></p>
    </form>

    <button class="bigBut" onclick="login()">Войти</button>
    <br>
    <button class="bigBut" onclick="confirmCreation()">Создать команду</button>
</div>
</body>
</html>








<script type="text/javascript" src="./scripts/advancedWindows.js"></script>

<script type="text/javascript">
    function validateForm(){
        if (document.getElementById("name").value.length > 0 && document.getElementById("password").value.length > 0){
            return true;
        }
        else{
            document.getElementById("warning").innerHTML = "Оба поля должны быть заполнены.";
            return false;
        }
    }

    function login(){
        if(validateForm()){
            document.getElementById("form").submit();
        }
    }

    function confirmCreation(){
        if (validateForm()){
            var name = document.getElementById("name").value;
            var password = document.getElementById("password").value;

            newConfirmWindow(["Создать команду?","Название: " + name,"Пароль: " + password]);
            butConfirmWindow_OK.onclick = function () {
                var form = document.getElementById("form");
                form.action = "/createCommand";
                form.submit();
            }
        }
    }

    function getWarningMessage() {
        var war = document.getElementById("warning");
        var msg;
        switch ("${warning}") {
            case "incorrectLoginData": msg = "Неверное название команды или пароль."; break;
            case "commandExist": msg = "Команда с таким названием уже существует."; break;
            default: msg = "";
        }
        war.innerHTML = msg;
    }

</script>