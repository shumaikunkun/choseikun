// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .

//その日の全時間を選択
function check(id,bool){
  //window.alert(id);
  if(bool==true){
    for(i=0;i<document.getElementsByClassName(id).length;i++){
        document.getElementsByClassName(id)[i].checked=true;
    }
  }else{
    for(i=0;i<document.getElementsByClassName(id).length;i++){
        document.getElementsByClassName(id)[i].checked=false;
    }
  }
  //idは配列型になることに注意
  //document.write(id);
}

//全ての日の全時間を選択
function allcheck(bool){
  if(bool==true){
    var count=document.vote.elements.length;
    for(i=0;i<count;i++){
      document.vote.elements[i].checked=true;
    }
  }else{
    var count=document.vote.elements.length;
    for(i=0;i<count;i++){
      document.vote.elements[i].checked=false;
    }
  }
}

function checkForm(){
  if(document.make.day.value==""||document.make.start.value==""||document.make.finish.value==""){
    alert('日付と時間を入力してください')
    return false;
  }else if(Number(document.make.start.value)>Number(document.make.finish.value)){
    alert('不正な時間帯です')
    return false;
  }else{
    return true;
  }
}


function checkForm1(){
  if(document.vote.name.value==""){
    alert('名前を入力してください')
    return false;
  }else{
    return true;
  }
}
