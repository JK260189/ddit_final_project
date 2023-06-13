$(function() {
    // 페이지가 로드될 때 로컬 스토리지에서 아이템을 가져와서 추가합니다.

    //localStorage.setItem("todoItems","나재경");
    if (localStorage.getItem('todoItems')) {
        $('.todo-list').html(localStorage.getItem('todoItems'));
    }

    $('.btn-todo-add').on('click', function() {
        let item = $('#TodoInput').val();
        if (item) {
            $('.todo-list').append(
                '<li style="display: flex; justify-content: space-between; font-size: 13px;">' +
                '<span>' +
                item + '</span>' +
                '<div class="todo-action"><span class="btn done p-1 fa fa-check"></span><span class="btn text-danger close p-1 fa fa-trash-o" ></span></div>' +
                '</li>'
            );
            $('input[type="text"]').val('');
            $('.todo-error').hide();

            // 로컬 스토리지에 아이템을 저장합니다.
            localStorage.setItem('todoItems', $('.todo-list').html());
        } else {
            $('.todo-error').show();
        }
    });
	
    $(document).on('click','.todo-list .close',function() {
        console.log("체킁:", this);
        toggleClose(this);
        

        // 로컬 스토리지에 아이템을 저장합니다.
        localStorage.setItem('todoItems', $('.todo-list').html());
    });

    $(document).on('click','.todo-list .done',function() {
        toggleDone(this);

        // 로컬 스토리지에 아이템을 저장합니다.
        localStorage.setItem('todoItems', $('.todo-list').html());
    });

    // Clear 버튼을 클릭했을 때 로컬 스토리지에 저장된 아이템을 제거합니다.
    $('.btn-todo-clear').on('click', function() {
        localStorage.removeItem('todoItems');
        $('.todo-list').html('');
    });

    /* 페이지가 언로드될 때 로컬 스토리지에 아이템을 저장합니다.
    $(window).on('beforeunload', function() {
        console.log("여게 되낭?");
        localStorage.setItem('todoItems', $('.todo-list').html());
    });
    */

    // 초기화할 때 로컬 스토리지의 아이템을 모두 제거합니다.
    // 주석 처리된 부분을 사용하면 페이지가 로드될 때마다 로컬 스토리지가 초기화됩니다.
    //localStorage.clear();
});

function toggleHide() {
    $('.todo-list li').hide();
}

function toggleClose(ele) {
	console.log("체킁",ele);
    $(ele).parent().parent().toggle();
}

function toggleDone(ele) {
    $(ele).parent().parent().toggleClass('active');
}