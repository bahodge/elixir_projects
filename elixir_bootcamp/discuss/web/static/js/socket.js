import { Socket } from 'phoenix';

let socket = new Socket('/socket', { params: { token: window.userToken } });

socket.connect();

const createSocket = (topicId) => {
	let channel = socket.channel(`comments:${topicId}`, {});
	channel
		.join()
		.receive('ok', (resp) => {
			console.log(resp);
			renderComments(resp.comments);
		})
		.receive('error', (resp) => {
			console.log('Unable to join', resp);
		});

	channel.on(`comments:${topicId}:new`, renderComment);

	document.querySelector('button').addEventListener('click', () => {
		const content = document.querySelector('textarea').value;
		channel.push('comment:add', { content: content });
	});
};

function commentTemplete(comment) {
	let email = 'Anon';
	if (comment.user) {
		email = comment.user.email;
	}

	return `
			<li class="collection-item">
				${comment.content}
				<div class="secondary-content">${email}</div>
			</li>
		`;
}

function renderComment(event) {
	const renderedComment = commentTemplete(event.comment);

	document.querySelector('.collection').innerHTML += renderedComment;
}

function renderComments(comments) {
	const renderedComments = comments.map((comment) => {
		return commentTemplete(comment);
	});

	document.querySelector('.collection').innerHTML = renderedComments.join('');
}

window.createSocket = createSocket;
