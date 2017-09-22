$(document).ready(function () {
    var cTime = new Date(), month = cTime.getMonth() + 1, year = cTime.getFullYear(), thisday = cTime.getDate();
    ;

    theMonths = ["一月", "二月", "三月", "四月", "五月", "六月", "七月", "八月", "九月", "十月", "十一月", "十二月"];

//	alert(d);

    theDays = ["日", "一", "二", "三", "四", "五", "六"];
    events = [
        [
            thisday + "/" + month + "/" + year,
            '今天',
            'http://www.hutaotao.cn',
            '#fb6b5b'
        ],
        [
            "18/" + month + "/" + year,
            'octocat!',
            'https://github.com/logos',
            'red',
            'new github logo <img src="http://git.io/Xmayvg" />'
        ],
//    [
//      "18/"+month+"/"+year, 
//      'Milestone release', 
//      '#', 
//      '#ffba4d', 
//      'Contents here'
//    ],
        [
            "19/" + month + "/" + year,
            'A link',
            'https://github.com/blog/category/drinkup',
            '#cccccc'
        ]
    ];
    $('#calendar').calendar({
        months: theMonths,
        days: theDays,
        events: events,
        popover_options: {
            placement: 'top',
            html: true
        }
    });
});