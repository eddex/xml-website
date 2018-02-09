var cookieName = 'style';

function changeToStyle(stylesheet) {
  "use strict";
  document.getElementById('style').setAttribute('href', 'css/accessibility/' + stylesheet + '.css');
  document.cookie = cookieName + '=' + stylesheet;
}

function restoreStyle(defaultStyle) {
  "use strict";
  var value = document.cookie.match('(^|;)\\s*' + cookieName + '\\s*=\\s*([^;]+)');
  changeToStyle(value ? value.pop() : defaultStyle);
}