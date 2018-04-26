<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en" class="app">
<head>
    <meta charset="utf-8"/>
    <title>Notebook | Web Application</title>
    <script src="<c:url value='/js/echarts/echarts.min.js'/>"></script>
    <script src="<c:url value='/js/echarts/echarts-wordcloud.js'/> "></script>
    <link rel="stylesheet" href="<c:url value='/css/plugins/sweetalert/sweetalert.css'/>" type="text/css"/>

    <style>
        html, body, #main, #bg, #bg img {
            height: 100%;
            width: 100%;
            margin: 0;
        }

    </style>
</head>
<body>

<div id="main" style="position:absolute;top:0;left:0;"></div>

<%--<script type="text/javascript" src="http://cdn-hangzhou.goeasy.io/goeasy.js"></script>--%>
<script src="<c:url value='/js/jquery.min.js'/>"></script>
<script src="<c:url value='/js/plugins/buzyload/app.min.js'/>"></script>
<script src="<c:url value='/js/plugins/sweetalert/sweetalert.min.js'/>"></script>
<script src='<c:url value="/js/demo/myBase.js"/>'></script>
<script>
    // var goEasy = new GoEasy({appkey: 'BC-3dd1d68ec2a44756b728ff9f840a9c76'});
    // goEasy.subscribe({
    //     channel: '系统通知',
    //     onMessage: function(message){
    //         alert('收到：'+message.content);
    //     }
    // });
    var hutao = new $.hutao();

    hutao.post({
        url: '<c:url value="/wordCloud/"/>${aid}',
        success: function (result) {
            handlerResult(result, function () {
                var chart = echarts.init(document.getElementById('main'));
                var maskImage = new Image();
                var option = {
                    tooltip: {},
                    series: [{
                        type: 'wordCloud',
                        gridSize: 2,
                        sizeRange: [12, 50],
                        rotationRange: [-90, 90],
                        shape: 'pentagon',
                        maskImage: maskImage,
                        width: 900,
                        height: 600,
                        drawOutOfBound: true,
                        textStyle: {
                            normal: {
                                color: function () {
                                    return 'rgb(' + [
                                        Math.round(Math.random() * 180),
                                        Math.round(Math.random() * 180),
                                        Math.round(Math.random() * 180)
                                    ].join(',') + ')';
                                }
                            },
                            emphasis: {
                                shadowBlur: 10,
                                shadowColor: '#333'
                            }
                        },
                        data: result.data
                    }]
                };
                maskImage.onload = function () {
                    option.series[0].maskImage
                    chart.setOption(option);
                }
                maskImage.src = "<c:url value='/images/logo-dep.png'/>";
                chart.setOption(option);
                window.onresize = chart.resize;
            });
        }
    });


    /*var chart = echarts.init(document.getElementById('main'));
    var keywords = {
        "visualMap": 22199,
        "continuous": 10288,
        "contoller": 620,
        "series": 274470,
        "gauge": 12311,
        "detail": 1206,
        "piecewise": 4885,
        "textStyle": 32294,
        "markPoint": 18574,
        "pie": 38929,
        "roseType": 969,
        "label": 37517,
        "emphasis": 12053,
        "yAxis": 57299,
        "name": 15418,
        "type": 22905,
        "gridIndex": 5146,
        "normal": 49487,
        "itemStyle": 33837,
        "min": 4500,
        "silent": 5744,
        "animation": 4840,
        "offsetCenter": 232,
        "inverse": 3706,
        "borderColor": 4812,
        "markLine": 16578,
        "line": 76970,
        "radiusAxis": 6704,
        "radar": 15964,
        "data": 60679,
        "dataZoom": 24347,
        "tooltip": 43420,
        "toolbox": 25222,
        "geo": 16904,
        "parallelAxis": 4029,
        "parallel": 5319,
        "max": 3393,
        "bar": 43066,
        "heatmap": 3110,
        "map": 20285,
        "animationDuration": 3425,
        "animationDelay": 2431,
        "splitNumber": 5175,
        "axisLine": 12738,
        "lineStyle": 19601,
        "splitLine": 7133,
        "axisTick": 8831,
        "axisLabel": 17516,
        "pointer": 590,
        "color": 23426,
        "title": 38497,
        "formatter": 15214,
        "slider": 7236,
        "legend": 66514,
        "grid": 28516,
        "smooth": 1295,
        "smoothMonotone": 696,
        "sampling": 757,
        "feature": 12815,
        "saveAsImage": 2616,
        "polar": 6279,
        "calculable": 879,
        "backgroundColor": 9419,
        "excludeComponents": 130,
        "show": 20620,
        "text": 2592,
        "icon": 2782,
        "dimension": 478,
        "inRange": 1060,
        "animationEasing": 2983,
        "animationDurationUpdate": 2259,
        "animationDelayUpdate": 2236,
        "animationEasingUpdate": 2213,
        "xAxis": 89459,
        "angleAxis": 5469,
        "showTitle": 484,
        "dataView": 2754,
        "restore": 932,
        "timeline": 10104,
        "range": 477,
        "value": 5732,
        "precision": 878,
        "target": 1433,
        "zlevel": 5361,
        "symbol": 8718,
        "interval": 7964,
        "symbolSize": 5300,
        "showSymbol": 1247,
        "inside": 8913,
        "xAxisIndex": 3843,
        "orient": 4205,
        "boundaryGap": 5073,
        "nameGap": 4896,
        "zoomLock": 571,
        "hoverAnimation": 2307,
        "legendHoverLink": 3553,
        "stack": 2907,
        "throttle": 466,
        "connectNulls": 897,
        "clipOverflow": 826,
        "startValue": 551,
        "minInterval": 3292,
        "opacity": 3097,
        "splitArea": 4775,
        "filterMode": 635,
        "end": 409,
        "left": 6475,
        "funnel": 2238,
        "lines": 6403,
        "baseline": 431,
        "align": 2608,
        "coord": 897,
        "nameTextStyle": 7477,
        "width": 4338,
        "shadowBlur": 4493,
        "effect": 929,
        "period": 225,
        "areaColor": 631,
        "borderWidth": 3654,
        "nameLocation": 4418,
        "position": 11723,
        "containLabel": 1701,
        "scatter": 10718,
        "areaStyle": 5310,
        "scale": 3859,
        "pieces": 414,
        "categories": 1000,
        "selectedMode": 3825,
        "itemSymbol": 273,
        "effectScatter": 7147,
        "fontStyle": 3376,
        "fontSize": 3386,
        "margin": 1034,
        "iconStyle": 2257,
        "link": 1366,
        "axisPointer": 5245,
        "showDelay": 896,
        "graph": 22194,
        "subtext": 1442,
        "selected": 2881,
        "barCategoryGap": 827,
        "barGap": 1094,
        "barWidth": 1521,
        "coordinateSystem": 3622,
        "barBorderRadius": 284,
        "z": 4014,
        "polarIndex": 1456,
        "shadowOffsetX": 3046,
        "shadowColor": 3771,
        "shadowOffsetY": 2475,
        "height": 1988,
        "barMinHeight": 575,
        "lang": 131,
        "symbolRotate": 2752,
        "symbolOffset": 2549,
        "showAllSymbol": 942,
        "transitionDuration": 993,
        "bottom": 3724,
        "fillerColor": 229,
        "nameMap": 1249,
        "barMaxWidth": 747,
        "radius": 2103,
        "center": 2425,
        "magicType": 3276,
        "labelPrecision": 248,
        "option": 654,
        "seriesIndex": 935,
        "controlPosition": 121,
        "itemGap": 3188,
        "padding": 3481,
        "shadowStyle": 347,
        "boxplot": 1394,
        "labelFormatter": 264,
        "realtime": 631,
        "dataBackgroundColor": 239,
        "showDetail": 247,
        "showDataShadow": 217,
        "x": 684,
        "valueDim": 499,
        "onZero": 931,
        "right": 3255,
        "clockwise": 1035,
        "itemWidth": 1732,
        "trigger": 3840,
        "axis": 379,
        "selectedOffset": 670,
        "startAngle": 1293,
        "minAngle": 590,
        "top": 4637,
        "avoidLabelOverlap": 870,
        "labelLine": 3785,
        "sankey": 2933,
        "endAngle": 213,
        "start": 779,
        "roam": 1738,
        "fontWeight": 2828,
        "fontFamily": 2490,
        "subtextStyle": 2066,
        "indicator": 853,
        "sublink": 708,
        "zoom": 1038,
        "subtarget": 659,
        "length": 1060,
        "itemSize": 505,
        "controlStyle": 452,
        "yAxisIndex": 2529,
        "edgeLabel": 1188,
        "radiusAxisIndex": 354,
        "scaleLimit": 1313,
        "geoIndex": 535,
        "regions": 1892,
        "itemHeight": 1290,
        "nodes": 644,
        "candlestick": 3166,
        "crossStyle": 466,
        "edges": 369,
        "links": 3277,
        "layout": 846,
        "barBorderColor": 721,
        "barBorderWidth": 498,
        "treemap": 3865,
        "y": 367,
        "valueIndex": 704,
        "showLegendSymbol": 482,
        "mapValueCalculation": 492,
        "optionToContent": 264,
        "handleColor": 187,
        "handleSize": 271,
        "showContent": 1853,
        "angleAxisIndex": 406,
        "endValue": 327,
        "triggerOn": 1720,
        "contentToOption": 169,
        "buttonColor": 71,
        "rotate": 1144,
        "hoverLink": 335,
        "outOfRange": 491,
        "textareaColor": 58,
        "textareaBorderColor": 58,
        "textColor": 60,
        "buttonTextColor": 66,
        "category": 336,
        "hideDelay": 786,
        "alwaysShowContent": 1267,
        "extraCssText": 901,
        "effectType": 277,
        "force": 1820,
        "rippleEffect": 723,
        "edgeSymbolSize": 329,
        "showEffectOn": 271,
        "gravity": 199,
        "edgeLength": 193,
        "layoutAnimation": 152,
        "length2": 169,
        "enterable": 957,
        "dim": 83,
        "readOnly": 143,
        "levels": 444,
        "textGap": 256,
        "pixelRatio": 84,
        "nodeScaleRatio": 232,
        "draggable": 249,
        "brushType": 158,
        "brush": 3
    };
    var data = [];
    for (var name in keywords) {
        data.push({
            name: name,
            value: Math.sqrt(keywords[name])
        })
    }
    var maskImage = new Image();
    var option = {
        series: [{
            type: 'wordCloud',
            sizeRange: [10, 100],
            rotationRange: [-90, 90],
            rotationStep: 45,
            gridSize: 2,
            shape: 'pentagon',
            maskImage: maskImage,
            drawOutOfBound: false,
            textStyle: {
                normal: {
                    color: function () {
                        return 'rgb(' + [
                            Math.round(Math.random() * 180),
                            Math.round(Math.random() * 180),
                            Math.round(Math.random() * 180)
                        ].join(',') + ')';
                    }
                },
                emphasis: {
                    color: '#095cc5'
                }
            },
            data: data.sort(function (a, b) {
                return b.value - a.value;
            })
        }]
    };
    maskImage.onload = function () {
        option.series[0].maskImage
        chart.setOption(option);
    }
    maskImage.src = "<c:url value='/images/logo.png'/>";
    window.onresize = function () {
        chart.resize();
    }*/
</script>


</body>
</html>
