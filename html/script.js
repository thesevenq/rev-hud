function hp(procenat){
	procenat = parseInt(procenat)
	$("#hp").html((procenat)+"%")
	$("#hp2").attr("offset",(100-procenat)+"%")
	$("#hp3").attr("offset",(100-procenat)+"%")
}

function hrana(procenat){
	procenat = parseInt(procenat)
	$("#hrana").html(procenat+"%")
	$("#hrana2").attr("offset",(100-procenat)+"%")
	$("#hrana3").attr("offset",(100-procenat)+"%")
}

function voda(procenat){
	procenat = parseInt(procenat)
	$("#voda").html(procenat+"%")
	$("#voda2").attr("offset",(100-procenat)+"%")
	$("#voda3").attr("offset",(100-procenat)+"%")
}

function pancir(procenat){
	procenat = parseInt(procenat)
	$("#pancir").html(procenat+"%")
	$("#pancir2").attr("offset",(100-procenat)+"%")
	$("#pancir3").attr("offset",(100-procenat)+"%")
}

function stamina(procenat){
	procenat = parseInt(procenat)
	$("#stamina").html(procenat+"%")
	$("#stamina2").attr("offset",(100-procenat)+"%")
	$("#stamina3").attr("offset",(100-procenat)+"%")
}


window.addEventListener('message', function(event) {
  let data = event.data
  if (data.action == "hudcina") {
	hp(data.hp)
	hrana(data.hrana)
	voda(data.voda)
	pancir(data.pancir)
	stamina(data.stamina)
  } else if (data.action == "setAmmo") {
	$('.ammo-div').fadeIn()
	$('.sarzer').text(data.meci)
  } else if (data.action == "hideAmmobox") {
	$('.ammo-div').fadeOut()
  }
});