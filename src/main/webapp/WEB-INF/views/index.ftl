<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="./styles/style.css">
    <title>Y2Y ${command}</title>
</head>
<body onload="loadData()">

<div style="text-align: center;">
    <p id="commandName" style="font-size: var(--font_big); margin: 0">${command}</p>
    <button class="bigBut" style="font-size: var(--font_small); font-family: var(--fontS_light)" onclick="showConfirmWindow()">Удалить команду</button>
</div>

<div style="padding: 8px;">
<table class="tableResult">
    <tr>
        <td>
            <p>Понедельник</p>
        </td>
        <td>
            <p>Вторник</p>
        </td>
        <td>
            <p>Среда</p>
        </td>
        <td>
            <p>Четверг</p>
        </td>
        <td>
            <p>Пятница</p>
        </td>
    </tr>
    <tr>
        <td>
            <ol>
                <li>
                    <p id="res_11">______________</p>
                </li>
                <li>
                    <p id="res_12">______________</p>
                </li>
                <li>
                    <p id="res_13">______________</p>
                </li>
                <li>
                    <p id="res_14">______________</p>
                </li>
                <li>
                    <p id="res_15">______________</p>
                </li>
                <li>
                    <p id="res_16">______________</p>
                </li>
                <li>
                    <p id="res_17">______________</p>
                </li>
                <li>
                    <p id="res_18">______________</p>
                </li>
            </ol>
        </td>

        <td>
            <ol>
                <li>
                    <p id="res_21">______________</p>
                </li>
                <li>
                    <p id="res_22">______________</p>
                </li>
                <li>
                    <p id="res_23">______________</p>
                </li>
                <li>
                    <p id="res_24">______________</p>
                </li>
                <li>
                    <p id="res_25">______________</p>
                </li>
                <li>
                    <p id="res_26">______________</p>
                </li>
                <li>
                    <p id="res_27">______________</p>
                </li>
                <li>
                    <p id="res_28">______________</p>
                </li>
            </ol>
        </td>

        <td>
            <ol>
                <li>
                    <p id="res_31">______________</p>
                </li>
                <li>
                    <p id="res_32">______________</p>
                </li>
                <li>
                    <p id="res_33">______________</p>
                </li>
                <li>
                    <p id="res_34">______________</p>
                </li>
                <li>
                    <p id="res_35">______________</p>
                </li>
                <li>
                    <p id="res_36">______________</p>
                </li>
                <li>
                    <p id="res_37">______________</p>
                </li>
                <li>
                    <p id="res_38">______________</p>
                </li>
            </ol>
        </td>

        <td>
            <ol>
                <li>
                    <p id="res_41">______________</p>
                </li>
                <li>
                    <p id="res_42">______________</p>
                </li>
                <li>
                    <p id="res_43">______________</p>
                </li>
                <li>
                    <p id="res_44">______________</p>
                </li>
                <li>
                    <p id="res_45">______________</p>
                </li>
                <li>
                    <p id="res_46">______________</p>
                </li>
                <li>
                    <p id="res_47">______________</p>
                </li>
                <li>
                    <p id="res_48">______________</p>
                </li>
            </ol>
        </td>

        <td>
            <ol>
                <li>
                    <p id="res_51">______________</p>
                </li>
                <li>
                    <p id="res_52">______________</p>
                </li>
                <li>
                    <p id="res_53">______________</p>
                </li>
                <li>
                    <p id="res_54">______________</p>
                </li>
                <li>
                    <p id="res_55">______________</p>
                </li>
                <li>
                    <p id="res_56">______________</p>
                </li>
                <li>
                    <p id="res_57">______________</p>
                </li>
                <li>
                    <p id="res_58">______________</p>
                </li>
            </ol>
        </td>

    </tr>
</table>
</div>
<br>



<div id="commandList">

</div>



<div class="addStudent">
    <button onclick="createStudent()" class="bigBut" id="newStudentBut">Добавить студента</button>

    <input type="text" id="newStudentName" class="textInput" placeholder="Имя студента" style="width: 100%; margin-bottom: 2%;">
    <br>
    <p id="warning" class="warning"></p>
    <div class="dropDownMenu">
        <button id="newStudentGroup" class="dropBut" onclick="showGroupList()">Группа</button>

        <div id="groupList" class="dropContent">
            <button onclick="newGroup()">Новая группа</button>
        </div>
    </div>

</div>


<div style="text-align: center; margin-top: 3%">
    <button class="bigBut" onclick="logout()">Выйти</button>
</div>

</body>
</html>











<script type="text/javascript" src="./scripts/requestSender.js"></script>
<script type="text/javascript" src="./scripts/advancedWindows.js"></script>

<script type="text/javascript">

    var groups = [];
    groups.sort();

    var students = [];

    function loadData() {
        createGropList();
        <#list students as std>
            students.push(new Student("${std.getName()}", "${std.getGroup()}"));
        </#list>
        for(var i=0; i<students.length; i++){
            students[i].visualise();
        }
        fillTable();
    }

    function logout(){
        window.open("/", "_self");
    }

    function deleteCommand() {
        request("/deleteCommand", "get",[document.getElementById("commandName").innerHTML], ["name"]);
    }

    function showConfirmWindow(){
        newConfirmWindow(["Действительно удалить команду \"${command}\" и всех её членов?"], "После подтверждения это действие нельзя будет отменить!");
        butConfirmWindow_OK.onclick = function () {
            deleteCommand();
        }
    }


    // __________________________________________________________T A B L E   &   U P D A T E______________________________________________________

    function update(){
        fillTable();
    }

    function fillTable(){
        var value;
        var elem;
        for(var i = 1; i <= 5; i++){
            for(var j = 1; j <= 8; j++){
                buble = getStudentsCount(i, j);
                elem = document.getElementById("res_"+i+j);
                elem.innerHTML = buble;
                if(buble == "Все свободны!"){
                    elem.style = "font-weight: bold; color: var(--color_select)";
                }
                else{
                    elem.style = "font-weight: light; color: var(--color_bg)";
                }
            }
        }
    }

    function getStudentsCount(day, lesson){
        if(students.length == 0){
            return "______________"
        }
        else{
            var res = [];
            for(var i = 0; i < students.length; i++){
                if(students[i].schedule[day-1].includes(lesson)){
                    res.push(students[i].name);
                }
            }
            if(res.length == 0){
                return "Все свободны!";
            }
            else if(res.length > 2){
                return res.length;
            }
            else{
                return res;
            }
        }
    }


    // __________________________________________________________S T U D E N T________________________________________________________

    class Student{
        constructor(name, group){
            this.name = name;
            this.group = group;
            this.schedule = getGroupShedule(group);
        }

        visualise(){
            var div = document.createElement("div");
            div.classList.add("studentField");
            div.id = "std_" + this.name;

            var nameField = document.createElement("p");
            nameField.innerHTML = this.name;

            var groupField = document.createElement("p");
            groupField.innerHTML = this.group;

            var bClose = document.createElement("button");
            bClose.innerHTML = "Исключить";
            bClose.className = "butDeleteStudent";
            bClose.onclick = function(){
                var fields = this.parentElement.children;
                deleteStudent(fields[0].innerHTML, fields[1].innerHTML);

                this.parentElement.remove();
            }
            bClose.onmouseover = function(){
                this.parentElement.style = "border-color: var(--select_color); box-shadow: 2px 2px 7px var(--shadow_color);";
            }
            bClose.onmouseout = function(){
                this.parentElement.style = "border-color: var(--bg_color); box-shadow: 0;";
            }


            div.appendChild(nameField);
            div.appendChild(groupField);
            div.appendChild(bClose);

            document.getElementById("commandList").appendChild(div);
        }
    }

    function validateStudent(){
        var checked = true;

        var name = document.getElementById("newStudentName").value;
        var group = document.getElementById("newStudentGroup").innerHTML;

        if(!name.match(/[A-ZА-ЯІ][A-Za-zА-Яа-яіё]+ [A-ZА-ЯІ][A-Za-zА-Яа-яіё]+/)){
            document.getElementById("warning").innerHTML = "Поле имени студента должно содержать имя и фамилию, написанные с большой буквы.\nПример: Василий Котенко";
            checked = false;
        }
        else if (group == "Группа"){
            document.getElementById("warning").innerHTML = "Выберете группу.";
            checked = false;
        }
        else if(doesStudentExist(name, group)){
            document.getElementById("warning").innerHTML = "Такой студент уже есть в команде.";
            checked = false;
        }
        return checked;

    }


    function createStudent(){
        if(validateStudent()){
            var st = new Student(document.getElementById("newStudentName").value, document.getElementById("newStudentGroup").innerHTML);
            request("/addStudent", "post", [st.name, st.group, "${command}"], ["name", "group", "command"]);
        }
    }

    function deleteStudent(name, group){
        request("/deleteStudent", "post", [name, group, "${command}"], ["name", "group", "command"]);
    }

    function doesStudentExist(name, group){
        for(var i = 0; i < students.length; i++){
            if(students[i].name == name && students[i].group == group){
                return true;
            }
        }
        return false;
    }

    // __________________________________________________________G R O U P___________________________________________________________

    function newGroup() {
        request("/newGroupForm", "get", ["${command}"], ["command"]);
    }

    class Group{
        constructor(name, schedule){
            this.name = name;
            this.schedule = schedule;
            groups.push(this);
        }
    }

    function getGroupShedule(gr){
        for(var i = 0; i < groups.length; i++){
            if(groups[i].name == gr){
                return groups[i].schedule.split("_");
            }
        }
    }

    function createGropList() {
        var gList = document.getElementById("groupList");
        var element;
        var b1;
        var b2;
        var img;

        <#list groups as group>
            new Group("${group.getName()}", "${group.getSchedule()}");
        </#list>

        for (var i = 0; i < groups.length; i++) {
            element = document.createElement("div");
            b1 = document.createElement("button");
            b1.innerHTML = groups[i].name;
            b1.style = "text-align: center;"

            b2 = document.createElement("button");
            img = document.createElement("img");
            img.src = "./images/IconEdit.png";
            img.style = "height: 23px;"
            b2.style = "width: auto;"
            b2.appendChild(img);

            b1.onclick = function() {
                setStudentGroup(this.innerHTML);
            }

            b2.onclick = function(){
                editGroup(this.parentElement.children[0].innerHTML)
            }

            element.appendChild(b1);
            element.appendChild(b2);
            element.style = "display: flex;"

            gList.appendChild(element);
        }

    }

    function editGroup(name) {
        request("/editGroupForm", "get", [name, "${command}"], ["group", "command"]);
    }

    function setStudentGroup(gr) {
        document.getElementById("newStudentGroup").innerHTML = gr;
    }

    function showGroupList(){
        var gList = document.getElementById("groupList");
        if(gList.className == "dropContent"){
            gList.className = "dropContentShown";
        }
        else{
            gList.className = "dropContent";
        }
    }
</script>