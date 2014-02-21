chrome.app.runtime.onLaunched.addListener(function() {
  chrome.app.window.create('index.html', {
    width: 775,
    height: 400,
    minWidth: 570,
    minHeight: 160,
    id: 'hork'
  }, function(win) { });
});
