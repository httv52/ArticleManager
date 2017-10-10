<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%--导入头文件--%>
<%@include file="/WEB-INF/jsps/format/front/head.jsp" %>


<div class="myArticle" style="background-color: #fff;">
    <article class="main-content page-page">
        <div class="post-header">
            <h1 class="title contentControl_2" title="${article.title}">${article.title}</h1>
            <div class="author">
                <a class="myAvatar" href="<c:url value="/p/"/>${article.aid}">
                    <img src="<c:url value='/images/avatar_default.jpg'/>"
                         class="commentHeadImg_white" name="${article.user.uid}" alt="头像">
                </a>
                <div class="info">
                <span class="name" style="color: #333">
                    <a href="/u/7b8915c7f203">${article.user.username}</a>
                </span>
                    <!-- 关注用户按钮 -->
                    <label class="label bg-info m-l-xs">作者</label>
                    <label class="label bg-success m-l-xs">编辑</label>
                    <!-- 文章数据信息 -->
                    <div class="meta">
                        <!-- 如果文章更新时间大于发布时间，那么使用 tooltip 显示更新时间 -->
                        <span class="publish-time" data-toggle="tooltip" data-placement="bottom"
                              title="最后编辑于 ${article.modifiedDateTimeView}">
                        <i class="fa fa-clock-o"></i> ${article.createdDateTimeView}
                        </span>　
                        <span class="views" data-toggle="tooltip" data-placement="bottom" title="浏览数">
                            <i class="fa fa-eye"></i> ${article.views}
                        </span>　
                        <span class="commens" data-toggle="tooltip" data-placement="bottom" title="评论数">
                            <i class="fa fa-comment-o"></i> ${article.commens}
                        </span>　
                        <span data-toggle="tooltip" data-placement="bottom" title="字数">
                            <i class="fa fa-file-text-o"></i> ${article.wordNumber}
                        </span>　
                        <span data-toggle="tooltip" data-placement="bottom" title="分类">
                            <i class="fa fa-book"></i> ${article.category.categoryname}
                        </span>
                    </div>
                </div>
                <!-- 如果是当前作者，加入编辑按钮 -->
            </div>
        </div>
        <div id="post-content" class="post-content" itemprop="articleBody">
            <%--<p class="post-tags">${show_tags()}</p>--%>
            ${article.contentHTMLView}
            <%--<p class="post-info">--%>
            <%--本文由 <a href="">${theme_option('author') ?! 'biezhi'}</a> 创作，采用 <a--%>
            <%--href="https://creativecommons.org/licenses/by/4.0/" target="_blank"--%>
            <%--rel="external nofollow">知识共享署名4.0</a> 国际许可协议进行许可<br>本站文章除注明转载/出处外，均为本站原创或翻译，转载前请务必署名<br>最后编辑时间为:--%>
            <%--${modified('yyyy/MM/dd HH:mm')}--%>
            <%--</p>--%>
            <h2>— end —</h2>
        </div>

        <div class="show-foot" style="margin: 40px 0px 0px;">
            <c:choose>
                <c:when test="${empty article.tagList}">
                    <a class="notebook" href="#">
                        咦，居然没有标签~~~
                    </a>
                </c:when>
                <c:otherwise>
                    <c:forEach items="${article.tagList}" var="tag">
                        <a class="notebook" href="#">
                            <i class="fa fa-tag"></i>
                            <span>${tag.tagname}</span>
                        </a>
                    </c:forEach>
                </c:otherwise>
            </c:choose>
            <div class="copyright" data-toggle="tooltip" data-placement="top"
                 title="商业转载请联系作者获得授权，非商业转载请注明出处，并标注作者。" style="float: right; margin-top: 5px;font-size: 12px;
                 line-height: 1.7; color: #9b9b9b;">
                © 著作权归${article.user.username}所有。
            </div>
        </div>
    </article>

    <div class="col-md-6 col-md-offset-3">
        <section class="panel clearfix bg-dark lter" style="border: 1px solid #e1e1e1;border-radius: 4px;">
            <div class="panel-body">
                <a href="#" class="thumb pull-left m-r" style="padding-top: 5px">
                    <img src="<c:url value='/images/avatar_default.jpg'/>"
                         class="commentHeadImg_white img-circle" name="${article.user.uid}" alt="头像">
                </a>
                <div class="clear contentControl_1"><a href="#" class="text-info"> @${article.user.screenName}</a>
                    <small class="block text-muted">
                        写了 ${article.user.wordNumber} 字，发表了 ${articleNumber} 篇文章，评论了 ${commonnNumber} 次
                    </small>
                    <div class="line"></div>
                    <small class="block text-muted">
                        <i class="fa fa-quote-left fa-fw fa-1x"></i> ${article.user.resume}
                    </small>
                </div>
            </div>
        </section>

        <div class="text-center">
            <div id="combine"></div>
            <p style="margin: 0px">扫描二维码，分享该文章</p>
        </div>
    </div>
    <div class="clearfix"></div>

    <article class="main-content page-comment">
        <div class="line line-dashed"></div>
        <div id="myComment-list" class="myComment-list" style="padding-top: 50px">
            <div class="text-center">
                <form class="new-comment" style="position: relative;margin: 0 0 20px 48px;">
                    <c:choose>
                        <c:when test="${empty sessionScope.loginUser}">
                            <a class="myAvatar">
                                <img src="<c:url value="/images/avatar_default.jpg"/> ">
                            </a>
                            <div class="sign-container" style="text-align: center;">
                                    <%--<a href="10" data-toggle="ajaxModal" class="btn btn-sm btn-default">登录</a>--%>
                                <a href="<c:url value="/user/showLogin"/>"
                                   class="btn btn-danger" style="margin: 11px 10px 0 0;">登录</a>
                                <span style="font-size: 14px;vertical-align: -7px">后便可发表评论</span>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <a class="myAvatar">
                                <img src="<c:url value='#'/>" class="commentHeadImg_white"
                                     name="${sessionScope.loginUser.uid}" alt="头像">
                            </a>
                            <section class="paper">
                                <textarea type="text" class="form-control scrollable" placeholder="写下你的评论..."
                                          style="border: 1px solid #dcdcdc;padding-top: 1px;min-height: 120px;"></textarea>
                            </section>
                            <div class="write-function-block pull-right" style="padding-top: 5px">
                                <a class="cancel">取消</a> 　<a class="btn btn-success">发送</a></div>
                        </c:otherwise>
                    </c:choose>
                </form>
            </div>
        </div>
    </article>





    <div id="comments" class="clearfix" style="padding-top: 30px">
        <c:if test="${empty commentList}">
            <div class="find-nothing text-center">
                <img src="<c:url value="/images/oncontent.png"/>" width="20%">
                <div>暂时没有评论哦~</div>
            </div>
        </c:if>
        <ol class="comment-list">
            <c:forEach items="${commentList}" var="coms">
                <li id="li-comment-${coms.id}" class="comment-body comment-parent comment-odd">
                    <div id="comment-${coms.id}">
                        <div class="comment-view" onclick="">
                            <div class="comment-header">
                                <img class="avatar" src="https://secure.gravatar.com/avatar/f97e618f7fc7c5a5b1cb15b05a547090?s=80&amp;r=G&amp;d=" title="14541" width="80" height="80">
                                <span class="comment-author">
                                <a href="" target="_blank" rel="external nofollow">${coms.user.username}</a>
                            </span>
                            </div>
                            <div class="comment-content">
                                <span class="comment-author-at"></span>
                                <p></p><p>${coms.content}</p>
                                <p></p>
                            </div>
                            <div class="comment-meta">
                                <time class="comment-time">${coms.createdDateTimeView}</time>
                                <span class="comment-reply">
                                <a rel="nofollow" onclick="TaleComment.reply('${coms.id}');">回复</a>
                            </span>
                            </div>
                        </div>
                    </div>
                    <c:if test="${not empty coms.childList}">
                        <div class="comment-children">
                            <ol class="comment-list">
                            <c:forEach items="${coms.childList}" var="child">
                                <li id="li-comment-${child.id}" class="comment-body comment-child comment-level-odd comment-odd">
                                    <div id="comment-${child.id}">
                                        <div class="comment-view">
                                            <div class="comment-header">
                                                <img class="avatar" src="https://secure.gravatar.com/avatar/f97e618f7fc7c5a5b1cb15b05a547090?s=80&amp;r=G&amp;d=" title="44" width="80" height="80">
                                                <span class="comment-author comment-by-author">
                                                    <a href="" rel="external nofollow">${child.user.username}</a>
                                                </span>
                                            </div>
                                            <div class="comment-content">
                                                <p></p><p>${child.content}</p>
                                                <p></p>
                                            </div>
                                            <div class="comment-meta">
                                                <time class="comment-time">${child.createdDateTimeView}</time>
                                                <span class="comment-reply">
                                            <a rel="nofollow" onclick="TaleComment.reply('${child.id}');">回复</a>
                                        </span>
                                            </div>
                                        </div>
                                    </div>
                                </li>
                            </c:forEach>
                            </ol>
                        </div>
                    </c:if>
                </li>
            </c:forEach>
        </ol>


    </div>>

    <%--二维码--%>
    <script src="<c:url value='/js/plugins/QR/qrcode.js'/>"></script>
    <script src="<c:url value='/js/plugins/QR/qart.min.js'/>"></script>
    <%
        String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort();
    %>
    <script>
        $(function () {
            var value = '<%=basePath%><c:url value="/p/${article.aid}"/>';
            var filter = 'color';
            var imagePath = '<c:url value="/images/QR.jpg"/> ';

            var self = this;

            function makeQArt() {
                new QArt({
                    value: value,
                    imagePath: imagePath,
                    filter: filter
                }).make(document.getElementById('combine'));
            }

            function getBase64(file, callback) {
                var reader = new FileReader();
                reader.readAsDataURL(file);
                reader.onload = function () {
                    callback(reader.result);
                };
            }

            makeQArt();
        });
    </script>

</div>


<div id="directory-content" class="directory-content">
    <div id="directory"></div>
</div>
<script>
    $('#directory').html('');
    var postDirectoryBuild = function () {
        var postChildren = function children(childNodes, reg) {
                var result = [],
                    isReg = typeof reg === 'object',
                    isStr = typeof reg === 'string',
                    node, i, len;
                for (i = 0, len = childNodes.length; i < len; i++) {
                    node = childNodes[i];
                    if ((node.nodeType === 1 || node.nodeType === 9) &&
                        (!reg ||
                        isReg && reg.test(node.tagName.toLowerCase()) ||
                        isStr && node.tagName.toLowerCase() === reg)) {
                        result.push(node);
                    }
                }
                return result;
            },
            createPostDirectory = function (article, directory, isDirNum) {
                var contentArr = [],
                    titleId = [],
                    levelArr, root, level,
                    currentList, list, li, link, i, len;
                levelArr = (function (article, contentArr, titleId) {
                    var titleElem = postChildren(article.childNodes, /^h\d$/),
                        levelArr = [],
                        lastNum = 1,
                        lastRevNum = 1,
                        count = 0,
                        guid = 1,
                        id = 'directory' + (Math.random() + '').replace(/\D/, ''),
                        lastRevNum, num, elem;
                    while (titleElem.length) {
                        elem = titleElem.shift();
                        contentArr.push(elem.innerHTML);
                        num = +elem.tagName.match(/\d/)[0];
                        if (num > lastNum) {
                            levelArr.push(1);
                            lastRevNum += 1;
                        } else if (num === lastRevNum ||
                            num > lastRevNum && num <= lastNum) {
                            levelArr.push(0);
                            lastRevNum = lastRevNum;
                        } else if (num < lastRevNum) {
                            levelArr.push(num - lastRevNum);
                            lastRevNum = num;
                        }
                        count += levelArr[levelArr.length - 1];
                        lastNum = num;
                        elem.id = elem.id || (id + guid++);
                        titleId.push(elem.id);
                    }
                    if (count !== 0 && levelArr[0] === 1) levelArr[0] = 0;

                    return levelArr;
                })(article, contentArr, titleId);
                currentList = root = document.createElement('ul');
                dirNum = [0];
                for (i = 0, len = levelArr.length; i < len; i++) {
                    level = levelArr[i];
                    if (level === 1) {
                        list = document.createElement('ul');
                        if (!currentList.lastElementChild) {
                            currentList.appendChild(document.createElement('li'));
                        }
                        currentList.lastElementChild.appendChild(list);
                        currentList = list;
                        dirNum.push(0);
                    } else if (level < 0) {
                        level *= 2;
                        while (level++) {
                            if (level % 2) dirNum.pop();
                            currentList = currentList.parentNode;
                        }
                    }
                    dirNum[dirNum.length - 1]++;
                    li = document.createElement('li');
                    link = document.createElement('a');
                    link.href = '#' + titleId[i];
                    link.innerHTML = !isDirNum ? contentArr[i] :
                        dirNum.join('.') + ' ' + contentArr[i];
                    li.appendChild(link);
                    currentList.appendChild(li);
                }
                directory.appendChild(root);
            };
        createPostDirectory(document.getElementById('post-content'), document.getElementById('directory'), true);
    };
    postDirectoryBuild();
</script>

<%--<script src="<c:url value="/js/plugins/sticky/ResizeSensor.min.js"/> "></script>--%>
<%--<script src="<c:url value="/js/plugins/sticky/theia-sticky-sidebar.min.js"/> "></script>--%>

<script>
    jQuery(document).ready(function () {
        <c:choose>
        <c:when test="${empty article.pageTitle}">
        $("title").html("${article.title} - ${article.user.screenName}");
        </c:when>
        <c:otherwise>
        $("title").html("${article.pageTitle}");
        </c:otherwise>
        </c:choose>


        var $commentHeadImg_white = $(".myArticle").find(".commentHeadImg_white");
        $commentHeadImg_white.each(function () {
            var $hashId = $(this).attr("name");
            changeHeadImg_white($(this), $hashId);
        });

        var $timeEle = $(".dateTimeStamp");
        $timeEle.each(function () {
            var $time = $(this).children(".temp").val();
            var $dateTimeStamp = getDateDiff($time);
            $(this).html($dateTimeStamp);
        });
    });

    function findByPageNow($pageNow) {
        if ($pageNow == '') {
            $("#my_pageNow").val('1');
        } else {
            $("#my_pageNow").val($pageNow);
        }
        $("#index_form").submit();
    }


    document.body.oncopy = function () {
        var htmlDate = window.getSelection().getRangeAt(0);
        if ((htmlDate + "").length < 30) {
            return;
        }

        var hutao = new $.hutao();
        var url = document.location.href;

        var textData = window.getSelection().getRangeAt(0) +
            '\n\n本文著作权归作者 【${article.user.username}】 所有。\n'
            + '商业转载请联系作者获得授权，非商业转载请注明出处：' + url + '\n'
            + '作者个人主页：${article.user.screenName}-${theme.homePage}\n'
            + '来源：${article.user.screenName}的博客';


        event.preventDefault();

        var clipboarddata;
        if (event.clipboardData != null || false || undefined) { //ignore the incorrectness of the truncation
            clipboarddata = event.clipboardData;
        } else if (window.clipboardData != null || false || undefined) {
            clipboarddata = window.clipboardData;
        } else { //default to the last option even if it is null/false/undefined
            clipboarddata = event.originalEvent.clipboardData;
        }
        clipboarddata.setData("text", textData);
    }
</script>

<%--导入头文件--%>
<%@include file="/WEB-INF/jsps/format/front/foot.jsp" %>

