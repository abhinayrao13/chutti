function tocheck(){
  var a = document.getElementById("userrole");
  console.log(a.innerHTML);
  var letters = /^[A-Za-z]+$/;
    if (a.value == "") {
    alert("pls fill the feilds");
    return false;
  }
  else if(!a.value.match(letters)){
    alert("enter only letters");
    return false;
  }
}
function myBtn(l) {
  console.log(l);
  $.ajax({ url: "/roles/"+ l, method: "delete", datatype: "json",
 success: function (data) {
   console.log("Deleted role.................");
   console.log(data.id);
   $("#role_" + data.id).remove();
 }

 });
}
