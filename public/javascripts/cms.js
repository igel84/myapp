$(document).ready(function() {	
	//
	// СКРЫТИЕ ОБЪЕКТОВ
	//
	$('#f > div').hide();
	$('#editInfo').hide();
	$('#hideShow').hide();
	//
	// УДАЛЕНИЕ ЭЛЕМЕНТА
	//
	$('#dialog').dialog({
		autoOpen: false,
		height: 180,
		modal: true,
		resizable: false,
		buttons: {
			'Подтвердить': function(){
				$(this).dialog('close');
				$('#f > div').hide();		
				$('div#editForm form').attr('method', 'post').attr('action', '/cms/articles/rem');
				$('#but').click();
				//$("#remThis").trigger('click');
			},
			'Отмена': function(){
				$(this).dialog('close');
				$('#f > div').hide();
			}
		}
	});	
	$("#remArticle").click(function() {
		//if ($('.striping tr').attr('class') == 'current') {
		if ($('#f > div').is(':visible')) {		
			$('#dialog').dialog('open');
			//$('div#editForm form').attr('method', 'delete').attr('action', '/cms/articles/rem');
		}	else {
			alert('нужно выбрать строку!');
		}
		return false;
	});
	//
	// АНИМАЦИЯ НАВЕДЕНИЯ МЫШИ НА ОБЬЕКТ
	//	
	$(".striping tr").mousedown(function() {
		$(this).removeClass("over");
		$('.striping tr').removeClass('current');
		$(this).addClass("current");
	});
	$(".striping tr").mouseover(function() {
		$(this).addClass("over");	
	});
	$(".striping tr").mouseout(function() {
		$(this).removeClass("over");	
	});
	//
	// ВЫБОР ЭЛЕМЕНТА
	//
	$(".striping tr").click(function() {
		var id = $(this).attr("id");
		$("#artNum").html("<input id='article_id' name='num_article' size='30' type='text' value='"+id+"'/>");
		$("#subNum").click();
		/*
		var title = $("#title" + id).html();
		var body = $("#body" + id).html();
		var info = $("#info" +id).html();
		
		$('div#editForm form').attr('method', 'post').attr('action', '/cms/articles');
		$("#inputID").html("<input name='id' type='hidden' value='"+id+"'/>");
		$("#inputTitle").html("<input id='title' value='"+title+"' name='title' type='text'/>");
		$("#inputBody").html("<textarea id='body' name='body'>"+body+"</textarea>");
		$("#inputInfo").html("<input id='info' value='"+info+"' name='info' type='text'/>");

		*/
			
	});
	//
	// ДОБАВЛЕНИЕ ЭЛЕМЕНТА
	//
	$("#newArticle").click(function() {
		/*
		$('div#editForm form').attr('method', 'put').attr('action', '/cms/articles/add');
		$("#inputID").html("<input name='id' type='hidden'/>");
		$("#inputTitle").html("<input id='title' value='' name='title' type='text'/>");
		$("#inputBody").html("<textarea id='body' name='body'></textarea>");
		$("#inputInfo").html("<input id='info' value='' name='info' type='text'/>");
		*/
		
		
		//return false;
	});
	//
	// ОТПРАВКА ЭЛЕМЕНТА И СКРЫТИЕ ФОРМЫ
	//
	$('div#editForm form').submit(function() {		
		alert('dfdf');		
		
		if (action == 'rem') {
			alert('dsf');		
			$('div#editForm form').attr('method', 'post').attr('action', '/cms/articles/rem');					
		}
		//$('div#editForm form').attr('method', 'post').attr('action', ('/cms/articles/'+action));		
		$('.striping tr').removeClass('current');
		$('#f hr').next().animate({opacity: 'hide', height:'hide'}, 'slow');	
	});
});
