$('.ajax-signin-btn').on('click', function(){

  var form = $('form')[0]; // You need to use standart javascript object here
  var formData = new FormData(form);

	$.ajax({
  		url:'/users/sign_in',
  		type: 'post',
      data: formData,
      cache: false,
      contentType: false,
      processData: false,
  		error: function (xhr){
  			console.log('ERROR during sign in');
  		},
  		success: function(data){
  			console.log(data);
        Turbolinks.visit('/');
  		}
	})


});

$('.createUser-btn').on('click', function(){

  var form = $('#createUser')[0]; // You need to use standart javascript object here
  var formData = new FormData(form);

  $.ajax({
      url:'/users',
      type: 'post',
      data: formData,
      cache: false,
      contentType: false,
      processData: false,
      error: function (xhr){
        console.log('ERROR during create user');
      },
      success: function(data){
        console.log(data);
        Turbolinks.visit('/');
      }
  })


});

$('.editUser-btn').on('click', function(){

  var form = $('#editUser')[0]; // You need to use standart javascript object here
  var formData = new FormData(form);

  $.ajax({
      url:'/users',
      type: 'put',
      data: formData,
      cache: false,
      contentType: false,
      processData: false,
      error: function (xhr){
        console.log('ERROR during edit user');
      },
      success: function(data){
        console.log(data);
        Turbolinks.visit('/');
      }
  })


});



$('#save').on('click', function(){

  var form = $('#newUser')[0]; // You need to use standart javascript object here
  var formData = new FormData(form);

  $.ajax({
      url:'/users/save',
      type: 'post',
      data: formData,
      cache: false,
      contentType: false,
      processData: false,
      error: function (xhr){
        console.log('ERROR during create user');
      },
      success: function(data){
        console.log(data);
        Turbolinks.visit('/users');
      }
  })


});


$('.update').on('click', function(){

  var form = $('#updateUser')[0]; // You need to use standart javascript object here
  var formData = new FormData(form);
  var id = $('#user_id').val();

  $.ajax({
      url:'/users/'+id,
      type: 'put',
      data: formData,
      cache: false,
      contentType: false,
      processData: false,
      error: function (xhr){
        console.log('ERROR during update user');
      },
      success: function(data){
        console.log(data);
        Turbolinks.visit('/users');
      }
  })


});

  






























































$('form#sign_in')
 .bind("ajaxSend", function(){
   $("#loading").show();
}).bind("ajaxComplete", function(){
   $("#loading").hide();
}).bind('ajax:success', function(e, data, status, xhr) {
  if(data.success) {
    console.log(data);
  } else {
    console.log(data);    
  }
});

/*$(document).ready(function() {

   function setNotice(data) {

var $flash = $("<div>",{
  'class': 'alert alert-success',
   'html': data.data.message 
   });

var $link  = $("<a>",{
   'html': 'x',
  'class': 'close',
   'href': '#',
   'data-dismiss': 'alert'
}).data("dismiss","alert").prependTo( $flash );


    $('#account').html(function(){
  return data.login ? data.email : "Account" 
});
    $(".alert").alert('close')
    $('#main').prepend($flash);
    $('#user_login_box').html(data.content);
       

 
 }

  $('form#sign_in')
  .bind('ajax:success', function(e, data, status, xhr) {
    console.log(data);
    if(data.success) {
      
      
      setNotice(data);
       e.preventDefault();
    } else {
      $('#status').html(data.data.message);
          e.preventDefault();

    }
  });
  
  
  
  $(".logout").click(function(e) {
  e.preventDefault(); 
  });
  
 
  $('.lang').change(function() {
    //alert(this.value);
    window.location.href = this.value;
    e.preventDefault();
   });


});*/