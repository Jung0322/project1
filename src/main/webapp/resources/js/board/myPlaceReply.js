/**
 * reply와 관련된 스크립트
 */

let replyService = (function() {

	function add(reply, callback) {
		console.log("add method 실행");

		$.ajax({
			url: '/replies/new',
			type: 'post',
			contentType: 'application/json',
			data: JSON.stringify(reply),
			success: function(result) {
				if (callback) {
					callback(result);
				}
			},
			error: function(xhr, status, err) {
				error(err);
			}
		})
	} // add end

	function getList(param, callback) {

		let mno = param.mno;
		let page = param.page || 1;

		$.getJSON({
			url: '/replies/pages/' + mno + '/' + page,
			success: function(data) {
				callback(data);
			}
		})
	} // getList end


	function remove(mno, callback, error) {

		a.jax({
			url: '/replies/' + mno,
			type: 'delete',
			contentType: 'application/json',
			data: JSON.stringify({
				nickname: nickname
			}),
			success: function(result) {
				if (callback) {
					callback(result);
				}
			},
			error: function(xhr, status, err) {
				if (error) {
					error(xhr.responseText);
				}
			}

		})
	}// remove end

	function update(reply, callback, error) {

		a.jax({
			url: '/replies/' + reply.mrno,
			type: 'put',
			contentType: 'application/json',
			data: JSON.stringify(reply.nickname),
			success: function(data) {
				if (callback) {
					callback(data);
				}
			},
			error: function(xhr, status, err) {
				if (error) {
					error(xhr.responseText);
				}
			}
		})
	} //update end

	function displayTime(timeValue) {
		var today = new Date();
		var gap = today.getTime() - timeValue;
		var dateObj = new Date(timeValue);

		var str = "";

		//댓글을 작성한 날짜가 24시간 보다 작다면 작성일을 시분초로 보여주기
		if (gap < (1000 * 60 * 60 * 24)) {
			var hh = dateObj.getHours();
			var mi = dateObj.getMinutes();
			var ss = dateObj.getSeconds();

			return [(hh > 9 ? '' : '0') + hh, ':', (mi > 9 ? '' : '0') + mi, ':', (ss > 9 ? '' : '0') + ss].join('');

		} else {
			var yy = dateObj.getFullYear();
			var mm = dateObj.getMonth() + 1;
			var dd = dateObj.getDate();

			return [yy, '/', (mm > 9 ? '' : '0') + mm, '/'(dd > 9 ? '' : '0') + dd].join('');
		}
	} //displayTime end


	return {
		add: add,
		getList: getList,
		remove: remove,
		update: update,
		displayTime: displayTime
	};

})();