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

var cursor = -1;
commandLine.bind('keydown', function(env){
  if (env.which === 38) {
    var list = $('a.title');
    cursor = getPre(cursor >= (list.length) ? (list.length) : cursor, list.length);
    var selector = list.get(cursor);
    recoverAllBackColor(list)
    setBackColor(selector);

  } else if (env.which === 40) {
    var list = $('a.title');
    cursor = getNext(cursor, list.length);
    var selector = list.get(cursor);
    recoverAllBackColor(list);
    setBackColor(selector);

  } else if (env.which === 27){
    var list = $('a.title');
    cursor = -1;

    recoverAllBackColor(list)
  }else if(env.which === 13){
    var list = $('a.title');
    var selector = list.get(cursor);
    if(list && selector){
      var path = $(selector).attr('href');
      commandLine.val('');
      window.location = path;
    }
    var command = commandLine.val();
    if(command === 'home'){
      window.location = '/';
    }else if(command === 'share'){
      commandLine.val('');
      window.location = '/#sharing';
    }
  }
})

function getPre(curr, size){
  if(curr <= 0){
    return size - 1;
  }else {
    return curr - 1;
  }
}
function getNext(curr, size){
  if(curr < size - 1){
    return curr + 1;
  }else {
    return 0;
  }
}
function recoverAllBackColor(list){
  _.each(list, function(e){
    $(e).parents('.cell').css('background-color', 'white');
  })
}
function setBackColor(selector){
  $(selector).parents('.cell').css('background-color', '#D5F3F5');
}
