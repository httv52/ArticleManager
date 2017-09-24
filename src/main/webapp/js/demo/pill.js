/**
 * Created by ht on 2017/9/23.
 */

$(function () {
    var addMyPill = function ($input, $pillText) {
        var $text = $pillText, $pills = $input.closest('.pillbox'), $repeat = false, $repeatPill;
        if ($text == "")
            return;
        $("li", $pills).text(function (i, v) {
            if (v == $text) {
                $repeatPill = $(this);
                $repeat = true;
            }
        });
        if ($repeat) {
            $repeatPill.fadeOut().fadeIn();
            return;
        }
        ;
        $item = $('<li class="label bg-success">' + $text + '</li> ');
        $item.insertBefore($input);
        $input.val('');
        $pills.trigger('change', $item);
    };

    var addSelectPill = function (e) {

        var $item = $(e.target), $select, $checked = false, $menu, $label;
        $items = $menu.find('li > a > input:checked');
        if ($items.length) {
            alert("123");
            $text = [];
            $items.each(function () {
                var $str = $(this).parent().text();
                $str && $text.push($.trim($str));
                for (var i = 0; i < $text.length; i++) {
                    addPill($("#pillboxInput"), $text[i]);
                }
            });

        }
    }

    // $(document).on('click.dropdown-menu', '.dropdown-select > li > a', addSelectPill);

    /*function contains(arr, obj) {
     var i = arr.length;
     while (i--) {
     if (arr[i] === obj) {
     return true;
     }
     }
     return false;
     }
     */

});