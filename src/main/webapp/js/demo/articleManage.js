/**
 * Created by ht on 2017/9/29.
 */
var hutao = new $.hutao();

$(function () {

    /*上色*/
    var $state = $("#my_state").val();
    if ($state == '') {
        $("#file-control_All").addClass("text-primary");
    } else {
        $("#file-control_" + $state).addClass("text-primary");
    }

    var $categoryId = $("#my_categoryId").val();
    if ($categoryId == '') {
        $("#categ_all").addClass("text-primary");
    } else {
        $("#categ_" + $categoryId).addClass("text-primary");
    }

    var $tagId = $("#my_tagId").val();
    if ($tagId == '') {
        $("#tag_all").addClass("text-primary");
    } else {
        $("#tag_" + $tagId).addClass("text-primary");
    }

    // class="text-primary"
});

function findByState($state) {
    if ($state == -1) {
        $("#my_state").val('');
    } else {
        $("#my_state").val($state);
    }
    mySubmit();
}

function findByCategory($categId) {
    if ($categId == '-1') {
        $("#my_categoryId").val('');
    } else {
        $("#my_categoryId").val($categId);
    }
    mySubmit();
}

function findByTag($tagId) {
    if ($tagId == '-1') {
        $("#my_tagId").val('');
    } else {
        $("#my_tagId").val($tagId);
    }
    mySubmit();
}

function findByPageNow($pageNow) {
    if ($pageNow == '') {
        $("#my_pageNow").val('1');
    } else {
        $("#my_pageNow").val($pageNow);
    }
    mySubmit();
}

function mySubmit() {
    $("#myform").submit();
}
