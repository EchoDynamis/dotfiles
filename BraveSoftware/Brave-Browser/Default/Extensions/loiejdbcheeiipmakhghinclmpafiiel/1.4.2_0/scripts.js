function save_options() {

  var select = document.getElementsByName("font_name");
  var fontname = select.item(0).value;

  chrome.storage.sync.set({'fontname': fontname}, function() {
    console.log('fontname is set to ' + fontname);
  });

  var status = document.getElementById("status");
  status.innerHTML = "Options Saved. Refresh the page to see the change.";
  setTimeout(function() {
    status.innerHTML = "";
  }, 1500);

}

function restore_options() {

  chrome.storage.sync.get(['fontname'], function(items) {
    var input = document.getElementById("font_name");

    if (input) {
      input.value = items.fontname;
    }

  });

}

chrome.extension.onRequest.addListener(
function(request, sender, sendResponse) {

  chrome.storage.sync.get(['fontname'], function(items) {
    sendResponse({fontname: items.fontname});
  });

});

document.addEventListener('DOMContentLoaded', function() {
  restore_options();
});

document.addEventListener('DOMContentLoaded', function() {
  var link = document.getElementById("click-this");
  if (link != undefined) {
    link.addEventListener('click', function() {save_options();});
  }
});