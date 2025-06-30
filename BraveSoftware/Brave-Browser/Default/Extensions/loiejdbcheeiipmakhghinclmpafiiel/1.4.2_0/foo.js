
var fontname;

chrome.extension.sendRequest({localstorage: "fontname"}, function(response) {

	fontname=response.fontname;

	if (fontname) {
		var divNode = document.createElement("div");
		divNode.innerHTML = '<style>*:not(span):not(i):not(.fa):not(button){font-family:' + fontname + ',sans-serif!important;}</style>';
		var head = document.getElementsByTagName('head')[0];
		head.appendChild(divNode);
	}
	
});
