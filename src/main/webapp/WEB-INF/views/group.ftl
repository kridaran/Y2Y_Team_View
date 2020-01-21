<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="./styles/style.css">
    <title>Group</title>
</head>
<body onload="loadData()">
<div style="text-align: center; width: 60%; margin: auto;">
    <div id="groupNameContainer">

    </div>
    <button id="butDelete" class="bigBut" style="font-size: var(--font_small); font-family: var(--fontS_light)" onclick="showConfirmWindow()">Удалить группу</button>

    <p>Понедельник</p>
    <input type="text" id="monInput" class="textInput" placeholder="3 4 5">

    <p>Вторник</p>
    <input type="text" id="tueInput" class="textInput" placeholder="2 3 4 5 6">

    <p>Среда</p>
    <input type="text" id="wedInput" class="textInput" placeholder="1 2 3 4">

    <p>Чтетверг</p>
    <input type="text" id="thuInput" class="textInput" placeholder="3 4 5 6">

    <p>Птятница</p>
    <input type="text" id="friInput" class="textInput" placeholder="2 3 4">

    <p id="warning" class="warning"></p>
    <p style="font-size: var(--font_small)">Введите номера пар, которые есть у этой группы в соответствующий день.</p>

    <br>
    <div style="margin-top: 2%">
        <button class="bigBut" onclick="${new} ? addGroup():updateGroup()">Сохранить</button>
        <br>
        <button class="bigBut" onclick="pageBack()">Назад</button>
    </div>
</div>

</form>
</body>
</html>

<style type="text/css">
    p{
        font-size: var(--font_mid);
        margin: 20px 0 5px 0;
    }
</style>





<script type="text/javascript" src="./scripts/scheduleProcessor.js"></script>
<script type="text/javascript" src="./scripts/requestSender.js"></script>
<script type="text/javascript" src="./scripts/advancedWindows.js"></script>

<script type="text/javascript">
    function loadData() {
        var container = document.getElementById("groupNameContainer");
        var filler;
        if(${new}){
            filler = document.createElement("input");
            filler.type = "text";
            filler.classList.add("textInput");
            filler.placeholder = "Название группы";
            filler.value = "${group.getName()}";
            document.getElementById("butDelete").remove();
        }
        else{
            filler = document.createElement("p");
            filler.innerHTML = "${group.getName()}";
        }

        if("${group.getSchedule()}".length > 5){
            fillSchedule("${group.getSchedule()}");
        }

        filler.id = "groupName";
        filler.style = "font-size: var(--font_big)"
        container.appendChild(filler);

        switch ("${warning}") {
            case "groupExist":  setWarning("Группа с таким названием уже существует."); break;
            case "groupInUse": setWarning("В базе ещё есть студенты из этой группы.\nОна не может быть удалена."); break;
            default:
        }
    }

    function showConfirmWindow() {
        newConfirmWindow(["Действительно удалить группу \"${group.getName()}\"?"], "После подтверждения это действие нельзя будет отменить!");
        butConfirmWindow_OK.onclick = function () {
            deleteGroup();
        }
    }

    function pageBack() {
        request("/index", "get", ["${command}"], ["command"]);
    }

    function setWarning(msg) {
        document.getElementById("warning").innerHTML = msg;
    }

    function addGroup() {
        var sch = getSchedule();
        if(sch.valueOf() != ""){
            request("/addGroup", "post", [getGroupName(), sch, "${command}"], ["name", "schedule", "command"]);
        }
    }

    function updateGroup() {
        var sch = getSchedule();
        if(sch.valueOf() != ""){
            request("/updateGroup", "post", [getGroupName(), sch, "${command}"], ["name", "schedule", "command"]);
        }
    }

    function deleteGroup(){
        request("/deleteGroup", "post", [getGroupName(), "${command}"], ["name", "command"]);
    }
</script>
