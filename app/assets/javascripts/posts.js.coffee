$(document).ready ->
	$('#comment form').submit(event) ->
		event.preventDefault()
		
		url = $(this).attr("action")
		author = $('#comment form #comment_author').val()
		content = $('#comment form #comment_content').val()
		comment_title = $('span').text(author + ' said:')
		comment_content = $('div.comment_content').text(content)
		comment = $('div').prepend(comment_content).prepend(comment_title)
		
		$.ajax
			type: 'put'
			url: url
			data: { comment: {author: author, content: content}}
			dataType: 'json'
			success: (json) ->
				$('prev_comments').prepend(comment)
			
			
		