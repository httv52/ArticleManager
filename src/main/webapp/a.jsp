<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en" class="app">
<head>
    <meta charset="utf-8"/>
    <title>Notebook | Web Application</title>
    <script src="https://cdn.bootcss.com/echarts/3.7.0/echarts.simple.js"></script>
    <script src="<c:url value='/js/echarts/echarts-wordcloud.js'/> "></script>

    <style>
        html,body,#main,#bg,#bg img{
            height:800px;
            width:800px;
            margin:0;
        }

    </style>
</head>
<body>
<div id="bg" style="position:absolute;top:0;left:0;">
    <img src="CodeSamaLogoP.png" style="opacity:0.0"></img>
</div>

<div id="main" style="position:absolute;top:0;left:0;"></div>

<script>
    var myChart = echarts.init(document.getElementById("main"));
    var maskImage = new Image();
    maskImage.src = 'CodeSamaLogoP.png';

    var option = {
        tooltip: {},
        series: [{
            type: 'wordCloud',
            gridSize: 2,
            sizeRange: [15, 45],
            rotationRange: [-60, 60],
            rotationStep: 1,
            width: '100%',
            height: '100%',
            shape: 'pentagon',
            maskImage: maskImage,
            drawOutOfBound: false,
            textStyle: {
                normal: {
                    color: function () {
                        return 'rgb(' + [
                            Math.round(Math.random() * 160),
                            Math.round(Math.random() * 160),
                            Math.round(Math.random() * 160)
                        ].join(',') + ')';
                    }
                },
                emphasis: {
                    shadowBlur: 10,
                    shadowColor: '#333'
                }
            },
            data: [
                {name: '代码君', value: 1700},
                {name: 'CodeSama', value: 1700},

                {name: '山里一泼猴', value: 1650},
                {name: '隔壁街老王', value: 1600},
                {name: 'MrChinino', value: 1550},

                {name: 'ChYFx_Christer', value: 1500},
                {name: '这里有蜘蛛°', value: 1450},
                {name: '盒饭工作室', value: 1400},
                {name: 'SuperPaxxs', value: 1350},


                {name: '求大佬关注', value: 1000},
                {name: '求大佬辣条', value: 1000},
                {name: '求大佬灯笼', value: 1000},
                {name: '求大佬亿元', value: 1000},
                {name: '求大佬喵娘', value: 1000},
                {name: '求大佬B坷垃', value: 1000},
                {name: '求大佬节奏风暴', value: 1000},
                {name: '求大佬小电视', value: 1000},
                {name: '求大佬小爆竹', value: 1000},

                {name: '求大佬点赞', value: 1000},
                {name: '求大佬转发', value: 1000},
                {name: '求大佬收藏', value: 1000},
                {name: '求大佬硬币', value: 1000},
                {name: '祝大佬开心', value: 1000},
                {name: '祝大佬健康', value: 1000},
                {name: '祝大佬顺利', value: 1000},
                {name: '祝大佬长寿', value: 1000},
                {name: '祝大佬发财', value: 1000},
                {name: '祝大佬逢考必过', value: 1000},
                {name: '新年好！', value: 1000},
                {name: '过年啦！', value: 1000},
                {name: '哔哩哔哩', value: 1000},
                {name: 'Bilibli', value: 1000},
                {name: '小电视', value: 1000},
                {name: '22娘', value: 1000},
                {name: '33娘', value: 1000},
                {name: '233', value: 1000},
                {name: '666', value: 1000},
                {name: '346623', value: 1000},
                {name: '直播姬', value: 1000},
                {name: '咸鱼撸码', value: 1000},
                {name: '撸码追梦', value: 1000},
                {name: '咸鱼翻身', value: 1000},
                {name: '咸鱼突刺', value: 1000},
                {name: '咕咕咕', value: 1000},
                {name: '串门', value: 1000},
                {name: '同桌加油', value: 1000},
                {name: '感谢投喂', value: 1000},
                {name: '碎碎念', value: 1000},
                {name: '字符云', value: 1000},
                {name: '凑字数', value: 1000},
                {name: '录视频', value: 1000},
                {name: '开麦', value: 1000},
                {name: '开色相头', value: 1000},
                {name: '铜瓜子', value: 1000},
                {name: '铁瓜子', value: 1000},
                {name: '金瓜子', value: 1000},
                {name: '银瓜子', value: 1000},
                {name: '锡瓜子', value: 1000},
                {name: 'HTML', value: 1000},
                {name: 'CSS', value: 1000},
                {name: 'Javascript', value: 1000},
                {name: 'PHP', value: 1000},
                {name: 'SQL', value: 1000},
                {name: 'JSON', value: 1000},
                {name: 'Bootstrap', value: 1000},
                {name: 'Python', value: 1000},
                {name: 'Crawler', value: 1000},
                {name: 'Big', value: 1000},
                {name: 'Data', value: 1000},
                {name: 'Visualization', value: 1000},


            ]
        }]
    };
    maskImage.onload = function () {
        option.series[0].maskImage;
        myChart.setOption(option);
    }

</script>


</body>
</html>
