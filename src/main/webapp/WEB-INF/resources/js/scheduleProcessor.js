var days = ["mon", "tue", "wed", "thu", "fri"];

function getSchedule(){
	var res = "";

	var buble;
	var emptyFields = 0;
	var checked = true;

	for(var i = 0; i < days.length; i++){
		console.log(days[i] + "Input");
		buble = document.getElementById(days[i] + "Input").value;
		var bLeng = buble.length;
		for(var j = 0; j < bLeng; j++){
			buble = buble.replace(/\D/, "");
		}

		if(buble.length > 0){
			res += buble + "_";
		}
		else{
			res += "_";
			emptyFields++;
		}
	}

	if(emptyFields != 5){
		if(getGroupName().valueOf() != ""){
			res = res.substring(0, res.length - 1);
			return res;
		}
		else{
			setWarning("Введите название группы.");
			return "";
		}
	}
	else{
		setWarning("Должен быть заполнен минимум один день.");
		return "";
	}
}

function fillSchedule(str) {
	var schedule = str.split("_");

	var buble;
	for (var i = 0; i < days.length; i++){

		// To create spaces for easier reading
		buble = schedule[i].split("");
		schedule[i] = buble.join(" ");
		//_____________________________________

		document.getElementById(days[i] + "Input").value = schedule[i];
	}
}

function getGroupName() {
	var name = document.getElementById("groupName");
	if(name.innerHTML.valueOf() == ""){
		return name.value;
	}
	else{
		return name.innerHTML;
	}
}