//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap/dropdown
//= require angular
//= require angular-resource
//= require underscore
//= require_tree .

var commandLine = $('#command-line');
commandLine.focus();
highlight(commandLine);

commandLine.focus(function(){
  highlight(commandLine);
})
commandLine.blur(function(){
  recover(commandLine);
})

function highlight(obj){
  obj.animate({
    width: '600px',
    opacity: 0.8,
    height: '40px',
    'border-radius': '50px'
  }, 500)
}

function recover(obj){
  obj.animate({
    width: '200px',
    opacity: 1,
    height: '20px'
  }, 500)
}

commandLine.bind('keydown', function(env){
  // if(env.which == 13){
  //   var command = commandLine.val();
  //   var match_nums = command.match(/:(\d+)/);
  //   var pageNum = 0;
  //   if(match_nums){
  //     pageNum = match_nums[1] - 1;
  //   }
  //   console.log(pageNum);

  //   // window.location = $('a.title')[pageNum];
  // }
  if (env.which === 38) {
    alert('up');

  } else if (env.which === 40) {
    alert('down');
  }
})
