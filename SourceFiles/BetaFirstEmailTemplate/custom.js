//

if(top.location != self.location){
	top.location = self.location;
}

var is_chrome = navigator.userAgent.indexOf('Chrome') > -1;
var is_explorer = navigator.userAgent.indexOf('MSIE') > -1;
var is_firefox = navigator.userAgent.indexOf('Firefox') > -1;
var is_safari = navigator.userAgent.indexOf("Safari") > -1;
var is_Opera = navigator.userAgent.indexOf("Presto") > -1;
if ((is_chrome)&&(is_safari)) {is_safari=false;}

window.prevback = "";

var FF = !(window.mozInnerScreenX == null);
//testedit

window.openPickers = "";

$( document ).ready(function() {

(function($){
  
  $.fn.lightOrDark = function(){
    var r,b,g,hsp
      , a = this.css('background-color');
    
    if (a.match(/^rgb/)) {
      a = a.match(/^rgba?\((\d+),\s*(\d+),\s*(\d+)(?:,\s*(\d+(?:\.\d+)?))?\)$/);
      r = a[1];
      b = a[2];
      g = a[3];
    } else {
      a = +("0x" + a.slice(1).replace( // thanks to jed : http://gist.github.com/983661
          a.length < 5 && /./g, '$&$&'
        )
      );
      r = a >> 16;
      b = a >> 8 & 255;
      g = a & 255;
    }
    hsp = Math.sqrt( // HSP equation from http://alienryderflex.com/hsp.html
      0.299 * (r * r) +
      0.587 * (g * g) +
      0.114 * (b * b)
    );
    if (hsp>127.5) {
      this.addClass('light');
    } else {
      this.addClass('dark');
    }
  }
  
	})(jQuery);
	
	$('.title').on("click", function(){
		$('#bghover').hide();
		$('#bobghover').hide();
		if($(this).closest('.module').hasClass('opened')){
			$(this).closest('.module').addClass('closed').removeClass('opened');
			$(this).parent().find('.content-wrap').slideUp(400);
		}else{
			$(this).closest('.module').addClass('opened').removeClass('closed');
			$(this).parent().find('.content-wrap').slideDown(400);
		}
	});
	
	
	$('#tc_theme').on("click", function(){
		$('#bghover').hide();
		$('#bobghover').hide();
	});
	
	/*if($('#bgcolor').length != 0){
	$('#bgcolor').on("click", function(){	
		$('#althover').hide(); 
		$('#bobghover').hide();
		if($('#bghover').children().length != 0 ){
			$('#bghover').toggle();
			if($('#bghover').is(':visible')){
				$('#bgcolor').html(rgb2hex($("#bgcolor").css('background-color')));
			}
		}else{
			$('#bgcolor').html(rgb2hex($("#bgcolor").css('background-color')));
			var buttonColor = $.farbtastic('#bghover');
			buttonColor.setColor("#"+window.bgcol);
			buttonColor.linkTo(function buttonColor(col){ 
				if(col == "#NaNNaNNaN"){ col = '#ffffff'; }
				$("#bgcolor").css('background-color', col).removeClass("light").removeClass("dark").lightOrDark();
				$("#bgcolor").html(col);
				$('#tc_central').css('background-color', col);
				$('.bgchange').css('background-color', col);
			});
			
			window.bgcolor = buttonColor;
		
			$('#bghover').offset({ top: $(this).position().top-20, left: $(this).position().left+60 });
		}
	});
	$('#bgcolor').css({'background':'#'+window.bgcol});
	$("#bgcolor").lightOrDark();
	}*/
	
	
	
	
	if($('#bodycolor').length != 0){
	$('#bodycolor').on("click", function(){	
		$('#bghover').hide();
		if($('#bobghover').children().length != 0 ){
			$('#bobghover').toggle();
			if($('#bobghover').is(':visible')){
				$('#bodycolor').html(rgb2hex($("#bodycolor").css('background-color')));
			}
		}else{
			$('#bodycolor').html(rgb2hex($("#bodycolor").css('background-color')));
			var buttonColor = $.farbtastic('#bobghover');
			buttonColor.setColor("#"+window.bodycol);
			buttonColor.linkTo(function buttonColor(col){ 
				if(col == "#NaNNaNNaN"){ col = '#ffffff'; }
				$("#bodycolor").css('background-color', col).removeClass("light").removeClass("dark").lightOrDark();
				$("#bodycolor").html(col);
				$('[c-style=bodycolor]').css('background-color', '#'+col);
			});
		
			$('#bobghover').offset({ top: $(this).position().top-20, left: $(this).position().left+60 });
			$('#bobghover').show();
		}
	});
	$('#bodycolor').css({'background':'#'+window.bodycol});
	$("#bodycolor").lightOrDark();
	}
	
	
	$('#back_url').blur(function(){
		addUndo($('#tc_central').css('background'), window.prevback, "bgimage");
		if($('#back_url').val() != ""){
			$('#tc_central').css('background-color', 'none');
			$('.bgchange').css('background', 'none !important');
			$('#tc_central').css('background-image', 'url(' + $('#back_url').val() + ')');
		}else{
			$('#tc_central').css('background-image', 'none');
			$('#tc_central').css('background-color', $('#bgcolor').css('background-color'));
			$('.bgchange').css('background', $('#bgcolor').css('background-color'));
		}
		window.prevback = $('#back_url').val();
	});
	
	$('#back_url').keypress(function (e) {
		if (e.which == 13) {
			addUndo($('#tc_central').css('background'), window.prevback, "bgimage");
			if($('#back_url').val() != ""){
				$('#tc_central').css('background-color', 'none');
				$('.bgchange').css('background', 'none !important');
				$('#tc_central').css('background-image', 'url(' + $('#back_url').val() + ')');
			}else{
				$('#tc_central').css('background-image', 'none');
				$('#tc_central').css('background-color', $('#bgcolor').css('background-color'));
				$('.bgchange').css('background', $('#bgcolor').css('background-color'));
			}
			window.prevback = $('#back_url').val();
		}
	});
	
	/*Editor Controls */
	$(document).on("mouseenter", '[object=text-editable]', function(e){
		$(this).append('<div class="controls removeme"><div class="iconEdit" onClick="editElement(this);"><i class="fa fa-pencil"></i></div></div>');
	});
	
	$(document).on("mouseleave", '[object=text-editable]', function(e){
		$('[object=text-editable] .removeme').remove();
	});
	
	$(document).on("mouseenter", '[object=image-editable]', function(e){
		$(this).prepend('<div class="controls removeme"><div class="iconEdit" onClick="editImage(this);"><i class="fa fa-pencil"></i></div></div>');
	});
	
	$(document).on("mouseleave", '[object=image-editable]', function(e){
		$('[object=image-editable] .removeme').remove();
	});
	
	$(document).on("mouseenter", '[object=link-editable]', function(e){
		$(this).append('<div class="controls removeme"><div class="iconEdit" onClick="editLink(this);"><i class="fa fa-pencil"></i></div></div>');
	});
	
	$(document).on("mouseleave", '[object=link-editable]', function(e){
		$('[object=link-editable] .removeme').remove();
	});
	
	$(document).on("mouseenter", 'table[object=drag-module], table[object=drag-module-small]', function(e){
		if($(this).is('table')){
			$(this).append('<div class="dcontrols removeme" style="text-align: right;"><div style="background-image: url(assets/images/button1.png); cursor:pointer;" class="img" onClick="copyIt(this);">&nbsp;</div><div style="background-image: url(assets/images/button2.png); cursor:pointer;" class="img" onClick="deleteIt(this);">&nbsp;</div></div>');
		}
	});
	
	$(document).on("mouseleave", 'table[object=drag-module], table[object=drag-module-small]', function(e){
		$('table[object=drag-module] .removeme, table[object=drag-module-small] .removeme').remove();
	});
	
	$('#html_export').click(function(){
		$('#temp-wrap').remove();
		$('#canvas').css({'display':'block'});
		$('#modal').css({'display':'block'});
		$('.mod-footer input').css({'display':'none'});
		$('.mod-title').html('Export Template <i class="icon-export"></i>');
		$('#editText').html('<button class="tc_input export-btn" id="bog_html"><span class="button-title">Normal HTML</span><span class="button-img"></span></button> <button class="tc_input export-btn" id="bog_mc"><span class="button-title">MailChimp</span><span class="button-img"></span></button> <button class="tc_input export-btn" id="bog_cm"><span class="button-title">Campaign Monitor</span><span class="button-img"></span></button><br><br>');
	});
	
	$(document).on("click", '#bog_html', function(e){ exportType("HTML"); });
	
	$(document).on("click", '#bog_cm', function(e){ exportType("CM"); });
	
	$(document).on("click", '#bog_mc', function(e){ exportType("MC"); });
	
	$(document).on("click", '#mobile_scale', function(e){	
		$('#scaler img').removeClass('active');
		$(this).addClass('active');
		$('#tc_central').css({'width':'400px','max-width':'400px'});
		$('#scaler .holder').css({'width':'242px','max-width':'242px'});
		var content = $('#tc_central').html().replace("<!--LARGEONE-->","<!--LARGEONEO").replace("<!--ELARGEONE-->","CLARGEONE-->");
		var second 	= content.replace("<!--SMALLONEO", "<!--SMALLONE-->").replace("CSMALLONE-->","<!--ESMALLONE-->");
		$('#tc_central').html(second);
		$( "#sort_them" ).sortable({placeholder: "drag-module"});
		$( "#sort_them" ).disableSelection();
		$('.sortable_inner').sortable({ placeholder: "drag-module-small"});
		$( ".sortable_inner" ).disableSelection();
	});
	
	$(document).on("click", '#tablet_scale', function(e){
		$('#scaler img').removeClass('active');
		$(this).addClass('active');
		$('#tc_central').css({'width':'600px','max-width':'600px'});
		$('#scaler .holder').css({'width':'442px','max-width':'442px'});
		var content = $('#tc_central').html().replace("<!--SMALLONE-->","<!--SMALLONEO").replace("<!--ESMALLONE-->","CSMALLONE-->");
		var second 	= content.replace("<!--LARGEONEO", "<!--LARGEONE-->").replace("CLARGEONE-->","<!--ELARGEONE-->");
		$('#tc_central').html(second);
		$( "#sort_them" ).sortable({placeholder: "drag-module"});
		$( "#sort_them" ).disableSelection();
		$('.sortable_inner').sortable({ placeholder: "drag-module-small"});
		$( ".sortable_inner" ).disableSelection();
	});
	
	$(document).on("click", '#desktop_scale', function(e){
		$('#scaler img').removeClass('active');
		$(this).addClass('active');
		$('#tc_central').css({'width':'800px','max-width':'800px'});
		$('#scaler .holder').css({'width':'642px','max-width':'642px'});
		var content = $('#tc_central').html().replace("<!--SMALLONE-->","<!--SMALLONEO").replace("<!--ESMALLONE-->","CSMALLONE-->");
		var second 	= content.replace("<!--LARGEONE-->","<!--LARGEONEO").replace("<!--ELARGEONE-->","CLARGEONE-->");
		$('#tc_central').html(second);
		$( "#sort_them" ).sortable({placeholder: "drag-module"});
		$( "#sort_them" ).disableSelection();
		$('.sortable_inner').sortable({ placeholder: "drag-module-small"});
		$( ".sortable_inner" ).disableSelection();
	});
	
	
	$(document).on("click", '#displayPreview button', function(e){
		$('#canvas').css({'display':'none'});
		$('#displayPreview').remove();
	});
	
	/*End Controls */
	
	$("a").click(function() {
	    return false;
	});
	
	$( "#sort_them" ).sortable({
		placeholder: "drag-module"
	});
	$( "#sort_them" ).disableSelection();


	$('.sortable_inner').sortable({
		placeholder: "drag-module-small"
	});
	$( ".sortable_inner" ).disableSelection();

	
	// Version 1 addition
	$('.update_header').blur(function(){
		var item = $(this).attr('data');
		var idva = $(this).attr('id');
		console.log(idva);
		if($(this).val() != ""){
			var lastval = $(this).attr('last-data');
			addUndo(item, idva, "header", lastval, $('#'+item).css('background'));
			$('#'+item).css({'background-image':'url('+$(this).val()+') '});
			$('#'+item+"_outlook").attr('src', $(this).val());
			$(this).attr('last-data', $(this).val());
		}
	});
	
	
	$('.update_header').keypress(function (e) {
		if (e.which == 13) {
			var item = $(this).attr('data');
			if($(this).val() != ""){
				$(this).blur();
				var lastval = $(this).attr('last-data');
				$('#'+item).css({'background-image':'url('+$(this).val()+') '});
				$('#'+item+"_outlook").attr('src', $(this).val());
				$(this).attr('last-data', $(this).val());
			}
		}
	});	
	
	$('.update_slider').keypress(function (e) {
		if (e.which == 13) {
			var item = $(this).attr('data');
			if($(this).val() != ""){
				$(this).blur();
			}
		}
	});
	
	$('.update_slider').blur(function(){
		var item = $(this).attr('data');
		var idva = $(this).attr('id');
		if($(this).val() != ""){
			$('.'+item).attr('src', $(this).val());
		}
	});	
	
	$('#enable_slider').click(function(){
		if($('#slider_theme').hasClass('activeSlider')){
			$('#slider_theme').removeClass('activeSlider');
		}else{
			$('#slider_theme').addClass('activeSlider');
		}
	});
});


function selectPattern(ele, url){
	addUndo($('#tc_central').css('background-color'), $('#tc_central').css('background-image'), "pattern", $('.image.active'), ele);
	$('#tc_central').css('background-color', 'none');
	$('.bgchange').css('background', 'none !important');
	$('[c-style=bgcolor]').css('background-color', '');
	$('#tc_central').css('background-image', 'url(' + url + ')');
	$('.image').removeClass('active').css({'border':'solid 2px #ffffff', 'margin':'2px'});
	$(ele).addClass('active').css({'border':'solid 2px #51c4d4', 'margin':'0px'});
}

function selectNone(){
	$('.image').css({'border':'solid 2px #ffffff', 'margin':'2px'});
	$('#tc_central').css('background-image', 'none');
	$('#tc_central').css('background-color', $('#bgcolor').css('background-color'));
	$('.bgchange').css('background', $('#bgcolor').css('background-color'));
}

/* Non triggered editor */
jQuery.fn.cleanWhitespace = function() {
    textNodes = this.contents().filter(
        function() { return (this.nodeType == 3 && !/\S/.test(this.nodeValue)); })
        .remove();
    return this;
}

function editElement(ele){
	window.functionname = "edittext";
	$('#canvas').css({'display':'block'});
	$('#modal').css({'display':'block'});
	$('.mod-title').html('<i class="fa fa-font"></i> &nbsp; Edit Text');
	$('#editText').html('<textarea id="tinyeditor" style="width: 400px; height: 200px"></textarea>');
	window.saveto = $(ele).parent().parent();
	$('.removeme').remove();
	$('#tinyeditor').html($(window.saveto).html());
	var editor = new TINY.editor.edit('editor', {
		id: 'tinyeditor',
		width: 496,
		height: 175,
		cssclass: 'tinyeditor',
		controlclass: 'tinyeditor-control',
		rowclass: 'tinyeditor-header',
		dividerclass: 'tinyeditor-divider',
		controls: ['bold', 'italic', 'underline', 'strikethrough', '|', 'subscript', 'superscript', '|',
			'orderedlist', 'unorderedlist', '|', 'outdent', 'indent', '|', 'leftalign',
			'centeralign', 'rightalign', 'blockjustify', '|', 'unformat', '|', 'undo', 'redo', 'n',
			'font', 'size', 'style', '|', 'hr', 'link', 'unlink', 'colour'],
		footer: true,
		fonts: ['Verdana','Arial','Georgia','Trebuchet MS'],
		xhtml: true,
		bodyid: 'editor',
		footerclass: 'tinyeditor-footer',
		toggle: {text: 'source', activetext: 'wysiwyg', cssclass: 'toggle'},
		resize: {cssclass: 'resize'}
	});
}

function editImage(ele){
	window.functionname = "editimage";
	$('#canvas').css({'display':'block'});
	$('#modal').css({'display':'block'});
	$('.mod-title').html('<i class="fa fa-picture-o"></i> &nbsp; Edit Image');
	window.saveto = $(ele).parent().parent().find('img');
	window.imgsrc = $(ele).parent().parent().find('img').attr('src');
	$('#editText').html('<div class="title_modal"><b>External URL</b></div> <div class="input_modal"><input type="text" id="image_url" class="tc_input" value="'+window.imgsrc+'"/></div><!-- <div class="title_modal"> or <b>Upload Image</b></div> <div class="input_modal"><input type="file" id="link_url" class="tc_input" /></div>--><br><br>');
}

function editLink(ele){
	window.functionname = "editlink";
	$('#canvas').css({'display':'block'});
	$('#modal').css({'display':'block'});
	$('.mod-title').html('<i class="fa fa-link"></i> &nbsp; Edit Link');
	window.textvalue 	= $(ele).parent().parent().text();
	$(ele).parent().parent().parent().find('a').each(function(index){
		//alert($(this).html());
		if($(this).has('.controls').length > 0){
			window.saveto  = $(this);
			window.linkval = $(this).attr('href');
		}
	});
	$('.removeme').remove();
	$('#editText').html('<div class="title_modal">Link Name</div> <div class="input_modal"><input type="text" id="link_name" class="tc_input" /></div> <div class="title_modal">Link URL</div> <div class="input_modal"><input type="text" id="link_url" class="tc_input" /></div><br><br>');
	$('#link_name').val(window.textvalue);
	$('#link_url').val(window.linkval);
}

function saveText(){
	if(window.functionname == "edittext"){
		var nameTo = 'element_'+Math.random();
		$(window.saveto).attr('cu-identify', nameTo.replace(".", ""));
		addUndo(nameTo.replace(".", ""), $(window.saveto).html(), "text");
		
		$(window.saveto).html($('#editText iframe').contents().find('#editor').html());
		$('#canvas').css({'display':'none'});
		$('#modal').css({'display':'none'});
	}else if(window.functionname == "editlink"){
		var nameTo = 'element_'+Math.random();
		$(window.saveto).attr('cu-identify', nameTo.replace(".", ""));
		addUndo(nameTo.replace(".", ""), $(window.saveto).attr('href'), "link", $(window.saveto).html());
		
		$(window.saveto).attr('href', $('#link_url').val());
		$(window.saveto).html($('#link_name').val());
		$('#canvas').css({'display':'none'});
		$('#modal').css({'display':'none'});
	}else if(window.functionname == "editimage"){
		var nameTo = 'element_'+Math.random();
		$(window.saveto).attr('cu-identify', nameTo.replace(".", ""));
		addUndo(nameTo.replace(".", ""), $(window.saveto).attr('src'), "image");
		
		$(window.saveto).attr('src', $('#image_url').val());
		$('#canvas').css({'display':'none'});
		$('#modal').css({'display':'none'});
	}
}

function closeModal(){
	$('.mod-footer input').css({'display':'block'});
	$('#canvas').css({'display':'none'});
	$('#modal').css({'display':'none'});
}

function deleteIt(ele){
	var nameTo = 'element_'+Math.random();
	var nameNo = 'element_'+Math.random();
	
	$(ele).parent().parent().attr('cu-identifier', nameNo.replace(".", ""));
	
	addUndo(nameTo.replace(".", ""), $(ele).parent().parent().outerHTML(), "module", nameNo.replace(".", ""));
	
	$("<div style='display: none' id='"+nameTo.replace(".", "")+"'></p>").insertBefore($(ele).parent().parent());
	$(ele).parent().parent().remove();
}

function copyIt(ele){
	$(ele).parent().parent().clone().insertAfter($(ele).parent().parent());
}

(function($) {
  $.fn.outerHTML = function() {
    return $(this).clone().wrap('<div></div>').parent().html();
  }
})(jQuery);

var hexDigits = new Array("0","1","2","3","4","5","6","7","8","9","a","b","c","d","e","f"); 

//Function to convert hex format to a rgb color
function rgb2hex(rgb) {
	rgb = rgb.match(/^rgb\((\d+),\s*(\d+),\s*(\d+)\)$/);
	return "#" + hex(rgb[1]) + hex(rgb[2]) + hex(rgb[3]);
}

function hex(x) {
	return isNaN(x) ? "00" : hexDigits[(x - x % 16) / 16] + hexDigits[x % 16];
 }


var windowedArray = new Array();

function setUpPicker(element, cssvalue, variable, color){
	
	if(variable == 'text'){ var minB = 'color'; var aon = 't'; }else{ var minB = 'background-color'; var aon = 'c'; }
	if($(element).children().length == 0 ){
		$(element+'hover').css({'display':'none'});
		windowedArray[cssvalue] = $.farbtastic(element+'hover');
		windowedArray[cssvalue].setColor(color);
		$(element).css('background-color', color).removeClass("light").removeClass("dark");
		lightOrDarkJS(element);
		windowedArray[cssvalue].linkTo(function buttonColor(col){ 
			if(col == "#NaNNaNNaN"){ col = '#ffffff'; }
			
			
			
			$(element).css('background-color', col).removeClass("light").removeClass("dark");
			lightOrDarkJS(element);
			
			$(element).parent().find('input').val(col);
			$(element).parent().find('input').css({'background-color':col}).removeClass("light").removeClass("dark");
			lightOrDarkJS($(element).parent().find('input'));
			//$(element).html(col);
			$('['+aon+'-style='+cssvalue+']').css(minB, '#'+col);
			if($(element).attr('cu-border') == "true"){
				console.log('changed');
				$('['+aon+'-style='+cssvalue+']').css({"border-color": col});
				$('['+aon+'-style='+cssvalue+']').parent().css({"border-color": col});
				$('['+aon+'-style='+cssvalue+']').parent().parent().css({"border-color": col});
	
			}
			//console.log(aon);
		});
	}
}

function lightOrDarkJS(element){
	 var r,b,g,hsp
      , a = $(element).css('background-color');
    
    if (a.match(/^rgb/)) {
      a = a.match(/^rgba?\((\d+),\s*(\d+),\s*(\d+)(?:,\s*(\d+(?:\.\d+)?))?\)$/);
      r = a[1];
      b = a[2];
      g = a[3];
    } else {
      a = +("0x" + a.slice(1).replace( // thanks to jed : http://gist.github.com/983661
          a.length < 5 && /./g, '$&$&'
        )
      );
      r = a >> 16;
      b = a >> 8 & 255;
      g = a & 255;
    }
    hsp = Math.sqrt( // HSP equation from http://alienryderflex.com/hsp.html
      0.299 * (r * r) +
      0.587 * (g * g) +
      0.114 * (b * b)
    );
    if (hsp>127.5) {
      $(element).addClass('light');
    } else {
      $(element).addClass('dark');
    }
  }

function colorPicker(element){
	if($(element+'hover').css('display') == "block"){
		$('.hoveroutways').hide();
		$(element+'hover').hide();
		$(element).parent().find('input').css({'display':'none'});
		$(element).html($(element).parent().find('input').val());
		$(element).removeClass("light").removeClass("dark").lightOrDark();
		$(element).parent().find('input').removeClass("light").removeClass("dark").lightOrDark();
		
		
		addUndo($(element).attr('css-val'), $(element).attr('old-color'), "color", $(element).attr('id'));
		$(element).attr('old-color', $(element).parent().find('input').val());
		window.openPickers = "";
	}else{
		if(window.openPickers != ""){
			colorPicker(window.openPickers);
		}
		window.openPickers = element;
		$('.hoveroutways').hide();
		$(element+'hover').show();
		$(element).attr('old-color', $(element).parent().find('input').val());
		$(element).parent().find('input').css({'display':'block'});
		$(element).html('');
		$(element).parent().find('input').removeClass("light").removeClass("dark").lightOrDark();
	}
	if(is_firefox){
		//$(element+'hover').css({'position':'absolute'}).offset({ top: $(element).parent().position().top - 70, left: $(element).parent().position().left + 245 });
		$(element+'hover').css({'position':'absolute', top: $(element).parent().position().top - 70, left: $(element).parent().position().left + 205 });
	}else if(is_safari){
		//$(element+'hover').css({'position':'absolute'}).offset({ top: $(element).parent().position().top - 70, left: $(element).parent().position().left + 210 });
		$(element+'hover').css({'position':'absolute', top: $(element).parent().position().top - 70, left: $(element).parent().position().left + 205 });
	}else{
		//$(element+'hover').css({'position':'absolute'}).offset({ top: $(element).parent().position().top - 70, left: $(element).parent().position().left + 220 });
		$(element+'hover').css({'position':'absolute', top: $(element).parent().position().top - 70, left: $(element).parent().position().left + 205 });
	}
}

function closeAll(){
	if(window.openPickers != ""){
		colorPicker(window.openPickers);
		window.openPickers = "";
	}
}

function exportType(type){
	if(window.purchased == true){
		$.post("exporthtml.php",{
			data:		$('#tc_central').html(),
			backpat:	$('#tc_central').css('background-image'),
			type:		type
		},function(data,status){
			$("body").append("<iframe src='" + data + "' style='display: none;' ></iframe>");
			closeModal();
		});
	}else{
		downloadDemo();
	}
}

function downloadDemo(){
	$("body").append("<iframe src='templates/" + window.temname + "/demo.zip' style='display: none;' ></iframe>");
	closeModal();
}

var undoString = [];
var redoString = [];
window.currentStage = 0;
window.currentRedoStage = 0;

function undo(){
	if($('#undo_button').hasClass('disabled')){
		alert('There is nothing to undo.');
	}else{
		window.currentStage = undoString.length - 1;
		var Current 			= window.currentStage;
		
		console.log(undoString[Current]);
		
		redoString[window.currentRedoStage] = new Array();
		redoString[window.currentRedoStage]['element'] 	= 	undoString[Current]['element'];
		redoString[window.currentRedoStage]['type'] 		= undoString[Current]['type'];
		if(undoString[Current]['type'] == "text"){
			redoString[window.currentRedoStage]['content'] 	= $('[cu-identify='+undoString[Current]['element']+']').html(); //undoString[Current]['content'];
		}else if(undoString[Current]['type'] == "link"){
			redoString[window.currentRedoStage]['content'] 	= $('[cu-identify='+undoString[Current]['element']+']').attr('href');
			redoString[window.currentRedoStage]['third'] 	= $('[cu-identify='+undoString[Current]['element']+']').html(); //undoString[Current]['content'];
		}else if(undoString[Current]['type'] == "image"){
			redoString[window.currentRedoStage]['content'] 	= $('[cu-identify='+undoString[Current]['element']+']').attr('src'); //undoString[Current]['content'];
		}else if(undoString[Current]['type'] == "header"){
		
			redoString[window.currentRedoStage]['content'] 	= undoString[Current]['content'];
			redoString[window.currentRedoStage]['third'] 	= $('#'+undoString[Current]['element']).css('background-image');
			redoString[window.currentRedoStage]['fourth'] 	= $('#'+undoString[Current]['content']).val();
			
		}else if(undoString[Current]['type'] == "module"){
			redoString[window.currentRedoStage]['content'] 	= undoString[Current]['third'];
			redoString[window.currentRedoStage]['third'] 	= undoString[Current]['third'];
		}else if(undoString[Current]['type'] == "color"){
			redoString[window.currentRedoStage]['content'] 	= rgb2hex($('#'+undoString[Current]['third']).css('background-color'));
			redoString[window.currentRedoStage]['third'] 	= undoString[Current]['third'];
		}else if(undoString[Current]['type'] == "pattern"){
			redoString[window.currentRedoStage]['element'] 	= $('#tc_central').css('background');
			redoString[window.currentRedoStage]['content'] 	= $('#tc_central').css('background-color');
			redoString[window.currentRedoStage]['third'] 	= undoString[Current]['fourth'];
			redoString[window.currentRedoStage]['fourth'] 	= undoString[Current]['third'];
		}else if(undoString[Current]['type'] == "bgimage"){
			redoString[window.currentRedoStage]['element'] 	= $('#tc_central').css('background');
			redoString[window.currentRedoStage]['content'] 	= $('#back_url').val(); //undoString[Current]['content'];
		}
		
		
		window.currentRedoStage += 1;
		$('#redo_button').removeClass('disabled');
		
		console.log(undoString[Current]);
		
		if(undoString[Current]['type'] == "text"){
			$('[cu-identify='+undoString[Current]['element']+']').html(undoString[Current]['content']);
		}else if(undoString[Current]['type'] == "link"){
			$('[cu-identify='+undoString[Current]['element']+']').attr('href', undoString[Current]['content']);
			$('[cu-identify='+undoString[Current]['element']+']').html(undoString[Current]['third']);
		}else if(undoString[Current]['type'] == "image"){
			$('[cu-identify='+undoString[Current]['element']+']').attr('src', undoString[Current]['content']);
		}else if(undoString[Current]['type'] == "header"){
			$('#'+undoString[Current]['element']).css({'background-image': undoString[Current]['third']});
			if(undoString[Current]['fourth'] == undefined){
				$('#'+undoString[Current]['content']).val('');
			}else{
				$('#'+undoString[Current]['content']).val(undoString[Current]['fourth']);
			}
		}else if(undoString[Current]['type'] == "color"){
			windowedArray[undoString[Current]['element']].setColor(undoString[Current]['content']);
			$('#'+undoString[Current]['element']).parent().find('input').val(undoString[Current]['content']);
			$('#'+undoString[Current]['third']).html(undoString[Current]['content']);
		}else if(undoString[Current]['type'] == "module"){
			$('#'+undoString[Current]['element']).before($(undoString[Current]['content']));
			$('#'+undoString[Current]['element']).remove();
			$('.removeme').remove();
		}else if(undoString[Current]['type'] == "pattern"){
			if(undoString[Current]['content'] != "none"){
				$('#tc_central').css('background', undoString[Current]['content']);
			}else{
				$('#tc_central').css('background', undoString[Current]['element']);
			}
			$('.image').css({'border':'solid 2px #ffffff', 'margin':'2px'});
			$(undoString[Current]['third']).css({'border':'solid 2px #51c4d4', 'margin':'0px'});
		}else if(undoString[Current]['type'] == "bgimage"){
			$('#tc_central').css('background', undoString[Current]['element']);
			$('#back_url').val(undoString[Current]['content']);
		}
		
		
		undoString.splice(undoString.length - 1, 1);
		
		if(Current == 0){
			undoString 		= new Array();
			window.currentStage 	= 0;
			$('#undo_button').addClass('disabled');
		}
	}
}

function redo(){
	if($('#redo_button').hasClass('disabled')){
		alert('There is nothing to redo.');
	}else{
		//console.log(redoString);
		window.currentRedoStage = redoString.length - 1
		var Current 			= window.currentRedoStage;
		
		if(undoString.length == 0){
			window.currentStage = 0;
		}else{
			window.currentStage = undoString.length;
		}
		
		//console.log(window.currentStage);
		undoString[window.currentStage] = new Array();
		undoString[window.currentStage]['element'] 	= redoString[Current]['element'];
		undoString[window.currentStage]['type'] 		= redoString[Current]['type'];
		
		
		
		if(redoString[Current]['type'] == "text"){
			undoString[window.currentStage]['content'] 	= $('[cu-identify='+redoString[Current]['element']+']').html();
		}else if(redoString[Current]['type'] == "link"){
			undoString[window.currentStage]['content'] 	= $('[cu-identify='+redoString[Current]['element']+']').attr('href');
			undoString[window.currentStage]['third'] 	= $('[cu-identify='+redoString[Current]['element']+']').html(); //undoString[Current]['content'];
		}else if(redoString[Current]['type'] == "image"){
			undoString[window.currentStage]['content'] 	= $('[cu-identify='+redoString[Current]['element']+']').attr('src'); //undoString[Current]['content'];
		}else if(redoString[Current]['type'] == "header"){
		
			undoString[window.currentStage]['content'] 	= redoString[Current]['content'];
			undoString[window.currentStage]['third'] 	= $('#'+redoString[Current]['element']).css('background-image');
			undoString[window.currentStage]['fourth'] 	= $('#'+redoString[Current]['content']).val();
			
		}else if(redoString[Current]['type'] == "module"){
			undoString[window.currentStage]['third'] 	= redoString[Current]['third'];
			undoString[window.currentStage]['content'] 	= $('[cu-identifier='+redoString[Current]['third']+']').outerHTML(); //undoString[Current]['content'];
		}else if(redoString[Current]['type'] == "color"){
			undoString[window.currentStage]['content'] 	= rgb2hex($('#'+redoString[Current]['third']).css('background-color'));
			undoString[window.currentStage]['third'] 	= redoString[Current]['third'];
		}else if(redoString[Current]['type'] == "pattern"){
			undoString[window.currentStage]['element'] 	= $('#tc_central').css('background');
			undoString[window.currentStage]['content'] 	= $('#tc_central').css('background-color');
			undoString[window.currentStage]['third'] 	= redoString[Current]['fourth'];
			undoString[window.currentStage]['fourth'] 	= redoString[Current]['third'];
		}else if(redoString[Current]['type'] == "bgimage"){
			undoString[window.currentStage]['element'] 	= $('#tc_central').css('background');
			undoString[window.currentStage]['content'] 	= $('#back_url').val(); //undoString[Current]['content'];
		}
		
		
		window.currentStage = undoString.length - 1;
		$('#undo_button').removeClass('disabled');
		
		console.log(redoString[Current]);
		
		if(redoString[Current] == undefined){ redo(); }
		
		if(redoString[Current]['type'] == "text"){
			$('[cu-identify='+redoString[Current]['element']+']').html(redoString[Current]['content']);
		}else if(redoString[Current]['type'] == "link"){
			$('[cu-identify='+redoString[Current]['element']+']').attr('href', redoString[Current]['content']);
			$('[cu-identify='+redoString[Current]['element']+']').html(redoString[Current]['third']);
		}else if(redoString[Current]['type'] == "image"){
			$('[cu-identify='+redoString[Current]['element']+']').attr('src', redoString[Current]['content']);
		}else if(redoString[Current]['type'] == "header"){
			$('#'+redoString[Current]['element']).css({'background-image': redoString[Current]['third']});
			if(redoString[Current]['fourth'] == undefined){
				$('#'+redoString[Current]['content']).val('');
			}else{
				$('#'+redoString[Current]['content']).val(redoString[Current]['fourth']);
			}
		}else if(redoString[Current]['type'] == "color"){
		
			windowedArray[redoString[Current]['element']].setColor(redoString[Current]['content']);
			$('#'+redoString[Current]['element']).parent().find('input').val(redoString[Current]['content']);
			$('#'+redoString[Current]['third']).html(redoString[Current]['content']);
			
		}else if(redoString[Current]['type'] == "module"){
			//console.log($(redoString[Current]['content']));
			$('[cu-identifier='+redoString[Current]['third']+']').before('<div id="'+redoString[Current]['element']+'" style="display: none;"></div>');
			$('[cu-identifier='+redoString[Current]['third']+']').remove();
		}else if(redoString[Current]['type'] == "pattern"){
			$('#tc_central').css('background', redoString[Current]['element']);
			$('.image').css({'border':'solid 2px #ffffff', 'margin':'2px'});
			$(undoString[Current]['third']).css({'border':'solid 2px #51c4d4', 'margin':'0px'});
		}else if(redoString[Current]['type'] == "bgimage"){
			$('#tc_central').css('background', redoString[Current]['element']);
			$('#back_url').val(redoString[Current]['content']);
		}
		
		
		if(Current == 0){
			redoString 			= new Array();
			window.currentRedoStage 	= 0;
			$('#redo_button').addClass('disabled');
		}
		
		
		redoString.splice(redoString.length - 1, 1);
		
		/*window.currentRedoStage = window.currentRedoStage - 1;
		if(window.currentRedoStage < 0){
			window.currentRedoStage = 0;
			$('#redo_button').addClass('disabled');
		}
		
		console.log(window.currentRedoStage);
		console.log(redoString.length);
		if(window.currentRedoStage == (redoString.length - 1)){
			$('#redo_button').addClass('disabled');
		}*/
	}
	
}

function addUndo(element, content, type, third, fourth){
	undoString[window.currentStage] = new Array();
	undoString[window.currentStage]['element'] 	= element;
	undoString[window.currentStage]['content'] 	= content; 
	undoString[window.currentStage]['type'] 	= type; 
	if(undoString[window.currentStage]['type'] == "header"){
		undoString[window.currentStage]['third'] 	= $('#'+element).css('background-image');
	}else{
		undoString[window.currentStage]['third'] 	= third;
	}
	undoString[window.currentStage]['fourth'] 	= third; 
	window.currentStage += 1;
	$('#undo_button').removeClass('disabled');
	
	redoString = new Array();
	$('#redo_button').addClass('disabled');
}

function closeIt(option){
	$('#'+option).click();
}

function updateVid(ele, type, src){
	if(src != ""){
		$('.'+ele).find('[video-type='+type+']').attr('src', src);
		$("."+ele).load();
		$("."+ele)[0].load();
	}
}

function toggleAutoPlay(ele, vidclass){
	if($('#'+ele).is(":checked")){
		$('.'+vidclass).attr('autoplay', 'autoplay');
	}else{
		$('.'+vidclass).removeAttr('autoplay');
	}
}

window.defaultPoster = $('video img').attr('poster');

function changePoster(vidclass, src){
	if(src != ""){
		$('.'+vidclass).attr('poster', src);
		$('.'+vidclass).find('img').attr('src', src);
		window.posterImage = src;
	}else{
		$('.'+vidclass).attr('poster', window.defaultPoster);
		$('.'+vidclass).find('img').attr('src', window.defaultPoster);
		window.posterImage = window.defaultPoster;
	}
}

function togglePreview(ele, vidclass){
	if($('#'+ele).is(":checked")){
		//$('.'+vidclass).attr('poster', window.posterImage);
	}else{
		//$('.'+vidclass).removeAttr('poster', '');
	}
}

/* End non triggered editor */