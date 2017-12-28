/*
Navicat MySQL Data Transfer

Source Server         : HuTao
Source Server Version : 50718
Source Host           : localhost:3306
Source Database       : article

Target Server Type    : MYSQL
Target Server Version : 50718
File Encoding         : 65001

Date: 2017-12-28 10:46:48
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for article
-- ----------------------------
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article` (
  `aid` varchar(12) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `pageTitle` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` mediumtext COLLATE utf8_unicode_ci,
  `url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `previewImg` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created` bigint(20) DEFAULT NULL,
  `modified` bigint(20) DEFAULT NULL,
  `type` int(1) NOT NULL,
  `state` int(1) NOT NULL,
  `views` int(10) NOT NULL,
  `commens` int(10) NOT NULL,
  `allowCommon` int(1) NOT NULL COMMENT '允许评论',
  `allowSub` int(1) NOT NULL COMMENT '允许订阅',
  `uid` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `categoryId` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `word_number` int(11) DEFAULT NULL,
  PRIMARY KEY (`aid`),
  KEY `article-user` (`uid`),
  KEY `article_category` (`categoryId`),
  CONSTRAINT `article-user` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`),
  CONSTRAINT `article_category` FOREIGN KEY (`categoryId`) REFERENCES `category` (`categoryId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of article
-- ----------------------------
INSERT INTO `article` VALUES ('10', '文章标题varStatus是<c:forEach>jstl循环标签的一个属性，varStatus属性。就拿varStatus=“status”来说，事实上定义了一个status名的对象作为varStatus的绑定值。该绑定值也就是status封装了当前遍历的状态，比如，可以从该对象上查看是遍历到了第几个元素：${status.count}', '网页标题', '## Hello  World.\r\n\r\n> 第一篇文章总得写点儿什么?...\r\n\r\n----------\r\n\r\n\r\n<!--more-->\r\n\r\n```java\r\npublic static void main(String[] args){\r\n    System.out.println(\"Hello World.\");\r\n}\r\n```\r\n不是每个人都天生拿到一副好牌的，也不是每个人选的路都一直正确，但我见过最上进人，他们没拿到好牌，甚至没有天赋，却能一直默默无声地坚持着。\r\n\r\n这期间，有过泪水和欢笑，也有荆棘和碎石，肩上有重担，心里有渴望，他们走的不快，甚至有点慢，但却从没放弃过。\r\n\r\n\r\n后来啊，不知不觉，他们就到了终点。\r\n\r\n你见过最上进的人是怎样的？\r\n\r\n这个最字，很容易让人误解。\r\n\r\n人生是一趟漫长的旅程，我们的精力，时间，注意力都是有限的，所以最开始不要发力过猛，否则经历挫折后容易一蹶不振。\r\n\r\n请记住，坚持到最后才是胜利。\r\n\r\n当你老了，回首一生的成就与坎坷，大家不会看你最开始走的有多快，而是看你最后走的有多远。\r\n\r\n所以真正上进的人，不是那种用力过猛的努力，而是岁月的长河里从不放弃往前走的人。\r\n\r\n《我们这一代的困惑》中写道：\r\n\r\n这些年我一直提醒自己一件事情，千万不要自己感动自己。\r\n\r\n大部分人看似的努力，不过是愚蠢导致的。什么熬夜看书到天亮，连续几天只睡几小时，多久没放假了，如果这些东西也值得夸耀，那么富士康流水线上任何一个人都比你努力多了。\r\n\r\n人难免天生有自怜的情绪，唯有时刻保持清醒，才能看清真正的价值在哪里。\r\n![alt](http://www.hutaotao.cn:8081/SSMDemo2_img/upload/20171001212832838187285.jpg)\r\n2\r\n\r\n我已经来上海差不多一年了。\r\n\r\n一直都在这一家公司，关于最上进的人，我能想到的，大概就是我的老板了，他让我们叫他老师，毕竟是文化企业。\r\n\r\n我第一天来公司的时候，老师拉我去煲鸡汤。\r\n\r\n他说，只要你不亚于任何人的努力，最后一定会有收获。他说斩钉截铁，我却有点不以为然，毕竟是我是一个鸡汤作者，所有的套路我都懂。\r\n\r\n但真正了解我们老板之后，心情就有些不一样了。\r\n\r\n我们公司的公众号是上海文化类排名第一，但老板大学读的是计算机专业，毕业之后一直在做金融，创业失败后，去大学做讲师。\r\n\r\n他一个工科专业，也不曾去过传统出版业，甚至和文化都沾不上边，更谈不上人脉资源推广了。\r\n\r\n他从12年7月开始做公众号，白天教书，晚上编文章，排版，要授权。就这样，一个人，一个号，365天没有一天断更，他一个人，一个号，粉丝做到了一百万。\r\n\r\n那之后才找了几个兼职，到如今，公司已经有快二十个人了。\r\n\r\n当初我们甚至没有自己的办公室，在小区的居民楼里上班，还要自己背笔记本，我妈一开始还以为我被骗进传销组织里了。\r\n\r\n现在我们已经有了自己的办公楼（ps 不是租的，公司买的，想想上海的房价哦）\r\n\r\n我们老师平常办公就和我们坐在一起，他似乎刷手机很少，去找他的时候他就在哪看书，看书名都是很有文化底蕴的那种。\r\n\r\n他每周都会在我们的平台上讲一节免费微课，全年无间断。\r\n\r\n他会想很多创意，有些成功，能赚钱盈利，他会鼓励大家继续努力。\r\n\r\n有些失败，没有一点起色，但不见他沮丧，失望，过段时间又有新的想法，仿佛从未受过打击一样兴致勃勃，一腔孤勇往前冲。\r\n\r\n\r\n3\r\n\r\n国庆放假期间，我因为有份资料忘带了，就回了趟公司。\r\n\r\n居然看到老师他一个人，没开灯，坐在空荡荡的办公室里加班。\r\n\r\n一问才知道，国庆八天，他有六天都会来公司，因为在公司效率高，不会被打断\r\n\r\n不是一整天没日没夜的那种，是吃完午饭，开车来公司，然后或工作，或看书，到晚饭时间就回家。\r\n\r\n每次双休，我们放假两天，他只放一天。\r\n\r\n我一脸惊讶的时候，他只是笑笑说，也没什么事要做，过来看看书也是好的。\r\n\r\n缓慢，坚定，平和，经过岁月长河检验过的努力，才是真的努力。\r\n\r\n\r\n不是急于求成，也不是踟蹰不前，只是朝着一个方向，慢慢地往前走着。世上没有白走的路，每走一步都算数。\r\n\r\n当然了，有人会说，我如果和你们老板一样有钱我也努力。\r\n\r\n但我老板并没有拿到一手好牌，没有什么资源，也不是富二代，背景普通，天赋平庸，他凭借的只是那种不亚于任何人的努力罢了。\r\n\r\n得知他过去，才发现他以前更牛逼。\r\n\r\n老师他大学毕业后，拿到的是国家铁饭碗，却辞职不干，迈入了证券行业。\r\n\r\n然后创业做互联网金融，带了几个小伙伴，拿到了五百万美金的风投，在陆家嘴最繁华的地带租了一整层做办公室。\r\n\r\n尽管后来遭遇互联网泡沫，公司倒闭了，人员遣散了，可他也没有一蹶不振。\r\n\r\n日子啊，总要过下去。\r\n\r\n这不，现在就有了我们公司吗？\r\n\r\n没有人能永远不失败，牛逼的人只是爬起来继续走罢了。\r\n![alt](http://www.hutaotao.cn:8081/SSMDemo2_img/upload/20171002191425143248644.jpg)\r\n4\r\n\r\n我讲了很多关于我们老师的细节，到底想说什么呢？\r\n\r\n无非是真正上进的人，最后一定能成功，因为他们一直保持着向上走的姿态，没有人天生优秀，但你可以让自己变优秀。\r\n\r\n我们和老师聊天的时候，他甚至会打趣地说，自己比较笨，看书比较慢。\r\n\r\n龟兔赛跑这样浅显的道理我不想再讲。\r\n\r\n但就算你最后还是没能赢得那场比赛，就算有些人一出生就在终点线上，就算你拼尽了全力只不过换来一个普通的一生，那又怎么样呢？\r\n\r\n岂能尽如人意，但求无愧于心。\r\n\r\n忘了说，我们老师都快60了，但他还是往前走。\r\n\r\n所以你害怕什么呢，一开始慢点没关系，但你别停在那啊。\r\n', null, '/img/article_img_0.jpeg', '1506456238295', '1506456240000', '0', '1', '263', '0', '1', '1', '5f01e7e8b32a4c96b7e128cf04e86353', '10', '3068');
INSERT INTO `article` VALUES ('4', '文章标题varStatus是<c:forEach>jstl循环标签的一个属性，varStatus属性。就拿varStatus=“status”来说，事实上定义了一个status名的对象作为varStatus的绑定值。该绑定值也就是status封装了当前遍历的状态，比如，可以从该对象上查看是遍历到了第几个元素：${status.count}', '网页标题', '## Hello  World.\r\n\r\n> 第一篇文章总得写点儿什么?...\r\n\r\n----------\r\n\r\n\r\n<!--more-->\r\n\r\n```java\r\npublic static void main(String[] args){\r\n    System.out.println(\"Hello World.\");\r\n}\r\n```\r\n不是每个人都天生拿到一副好牌的，也不是每个人选的路都一直正确，但我见过最上进人，他们没拿到好牌，甚至没有天赋，却能一直默默无声地坚持着。\r\n\r\n这期间，有过泪水和欢笑，也有荆棘和碎石，肩上有重担，心里有渴望，他们走的不快，甚至有点慢，但却从没放弃过。\r\n\r\n\r\n后来啊，不知不觉，他们就到了终点。\r\n\r\n你见过最上进的人是怎样的？\r\n\r\n这个最字，很容易让人误解。\r\n\r\n人生是一趟漫长的旅程，我们的精力，时间，注意力都是有限的，所以最开始不要发力过猛，否则经历挫折后容易一蹶不振。\r\n\r\n请记住，坚持到最后才是胜利。\r\n\r\n当你老了，回首一生的成就与坎坷，大家不会看你最开始走的有多快，而是看你最后走的有多远。\r\n\r\n所以真正上进的人，不是那种用力过猛的努力，而是岁月的长河里从不放弃往前走的人。\r\n\r\n《我们这一代的困惑》中写道：\r\n\r\n这些年我一直提醒自己一件事情，千万不要自己感动自己。\r\n\r\n大部分人看似的努力，不过是愚蠢导致的。什么熬夜看书到天亮，连续几天只睡几小时，多久没放假了，如果这些东西也值得夸耀，那么富士康流水线上任何一个人都比你努力多了。\r\n\r\n人难免天生有自怜的情绪，唯有时刻保持清醒，才能看清真正的价值在哪里。\r\n![alt](http://www.hutaotao.cn:8081/SSMDemo2_img/upload/20171001212832838187285.jpg)\r\n2\r\n\r\n我已经来上海差不多一年了。\r\n\r\n一直都在这一家公司，关于最上进的人，我能想到的，大概就是我的老板了，他让我们叫他老师，毕竟是文化企业。\r\n\r\n我第一天来公司的时候，老师拉我去煲鸡汤。\r\n\r\n他说，只要你不亚于任何人的努力，最后一定会有收获。他说斩钉截铁，我却有点不以为然，毕竟是我是一个鸡汤作者，所有的套路我都懂。\r\n\r\n但真正了解我们老板之后，心情就有些不一样了。\r\n\r\n我们公司的公众号是上海文化类排名第一，但老板大学读的是计算机专业，毕业之后一直在做金融，创业失败后，去大学做讲师。\r\n\r\n他一个工科专业，也不曾去过传统出版业，甚至和文化都沾不上边，更谈不上人脉资源推广了。\r\n\r\n他从12年7月开始做公众号，白天教书，晚上编文章，排版，要授权。就这样，一个人，一个号，365天没有一天断更，他一个人，一个号，粉丝做到了一百万。\r\n\r\n那之后才找了几个兼职，到如今，公司已经有快二十个人了。\r\n\r\n当初我们甚至没有自己的办公室，在小区的居民楼里上班，还要自己背笔记本，我妈一开始还以为我被骗进传销组织里了。\r\n\r\n现在我们已经有了自己的办公楼（ps 不是租的，公司买的，想想上海的房价哦）\r\n\r\n我们老师平常办公就和我们坐在一起，他似乎刷手机很少，去找他的时候他就在哪看书，看书名都是很有文化底蕴的那种。\r\n\r\n他每周都会在我们的平台上讲一节免费微课，全年无间断。\r\n\r\n他会想很多创意，有些成功，能赚钱盈利，他会鼓励大家继续努力。\r\n\r\n有些失败，没有一点起色，但不见他沮丧，失望，过段时间又有新的想法，仿佛从未受过打击一样兴致勃勃，一腔孤勇往前冲。\r\n\r\n\r\n3\r\n\r\n国庆放假期间，我因为有份资料忘带了，就回了趟公司。\r\n\r\n居然看到老师他一个人，没开灯，坐在空荡荡的办公室里加班。\r\n\r\n一问才知道，国庆八天，他有六天都会来公司，因为在公司效率高，不会被打断\r\n\r\n不是一整天没日没夜的那种，是吃完午饭，开车来公司，然后或工作，或看书，到晚饭时间就回家。\r\n\r\n每次双休，我们放假两天，他只放一天。\r\n\r\n我一脸惊讶的时候，他只是笑笑说，也没什么事要做，过来看看书也是好的。\r\n\r\n缓慢，坚定，平和，经过岁月长河检验过的努力，才是真的努力。\r\n\r\n\r\n不是急于求成，也不是踟蹰不前，只是朝着一个方向，慢慢地往前走着。世上没有白走的路，每走一步都算数。\r\n\r\n当然了，有人会说，我如果和你们老板一样有钱我也努力。\r\n\r\n但我老板并没有拿到一手好牌，没有什么资源，也不是富二代，背景普通，天赋平庸，他凭借的只是那种不亚于任何人的努力罢了。\r\n\r\n得知他过去，才发现他以前更牛逼。\r\n\r\n老师他大学毕业后，拿到的是国家铁饭碗，却辞职不干，迈入了证券行业。\r\n\r\n然后创业做互联网金融，带了几个小伙伴，拿到了五百万美金的风投，在陆家嘴最繁华的地带租了一整层做办公室。\r\n\r\n尽管后来遭遇互联网泡沫，公司倒闭了，人员遣散了，可他也没有一蹶不振。\r\n\r\n日子啊，总要过下去。\r\n\r\n这不，现在就有了我们公司吗？\r\n\r\n没有人能永远不失败，牛逼的人只是爬起来继续走罢了。\r\n![alt](http://www.hutaotao.cn:8081/SSMDemo2_img/upload/20171002191425143248644.jpg)\r\n4\r\n\r\n我讲了很多关于我们老师的细节，到底想说什么呢？\r\n\r\n无非是真正上进的人，最后一定能成功，因为他们一直保持着向上走的姿态，没有人天生优秀，但你可以让自己变优秀。\r\n\r\n我们和老师聊天的时候，他甚至会打趣地说，自己比较笨，看书比较慢。\r\n\r\n龟兔赛跑这样浅显的道理我不想再讲。\r\n\r\n但就算你最后还是没能赢得那场比赛，就算有些人一出生就在终点线上，就算你拼尽了全力只不过换来一个普通的一生，那又怎么样呢？\r\n\r\n岂能尽如人意，但求无愧于心。\r\n\r\n忘了说，我们老师都快60了，但他还是往前走。\r\n\r\n所以你害怕什么呢，一开始慢点没关系，但你别停在那啊。\r\n', null, '/img/article_img_1.jpeg', '1506456238295', '1506456238295', '0', '1', '44', '0', '1', '1', '5f01e7e8b32a4c96b7e128cf04e86353', '32bc0907559c43209e11ed58836dcc0a', '1025');
INSERT INTO `article` VALUES ('4514', '文章标题varStatus是<c:forEach>jstl循环标签的一个属性，varStatus属性。就拿varStatus=“status”来说，事实上定义了一个status名的对象作为varStatus的绑定值。该绑定值也就是status封装了当前遍历的状态，比如，可以从该对象上查看是遍历到了第几个元素：${status.count}', '网页标题', '## Hello  World.\r\n\r\n> 第一篇文章总得写点儿什么?...\r\n\r\n----------\r\n\r\n\r\n<!--more-->\r\n\r\n```java\r\npublic static void main(String[] args){\r\n    System.out.println(\"Hello World.\");\r\n}\r\n```\r\n不是每个人都天生拿到一副好牌的，也不是每个人选的路都一直正确，但我见过最上进人，他们没拿到好牌，甚至没有天赋，却能一直默默无声地坚持着。\r\n\r\n这期间，有过泪水和欢笑，也有荆棘和碎石，肩上有重担，心里有渴望，他们走的不快，甚至有点慢，但却从没放弃过。\r\n\r\n\r\n后来啊，不知不觉，他们就到了终点。\r\n\r\n你见过最上进的人是怎样的？\r\n\r\n这个最字，很容易让人误解。\r\n\r\n人生是一趟漫长的旅程，我们的精力，时间，注意力都是有限的，所以最开始不要发力过猛，否则经历挫折后容易一蹶不振。\r\n\r\n请记住，坚持到最后才是胜利。\r\n\r\n当你老了，回首一生的成就与坎坷，大家不会看你最开始走的有多快，而是看你最后走的有多远。\r\n\r\n所以真正上进的人，不是那种用力过猛的努力，而是岁月的长河里从不放弃往前走的人。\r\n\r\n《我们这一代的困惑》中写道：\r\n\r\n这些年我一直提醒自己一件事情，千万不要自己感动自己。\r\n\r\n大部分人看似的努力，不过是愚蠢导致的。什么熬夜看书到天亮，连续几天只睡几小时，多久没放假了，如果这些东西也值得夸耀，那么富士康流水线上任何一个人都比你努力多了。\r\n\r\n人难免天生有自怜的情绪，唯有时刻保持清醒，才能看清真正的价值在哪里。\r\n![alt](http://www.hutaotao.cn:8081/SSMDemo2_img/upload/20171001212832838187285.jpg)\r\n2\r\n\r\n我已经来上海差不多一年了。\r\n\r\n一直都在这一家公司，关于最上进的人，我能想到的，大概就是我的老板了，他让我们叫他老师，毕竟是文化企业。\r\n\r\n我第一天来公司的时候，老师拉我去煲鸡汤。\r\n\r\n他说，只要你不亚于任何人的努力，最后一定会有收获。他说斩钉截铁，我却有点不以为然，毕竟是我是一个鸡汤作者，所有的套路我都懂。\r\n\r\n但真正了解我们老板之后，心情就有些不一样了。\r\n\r\n我们公司的公众号是上海文化类排名第一，但老板大学读的是计算机专业，毕业之后一直在做金融，创业失败后，去大学做讲师。\r\n\r\n他一个工科专业，也不曾去过传统出版业，甚至和文化都沾不上边，更谈不上人脉资源推广了。\r\n\r\n他从12年7月开始做公众号，白天教书，晚上编文章，排版，要授权。就这样，一个人，一个号，365天没有一天断更，他一个人，一个号，粉丝做到了一百万。\r\n\r\n那之后才找了几个兼职，到如今，公司已经有快二十个人了。\r\n\r\n当初我们甚至没有自己的办公室，在小区的居民楼里上班，还要自己背笔记本，我妈一开始还以为我被骗进传销组织里了。\r\n\r\n现在我们已经有了自己的办公楼（ps 不是租的，公司买的，想想上海的房价哦）\r\n\r\n我们老师平常办公就和我们坐在一起，他似乎刷手机很少，去找他的时候他就在哪看书，看书名都是很有文化底蕴的那种。\r\n\r\n他每周都会在我们的平台上讲一节免费微课，全年无间断。\r\n\r\n他会想很多创意，有些成功，能赚钱盈利，他会鼓励大家继续努力。\r\n\r\n有些失败，没有一点起色，但不见他沮丧，失望，过段时间又有新的想法，仿佛从未受过打击一样兴致勃勃，一腔孤勇往前冲。\r\n\r\n\r\n3\r\n\r\n国庆放假期间，我因为有份资料忘带了，就回了趟公司。\r\n\r\n居然看到老师他一个人，没开灯，坐在空荡荡的办公室里加班。\r\n\r\n一问才知道，国庆八天，他有六天都会来公司，因为在公司效率高，不会被打断\r\n\r\n不是一整天没日没夜的那种，是吃完午饭，开车来公司，然后或工作，或看书，到晚饭时间就回家。\r\n\r\n每次双休，我们放假两天，他只放一天。\r\n\r\n我一脸惊讶的时候，他只是笑笑说，也没什么事要做，过来看看书也是好的。\r\n\r\n缓慢，坚定，平和，经过岁月长河检验过的努力，才是真的努力。\r\n\r\n\r\n不是急于求成，也不是踟蹰不前，只是朝着一个方向，慢慢地往前走着。世上没有白走的路，每走一步都算数。\r\n\r\n当然了，有人会说，我如果和你们老板一样有钱我也努力。\r\n\r\n但我老板并没有拿到一手好牌，没有什么资源，也不是富二代，背景普通，天赋平庸，他凭借的只是那种不亚于任何人的努力罢了。\r\n\r\n得知他过去，才发现他以前更牛逼。\r\n\r\n老师他大学毕业后，拿到的是国家铁饭碗，却辞职不干，迈入了证券行业。\r\n\r\n然后创业做互联网金融，带了几个小伙伴，拿到了五百万美金的风投，在陆家嘴最繁华的地带租了一整层做办公室。\r\n\r\n尽管后来遭遇互联网泡沫，公司倒闭了，人员遣散了，可他也没有一蹶不振。\r\n\r\n日子啊，总要过下去。\r\n\r\n这不，现在就有了我们公司吗？\r\n\r\n没有人能永远不失败，牛逼的人只是爬起来继续走罢了。\r\n![alt](http://www.hutaotao.cn:8081/SSMDemo2_img/upload/20171002191425143248644.jpg)\r\n4\r\n\r\n我讲了很多关于我们老师的细节，到底想说什么呢？\r\n\r\n无非是真正上进的人，最后一定能成功，因为他们一直保持着向上走的姿态，没有人天生优秀，但你可以让自己变优秀。\r\n\r\n我们和老师聊天的时候，他甚至会打趣地说，自己比较笨，看书比较慢。\r\n\r\n龟兔赛跑这样浅显的道理我不想再讲。\r\n\r\n但就算你最后还是没能赢得那场比赛，就算有些人一出生就在终点线上，就算你拼尽了全力只不过换来一个普通的一生，那又怎么样呢？\r\n\r\n岂能尽如人意，但求无愧于心。\r\n\r\n忘了说，我们老师都快60了，但他还是往前走。\r\n\r\n所以你害怕什么呢，一开始慢点没关系，但你别停在那啊。\r\n', null, '/img/article_img_2.jpeg', '1506456238295', '1506456238295', '0', '1', '78', '0', '1', '1', '5f01e7e8b32a4c96b7e128cf04e86353', '42a20b0944014bf9886efa29fdb1161b', '1024');
INSERT INTO `article` VALUES ('45145', '文章标题varStatus是<c:forEach>jstl循环标签的一个属性，varStatus属性。就拿varStatus=“status”来说，事实上定义了一个status名的对象作为varStatus的绑定值。该绑定值也就是status封装了当前遍历的状态，比如，可以从该对象上查看是遍历到了第几个元素：${status.count}', '网页标题', '## Hello  World.\r\n\r\n> 第一篇文章总得写点儿什么?...\r\n\r\n----------\r\n\r\n\r\n<!--more-->\r\n\r\n```java\r\npublic static void main(String[] args){\r\n    System.out.println(\"Hello World.\");\r\n}\r\n```\r\n不是每个人都天生拿到一副好牌的，也不是每个人选的路都一直正确，但我见过最上进人，他们没拿到好牌，甚至没有天赋，却能一直默默无声地坚持着。\r\n\r\n这期间，有过泪水和欢笑，也有荆棘和碎石，肩上有重担，心里有渴望，他们走的不快，甚至有点慢，但却从没放弃过。\r\n\r\n\r\n后来啊，不知不觉，他们就到了终点。\r\n\r\n你见过最上进的人是怎样的？\r\n\r\n这个最字，很容易让人误解。\r\n\r\n人生是一趟漫长的旅程，我们的精力，时间，注意力都是有限的，所以最开始不要发力过猛，否则经历挫折后容易一蹶不振。\r\n\r\n请记住，坚持到最后才是胜利。\r\n\r\n当你老了，回首一生的成就与坎坷，大家不会看你最开始走的有多快，而是看你最后走的有多远。\r\n\r\n所以真正上进的人，不是那种用力过猛的努力，而是岁月的长河里从不放弃往前走的人。\r\n\r\n《我们这一代的困惑》中写道：\r\n\r\n这些年我一直提醒自己一件事情，千万不要自己感动自己。\r\n\r\n大部分人看似的努力，不过是愚蠢导致的。什么熬夜看书到天亮，连续几天只睡几小时，多久没放假了，如果这些东西也值得夸耀，那么富士康流水线上任何一个人都比你努力多了。\r\n\r\n人难免天生有自怜的情绪，唯有时刻保持清醒，才能看清真正的价值在哪里。\r\n![alt](http://www.hutaotao.cn:8081/SSMDemo2_img/upload/20171001212832838187285.jpg)\r\n2\r\n\r\n我已经来上海差不多一年了。\r\n\r\n一直都在这一家公司，关于最上进的人，我能想到的，大概就是我的老板了，他让我们叫他老师，毕竟是文化企业。\r\n\r\n我第一天来公司的时候，老师拉我去煲鸡汤。\r\n\r\n他说，只要你不亚于任何人的努力，最后一定会有收获。他说斩钉截铁，我却有点不以为然，毕竟是我是一个鸡汤作者，所有的套路我都懂。\r\n\r\n但真正了解我们老板之后，心情就有些不一样了。\r\n\r\n我们公司的公众号是上海文化类排名第一，但老板大学读的是计算机专业，毕业之后一直在做金融，创业失败后，去大学做讲师。\r\n\r\n他一个工科专业，也不曾去过传统出版业，甚至和文化都沾不上边，更谈不上人脉资源推广了。\r\n\r\n他从12年7月开始做公众号，白天教书，晚上编文章，排版，要授权。就这样，一个人，一个号，365天没有一天断更，他一个人，一个号，粉丝做到了一百万。\r\n\r\n那之后才找了几个兼职，到如今，公司已经有快二十个人了。\r\n\r\n当初我们甚至没有自己的办公室，在小区的居民楼里上班，还要自己背笔记本，我妈一开始还以为我被骗进传销组织里了。\r\n\r\n现在我们已经有了自己的办公楼（ps 不是租的，公司买的，想想上海的房价哦）\r\n\r\n我们老师平常办公就和我们坐在一起，他似乎刷手机很少，去找他的时候他就在哪看书，看书名都是很有文化底蕴的那种。\r\n\r\n他每周都会在我们的平台上讲一节免费微课，全年无间断。\r\n\r\n他会想很多创意，有些成功，能赚钱盈利，他会鼓励大家继续努力。\r\n\r\n有些失败，没有一点起色，但不见他沮丧，失望，过段时间又有新的想法，仿佛从未受过打击一样兴致勃勃，一腔孤勇往前冲。\r\n\r\n\r\n3\r\n\r\n国庆放假期间，我因为有份资料忘带了，就回了趟公司。\r\n\r\n居然看到老师他一个人，没开灯，坐在空荡荡的办公室里加班。\r\n\r\n一问才知道，国庆八天，他有六天都会来公司，因为在公司效率高，不会被打断\r\n\r\n不是一整天没日没夜的那种，是吃完午饭，开车来公司，然后或工作，或看书，到晚饭时间就回家。\r\n\r\n每次双休，我们放假两天，他只放一天。\r\n\r\n我一脸惊讶的时候，他只是笑笑说，也没什么事要做，过来看看书也是好的。\r\n\r\n缓慢，坚定，平和，经过岁月长河检验过的努力，才是真的努力。\r\n\r\n\r\n不是急于求成，也不是踟蹰不前，只是朝着一个方向，慢慢地往前走着。世上没有白走的路，每走一步都算数。\r\n\r\n当然了，有人会说，我如果和你们老板一样有钱我也努力。\r\n\r\n但我老板并没有拿到一手好牌，没有什么资源，也不是富二代，背景普通，天赋平庸，他凭借的只是那种不亚于任何人的努力罢了。\r\n\r\n得知他过去，才发现他以前更牛逼。\r\n\r\n老师他大学毕业后，拿到的是国家铁饭碗，却辞职不干，迈入了证券行业。\r\n\r\n然后创业做互联网金融，带了几个小伙伴，拿到了五百万美金的风投，在陆家嘴最繁华的地带租了一整层做办公室。\r\n\r\n尽管后来遭遇互联网泡沫，公司倒闭了，人员遣散了，可他也没有一蹶不振。\r\n\r\n日子啊，总要过下去。\r\n\r\n这不，现在就有了我们公司吗？\r\n\r\n没有人能永远不失败，牛逼的人只是爬起来继续走罢了。\r\n![alt](http://www.hutaotao.cn:8081/SSMDemo2_img/upload/20171002191425143248644.jpg)\r\n4\r\n\r\n我讲了很多关于我们老师的细节，到底想说什么呢？\r\n\r\n无非是真正上进的人，最后一定能成功，因为他们一直保持着向上走的姿态，没有人天生优秀，但你可以让自己变优秀。\r\n\r\n我们和老师聊天的时候，他甚至会打趣地说，自己比较笨，看书比较慢。\r\n\r\n龟兔赛跑这样浅显的道理我不想再讲。\r\n\r\n但就算你最后还是没能赢得那场比赛，就算有些人一出生就在终点线上，就算你拼尽了全力只不过换来一个普通的一生，那又怎么样呢？\r\n\r\n岂能尽如人意，但求无愧于心。\r\n\r\n忘了说，我们老师都快60了，但他还是往前走。\r\n\r\n所以你害怕什么呢，一开始慢点没关系，但你别停在那啊。\r\n', null, '/img/article_img_3.jpeg', '1506456238295', '1506456238295', '0', '1', '14', '0', '1', '1', '5f01e7e8b32a4c96b7e128cf04e86353', '5654645', '1024');
INSERT INTO `article` VALUES ('5', '文章标题varStatus是<c:forEach>jstl循环标签的一个属性，varStatus属性。就拿varStatus=“status”来说，事实上定义了一个status名的对象作为varStatus的绑定值。该绑定值也就是status封装了当前遍历的状态，比如，可以从该对象上查看是遍历到了第几个元素：${status.count}', '网页标题', '## Hello  World.\r\n\r\n> 第一篇文章总得写点儿什么?...\r\n\r\n----------\r\n\r\n\r\n<!--more-->\r\n\r\n```java\r\npublic static void main(String[] args){\r\n    System.out.println(\"Hello World.\");\r\n}\r\n```\r\n不是每个人都天生拿到一副好牌的，也不是每个人选的路都一直正确，但我见过最上进人，他们没拿到好牌，甚至没有天赋，却能一直默默无声地坚持着。\r\n\r\n这期间，有过泪水和欢笑，也有荆棘和碎石，肩上有重担，心里有渴望，他们走的不快，甚至有点慢，但却从没放弃过。\r\n\r\n\r\n后来啊，不知不觉，他们就到了终点。\r\n\r\n你见过最上进的人是怎样的？\r\n\r\n这个最字，很容易让人误解。\r\n\r\n人生是一趟漫长的旅程，我们的精力，时间，注意力都是有限的，所以最开始不要发力过猛，否则经历挫折后容易一蹶不振。\r\n\r\n请记住，坚持到最后才是胜利。\r\n\r\n当你老了，回首一生的成就与坎坷，大家不会看你最开始走的有多快，而是看你最后走的有多远。\r\n\r\n所以真正上进的人，不是那种用力过猛的努力，而是岁月的长河里从不放弃往前走的人。\r\n\r\n《我们这一代的困惑》中写道：\r\n\r\n这些年我一直提醒自己一件事情，千万不要自己感动自己。\r\n\r\n大部分人看似的努力，不过是愚蠢导致的。什么熬夜看书到天亮，连续几天只睡几小时，多久没放假了，如果这些东西也值得夸耀，那么富士康流水线上任何一个人都比你努力多了。\r\n\r\n人难免天生有自怜的情绪，唯有时刻保持清醒，才能看清真正的价值在哪里。\r\n![alt](http://www.hutaotao.cn:8081/SSMDemo2_img/upload/20171001212832838187285.jpg)\r\n2\r\n\r\n我已经来上海差不多一年了。\r\n\r\n一直都在这一家公司，关于最上进的人，我能想到的，大概就是我的老板了，他让我们叫他老师，毕竟是文化企业。\r\n\r\n我第一天来公司的时候，老师拉我去煲鸡汤。\r\n\r\n他说，只要你不亚于任何人的努力，最后一定会有收获。他说斩钉截铁，我却有点不以为然，毕竟是我是一个鸡汤作者，所有的套路我都懂。\r\n\r\n但真正了解我们老板之后，心情就有些不一样了。\r\n\r\n我们公司的公众号是上海文化类排名第一，但老板大学读的是计算机专业，毕业之后一直在做金融，创业失败后，去大学做讲师。\r\n\r\n他一个工科专业，也不曾去过传统出版业，甚至和文化都沾不上边，更谈不上人脉资源推广了。\r\n\r\n他从12年7月开始做公众号，白天教书，晚上编文章，排版，要授权。就这样，一个人，一个号，365天没有一天断更，他一个人，一个号，粉丝做到了一百万。\r\n\r\n那之后才找了几个兼职，到如今，公司已经有快二十个人了。\r\n\r\n当初我们甚至没有自己的办公室，在小区的居民楼里上班，还要自己背笔记本，我妈一开始还以为我被骗进传销组织里了。\r\n\r\n现在我们已经有了自己的办公楼（ps 不是租的，公司买的，想想上海的房价哦）\r\n\r\n我们老师平常办公就和我们坐在一起，他似乎刷手机很少，去找他的时候他就在哪看书，看书名都是很有文化底蕴的那种。\r\n\r\n他每周都会在我们的平台上讲一节免费微课，全年无间断。\r\n\r\n他会想很多创意，有些成功，能赚钱盈利，他会鼓励大家继续努力。\r\n\r\n有些失败，没有一点起色，但不见他沮丧，失望，过段时间又有新的想法，仿佛从未受过打击一样兴致勃勃，一腔孤勇往前冲。\r\n\r\n\r\n3\r\n\r\n国庆放假期间，我因为有份资料忘带了，就回了趟公司。\r\n\r\n居然看到老师他一个人，没开灯，坐在空荡荡的办公室里加班。\r\n\r\n一问才知道，国庆八天，他有六天都会来公司，因为在公司效率高，不会被打断\r\n\r\n不是一整天没日没夜的那种，是吃完午饭，开车来公司，然后或工作，或看书，到晚饭时间就回家。\r\n\r\n每次双休，我们放假两天，他只放一天。\r\n\r\n我一脸惊讶的时候，他只是笑笑说，也没什么事要做，过来看看书也是好的。\r\n\r\n缓慢，坚定，平和，经过岁月长河检验过的努力，才是真的努力。\r\n\r\n\r\n不是急于求成，也不是踟蹰不前，只是朝着一个方向，慢慢地往前走着。世上没有白走的路，每走一步都算数。\r\n\r\n当然了，有人会说，我如果和你们老板一样有钱我也努力。\r\n\r\n但我老板并没有拿到一手好牌，没有什么资源，也不是富二代，背景普通，天赋平庸，他凭借的只是那种不亚于任何人的努力罢了。\r\n\r\n得知他过去，才发现他以前更牛逼。\r\n\r\n老师他大学毕业后，拿到的是国家铁饭碗，却辞职不干，迈入了证券行业。\r\n\r\n然后创业做互联网金融，带了几个小伙伴，拿到了五百万美金的风投，在陆家嘴最繁华的地带租了一整层做办公室。\r\n\r\n尽管后来遭遇互联网泡沫，公司倒闭了，人员遣散了，可他也没有一蹶不振。\r\n\r\n日子啊，总要过下去。\r\n\r\n这不，现在就有了我们公司吗？\r\n\r\n没有人能永远不失败，牛逼的人只是爬起来继续走罢了。\r\n![alt](http://www.hutaotao.cn:8081/SSMDemo2_img/upload/20171002191425143248644.jpg)\r\n4\r\n\r\n我讲了很多关于我们老师的细节，到底想说什么呢？\r\n\r\n无非是真正上进的人，最后一定能成功，因为他们一直保持着向上走的姿态，没有人天生优秀，但你可以让自己变优秀。\r\n\r\n我们和老师聊天的时候，他甚至会打趣地说，自己比较笨，看书比较慢。\r\n\r\n龟兔赛跑这样浅显的道理我不想再讲。\r\n\r\n但就算你最后还是没能赢得那场比赛，就算有些人一出生就在终点线上，就算你拼尽了全力只不过换来一个普通的一生，那又怎么样呢？\r\n\r\n岂能尽如人意，但求无愧于心。\r\n\r\n忘了说，我们老师都快60了，但他还是往前走。\r\n\r\n所以你害怕什么呢，一开始慢点没关系，但你别停在那啊。\r\n', null, '/img/article_img_4.jpeg', '1506456238295', '1506456238295', '0', '1', '51', '0', '1', '1', '5f01e7e8b32a4c96b7e128cf04e86353', '5654646', '1024');
INSERT INTO `article` VALUES ('52', '文章标题varStatus是<c:forEach>jstl循环标签的一个属性，varStatus属性。就拿varStatus=“status”来说，事实上定义了一个status名的对象作为varStatus的绑定值。该绑定值也就是status封装了当前遍历的状态，比如，可以从该对象上查看是遍历到了第几个元素：${status.count}', '网页标题', 'varStatus是<c:forEach>jstl循环标签的一个属性，varStatus属性。就拿varStatus=“status”来说，事实上定义了一个status名的对象作为varStatus的绑定值。该绑定值也就是status封装了当前遍历的状态，比如，可以从该对象上查看是遍历到了第几个元素：${status.count}', null, '/img/article_img_5.jpeg', '1506456238295', '1506456238295', '0', '1', '51', '0', '1', '1', '5f01e7e8b32a4c96b7e128cf04e86353', 'b7e006644b18443ea5efab65d7e6ca13', '1024');
INSERT INTO `article` VALUES ('55897', '文章标题varStatus是<c:forEach>jstl循环标签的一个属性，varStatus属性。就拿varStatus=“status”来说，事实上定义了一个status名的对象作为varStatus的绑定值。该绑定值也就是status封装了当前遍历的状态，比如，可以从该对象上查看是遍历到了第几个元素：${status.count}', '网页标题', 'varStatus是<c:forEach>jstl循环标签的一个属性，varStatus属性。就拿varStatus=“status”来说，事实上定义了一个status名的对象作为varStatus的绑定值。该绑定值也就是status封装了当前遍历的状态，比如，可以从该对象上查看是遍历到了第几个元素：${status.count}', null, '/img/article_img_6.jpeg', '1506456238295', '1506456238295', '0', '1', '1', '0', '1', '1', '5f01e7e8b32a4c96b7e128cf04e86353', '10', '1024');
INSERT INTO `article` VALUES ('5664', '文章标题varStatus是<c:forEach>jstl循环标签的一个属性，varStatus属性。就拿varStatus=“status”来说，事实上定义了一个status名的对象作为varStatus的绑定值。该绑定值也就是status封装了当前遍历的状态，比如，可以从该对象上查看是遍历到了第几个元素：${status.count}', '网页标题', 'varStatus是<c:forEach>jstl循环标签的一个属性，varStatus属性。就拿varStatus=“status”来说，事实上定义了一个status名的对象作为varStatus的绑定值。该绑定值也就是status封装了当前遍历的状态，比如，可以从该对象上查看是遍历到了第几个元素：${status.count}', null, '/img/article_img_7.jpeg', '1506456238295', '1506456238295', '0', '1', '8', '0', '1', '1', '5f01e7e8b32a4c96b7e128cf04e86353', '0', '1024');
INSERT INTO `article` VALUES ('57478', '文章标题varStatus是<c:forEach>jstl循环标签的一个属性，varStatus属性。就拿varStatus=“status”来说，事实上定义了一个status名的对象作为varStatus的绑定值。该绑定值也就是status封装了当前遍历的状态，比如，可以从该对象上查看是遍历到了第几个元素：${status.count}', '网页标题', 'varStatus是<c:forEach>jstl循环标签的一个属性，varStatus属性。就拿varStatus=“status”来说，事实上定义了一个status名的对象作为varStatus的绑定值。该绑定值也就是status封装了当前遍历的状态，比如，可以从该对象上查看是遍历到了第几个元素：${status.count}', null, '/img/article_img_8.jpeg', '1506456238295', '1506456238295', '0', '1', '23', '0', '1', '1', '5f01e7e8b32a4c96b7e128cf04e86353', '5654645', '1024');
INSERT INTO `article` VALUES ('58494', '文章标题varStatus是<c:forEach>jstl循环标签的一个属性，varStatus属性。就拿varStatus=“status”来说，事实上定义了一个status名的对象作为varStatus的绑定值。该绑定值也就是status封装了当前遍历的状态，比如，可以从该对象上查看是遍历到了第几个元素：${status.count}', '网页标题', 'varStatus是<c:forEach>jstl循环标签的一个属性，varStatus属性。就拿varStatus=“status”来说，事实上定义了一个status名的对象作为varStatus的绑定值。该绑定值也就是status封装了当前遍历的状态，比如，可以从该对象上查看是遍历到了第几个元素：${status.count}', null, '/img/article_img_9.jpeg', '1506456238295', '1506456238295', '0', '1', '0', '0', '1', '1', '5f01e7e8b32a4c96b7e128cf04e86353', '32bc0907559c43209e11ed58836dcc0a', '1024');
INSERT INTO `article` VALUES ('6', '文章标题varStatus是<c:forEach>jstl循环标签的一个属性，varStatus属性。就拿varStatus=“status”来说，事实上定义了一个status名的对象作为varStatus的绑定值。该绑定值也就是status封装了当前遍历的状态，比如，可以从该对象上查看是遍历到了第几个元素：${status.count}', '网页标题', 'varStatus是<c:forEach>jstl循环标签的一个属性，varStatus属性。就拿varStatus=“status”来说，事实上定义了一个status名的对象作为varStatus的绑定值。该绑定值也就是status封装了当前遍历的状态，比如，可以从该对象上查看是遍历到了第几个元素：${status.count}', null, '/img/article_img_10.jpeg', '1506456238295', '1506456238295', '0', '1', '0', '0', '1', '1', '5f01e7e8b32a4c96b7e128cf04e86353', '5654645', '1024');
INSERT INTO `article` VALUES ('65e163f93692', '文章标题varStatus是<c:forEach>jstl循环标签的一个属性，varStatus属性。就拿varStatus=“status”来说，事实上定义了一个status名的对象作为varStatus的绑定值。该绑定值也就是status封装了当前遍历的状态，比如，可以从该对象上查看是遍历到了第几个元素：${status.count}', '网页标题', 'varStatus是<c:forEach>jstl循环标签的一个属性，varStatus属性。就拿varStatus=“status”来说，事实上定义了一个status名的对象作为varStatus的绑定值。该绑定值也就是status封装了当前遍历的状态，比如，可以从该对象上查看是遍历到了第几个元素：${status.count}', null, '/upload/20170927040017475390773.jpg', '1506456238295', '1506456238295', '0', '1', '0', '0', '1', '1', '5f01e7e8b32a4c96b7e128cf04e86353', 'b7e006644b18443ea5efab65d7e6ca13', '1024');
INSERT INTO `article` VALUES ('65e163f93693', '文章标题varStatus是<c:forEach>jstl循环标签的一个属性，varStatus属性。就拿varStatus=“status”来说，事实上定义了一个status名的对象作为varStatus的绑定值。该绑定值也就是status封装了当前遍历的状态，比如，可以从该对象上查看是遍历到了第几个元素：${status.count}', '网页标题', 'varStatus是<c:forEach>jstl循环标签的一个属性，varStatus属性。就拿varStatus=“status”来说，事实上定义了一个status名的对象作为varStatus的绑定值。该绑定值也就是status封装了当前遍历的状态，比如，可以从该对象上查看是遍历到了第几个元素：${status.count}', null, '/img/article_img_11.jpeg', '1506456238295', '1506456238295', '0', '0', '0', '0', '1', '1', '5f01e7e8b32a4c96b7e128cf04e86353', '0', '1024');
INSERT INTO `article` VALUES ('65e163f93694', '文章标题varStatus是<c:forEach>jstl循环标签的一个属性，varStatus属性。就拿varStatus=“status”来说，事实上定义了一个status名的对象作为varStatus的绑定值。该绑定值也就是status封装了当前遍历的状态，比如，可以从该对象上查看是遍历到了第几个元素：${status.count}', '网页标题', 'varStatus是<c:forEach>jstl循环标签的一个属性，varStatus属性。就拿varStatus=“status”来说，事实上定义了一个status名的对象作为varStatus的绑定值。该绑定值也就是status封装了当前遍历的状态，比如，可以从该对象上查看是遍历到了第几个元素：${status.count}', null, '/img/article_img_12.jpeg', '1506456238295', '1506456238295', '0', '2', '0', '0', '1', '1', '5f01e7e8b32a4c96b7e128cf04e86353', '0', '1024');
INSERT INTO `article` VALUES ('65ee0e212501', '文章标题', '', '## Hello  World.\r\n\r\n> 第一篇文章总得写点儿什么?...\r\n\r\n----------\r\n\r\n\r\n<!--more-->\r\n\r\n```java\r\npublic static void main(String[] args){\r\n    System.out.println(\"Hello World.\");\r\n}\r\n```\r\n不是每个人都天生拿到一副好牌的，也不是每个人选的路都一直正确，但我见过最上进人，他们没拿到好牌，甚至没有天赋，却能一直默默无声地坚持着。\r\n\r\n这期间，有过泪水和欢笑，也有荆棘和碎石，肩上有重担，心里有渴望，他们走的不快，甚至有点慢，但却从没放弃过。\r\n\r\n\r\n后来啊，不知不觉，他们就到了终点。\r\n\r\n你见过最上进的人是怎样的？\r\n\r\n这个最字，很容易让人误解。\r\n\r\n人生是一趟漫长的旅程，我们的精力，时间，注意力都是有限的，所以最开始不要发力过猛，否则经历挫折后容易一蹶不振。\r\n\r\n请记住，坚持到最后才是胜利。\r\n\r\n当你老了，回首一生的成就与坎坷，大家不会看你最开始走的有多快，而是看你最后走的有多远。\r\n\r\n所以真正上进的人，不是那种用力过猛的努力，而是岁月的长河里从不放弃往前走的人。\r\n\r\n《我们这一代的困惑》中写道：\r\n\r\n这些年我一直提醒自己一件事情，千万不要自己感动自己。\r\n\r\n大部分人看似的努力，不过是愚蠢导致的。什么熬夜看书到天亮，连续几天只睡几小时，多久没放假了，如果这些东西也值得夸耀，那么富士康流水线上任何一个人都比你努力多了。\r\n\r\n人难免天生有自怜的情绪，唯有时刻保持清醒，才能看清真正的价值在哪里。\r\n![alt](http://www.hutaotao.cn:8081/SSMDemo2_img/upload/20171001212832838187285.jpg)\r\n2\r\n\r\n我已经来上海差不多一年了。\r\n\r\n一直都在这一家公司，关于最上进的人，我能想到的，大概就是我的老板了，他让我们叫他老师，毕竟是文化企业。\r\n\r\n我第一天来公司的时候，老师拉我去煲鸡汤。\r\n\r\n他说，只要你不亚于任何人的努力，最后一定会有收获。他说斩钉截铁，我却有点不以为然，毕竟是我是一个鸡汤作者，所有的套路我都懂。\r\n\r\n但真正了解我们老板之后，心情就有些不一样了。\r\n\r\n我们公司的公众号是上海文化类排名第一，但老板大学读的是计算机专业，毕业之后一直在做金融，创业失败后，去大学做讲师。\r\n\r\n他一个工科专业，也不曾去过传统出版业，甚至和文化都沾不上边，更谈不上人脉资源推广了。\r\n\r\n他从12年7月开始做公众号，白天教书，晚上编文章，排版，要授权。就这样，一个人，一个号，365天没有一天断更，他一个人，一个号，粉丝做到了一百万。\r\n\r\n那之后才找了几个兼职，到如今，公司已经有快二十个人了。\r\n\r\n当初我们甚至没有自己的办公室，在小区的居民楼里上班，还要自己背笔记本，我妈一开始还以为我被骗进传销组织里了。\r\n\r\n现在我们已经有了自己的办公楼（ps 不是租的，公司买的，想想上海的房价哦）\r\n\r\n我们老师平常办公就和我们坐在一起，他似乎刷手机很少，去找他的时候他就在哪看书，看书名都是很有文化底蕴的那种。\r\n\r\n他每周都会在我们的平台上讲一节免费微课，全年无间断。\r\n\r\n他会想很多创意，有些成功，能赚钱盈利，他会鼓励大家继续努力。\r\n\r\n有些失败，没有一点起色，但不见他沮丧，失望，过段时间又有新的想法，仿佛从未受过打击一样兴致勃勃，一腔孤勇往前冲。\r\n\r\n\r\n3\r\n\r\n国庆放假期间，我因为有份资料忘带了，就回了趟公司。\r\n\r\n居然看到老师他一个人，没开灯，坐在空荡荡的办公室里加班。\r\n\r\n一问才知道，国庆八天，他有六天都会来公司，因为在公司效率高，不会被打断\r\n\r\n不是一整天没日没夜的那种，是吃完午饭，开车来公司，然后或工作，或看书，到晚饭时间就回家。\r\n\r\n每次双休，我们放假两天，他只放一天。\r\n\r\n我一脸惊讶的时候，他只是笑笑说，也没什么事要做，过来看看书也是好的。\r\n\r\n缓慢，坚定，平和，经过岁月长河检验过的努力，才是真的努力。\r\n\r\n\r\n不是急于求成，也不是踟蹰不前，只是朝着一个方向，慢慢地往前走着。世上没有白走的路，每走一步都算数。\r\n\r\n当然了，有人会说，我如果和你们老板一样有钱我也努力。\r\n\r\n但我老板并没有拿到一手好牌，没有什么资源，也不是富二代，背景普通，天赋平庸，他凭借的只是那种不亚于任何人的努力罢了。\r\n\r\n得知他过去，才发现他以前更牛逼。\r\n\r\n老师他大学毕业后，拿到的是国家铁饭碗，却辞职不干，迈入了证券行业。\r\n\r\n然后创业做互联网金融，带了几个小伙伴，拿到了五百万美金的风投，在陆家嘴最繁华的地带租了一整层做办公室。\r\n\r\n尽管后来遭遇互联网泡沫，公司倒闭了，人员遣散了，可他也没有一蹶不振。\r\n\r\n日子啊，总要过下去。\r\n\r\n这不，现在就有了我们公司吗？\r\n\r\n没有人能永远不失败，牛逼的人只是爬起来继续走罢了。\r\n![alt](http://www.hutaotao.cn:8081/SSMDemo2_img/upload/20171002191425143248644.jpg)\r\n4\r\n\r\n我讲了很多关于我们老师的细节，到底想说什么呢？\r\n\r\n无非是真正上进的人，最后一定能成功，因为他们一直保持着向上走的姿态，没有人天生优秀，但你可以让自己变优秀。\r\n\r\n我们和老师聊天的时候，他甚至会打趣地说，自己比较笨，看书比较慢。\r\n\r\n龟兔赛跑这样浅显的道理我不想再讲。\r\n\r\n但就算你最后还是没能赢得那场比赛，就算有些人一出生就在终点线上，就算你拼尽了全力只不过换来一个普通的一生，那又怎么样呢？\r\n\r\n岂能尽如人意，但求无愧于心。\r\n\r\n忘了说，我们老师都快60了，但他还是往前走。\r\n\r\n所以你害怕什么呢，一开始慢点没关系，但你别停在那啊。\r\n', null, '', '1507564865070', '1507564865070', '0', '1', '0', '0', '0', '0', '5f01e7e8b32a4c96b7e128cf04e86353', '0', '1024');
INSERT INTO `article` VALUES ('7', '文章标题varStatus是<c:forEach>jstl循环标签的一个属性，varStatus属性。就拿varStatus=“status”来说，事实上定义了一个status名的对象作为varStatus的绑定值。该绑定值也就是status封装了当前遍历的状态，比如，可以从该对象上查看是遍历到了第几个元素：${status.count}', '网页标题', 'varStatus是<c:forEach>jstl循环标签的一个属性，varStatus属性。就拿varStatus=“status”来说，事实上定义了一个status名的对象作为varStatus的绑定值。该绑定值也就是status封装了当前遍历的状态，比如，可以从该对象上查看是遍历到了第几个元素：${status.count}', null, '/img/article_img_13.jpeg', '1506456238295', '1506456238295', '0', '1', '0', '0', '1', '1', '5f01e7e8b32a4c96b7e128cf04e86353', '0', '1024');
INSERT INTO `article` VALUES ('78848', '文章标题varStatus是<c:forEach>jstl循环标签的一个属性，varStatus属性。就拿varStatus=“status”来说，事实上定义了一个status名的对象作为varStatus的绑定值。该绑定值也就是status封装了当前遍历的状态，比如，可以从该对象上查看是遍历到了第几个元素：${status.count}', '网页标题', 'varStatus是<c:forEach>jstl循环标签的一个属性，varStatus属性。就拿varStatus=“status”来说，事实上定义了一个status名的对象作为varStatus的绑定值。该绑定值也就是status封装了当前遍历的状态，比如，可以从该对象上查看是遍历到了第几个元素：${status.count}', null, '/img/article_img_14.jpeg', '1506456238295', '1506456238295', '0', '1', '0', '0', '1', '1', '5f01e7e8b32a4c96b7e128cf04e86353', '0', '1024');
INSERT INTO `article` VALUES ('8', '文章标题varStatus是<c:forEach>jstl循环标签的一个属性，varStatus属性。就拿varStatus=“status”来说，事实上定义了一个status名的对象作为varStatus的绑定值。该绑定值也就是status封装了当前遍历的状态，比如，可以从该对象上查看是遍历到了第几个元素：${status.count}', '网页标题', 'varStatus是<c:forEach>jstl循环标签的一个属性，varStatus属性。就拿varStatus=“status”来说，事实上定义了一个status名的对象作为varStatus的绑定值。该绑定值也就是status封装了当前遍历的状态，比如，可以从该对象上查看是遍历到了第几个元素：${status.count}', null, '/img/article_img_15.jpeg', '1506456238295', '1506456238295', '0', '1', '0', '0', '1', '1', '5f01e7e8b32a4c96b7e128cf04e86353', '0', '1024');
INSERT INTO `article` VALUES ('858', '文章标题varStatus是<c:forEach>jstl循环标签的一个属性，varStatus属性。就拿varStatus=“status”来说，事实上定义了一个status名的对象作为varStatus的绑定值。该绑定值也就是status封装了当前遍历的状态，比如，可以从该对象上查看是遍历到了第几个元素：${status.count}', '网页标题', 'varStatus是<c:forEach>jstl循环标签的一个属性，varStatus属性。就拿varStatus=“status”来说，事实上定义了一个status名的对象作为varStatus的绑定值。该绑定值也就是status封装了当前遍历的状态，比如，可以从该对象上查看是遍历到了第几个元素：${status.count}', null, '/img/article_img_16.jpeg', '1506456238295', '1506456238295', '0', '1', '0', '0', '1', '1', '5f01e7e8b32a4c96b7e128cf04e86353', '0', '1024');
INSERT INTO `article` VALUES ('9', '文章标题varStatus是<c:forEach>jstl循环标签的一个属性，varStatus属性。就拿varStatus=“status”来说，事实上定义了一个status名的对象作为varStatus的绑定值。该绑定值也就是status封装了当前遍历的状态，比如，可以从该对象上查看是遍历到了第几个元素：${status.count}', '网页标题', 'varStatus是<c:forEach>jstl循环标签的一个属性，varStatus属性。就拿varStatus=“status”来说，事实上定义了一个status名的对象作为varStatus的绑定值。该绑定值也就是status封装了当前遍历的状态，比如，可以从该对象上查看是遍历到了第几个元素：${status.count}', null, '/img/article_img_17.jpeg', '1506456238295', '1506456238295', '0', '1', '0', '0', '1', '1', '5f01e7e8b32a4c96b7e128cf04e86353', '0', '1024');

-- ----------------------------
-- Table structure for article_tag_tbl
-- ----------------------------
DROP TABLE IF EXISTS `article_tag_tbl`;
CREATE TABLE `article_tag_tbl` (
  `id` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `aid` varchar(12) COLLATE utf8_unicode_ci NOT NULL,
  `tagId` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `tag_FK` (`tagId`),
  KEY `article_FK` (`aid`),
  CONSTRAINT `article_FK` FOREIGN KEY (`aid`) REFERENCES `article` (`aid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `tag_FK` FOREIGN KEY (`tagId`) REFERENCES `tag` (`tagId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of article_tag_tbl
-- ----------------------------
INSERT INTO `article_tag_tbl` VALUES ('1', '10', 'f950c8cdbb6b4647836d17b91f5a9ea5');
INSERT INTO `article_tag_tbl` VALUES ('7a4bd08de2cf4942bccd1764ea6afa1b', '65e163f93692', 'f950c8cdbb6b4647836d17b91f5a9ea5');
INSERT INTO `article_tag_tbl` VALUES ('c0fc805d484d4a77a35e0e32ab31daed', '65e163f93692', 'a38e4278fb514877b50ee883960a461b');

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `categoryId` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `categoryName` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `img` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `uid` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `indexes` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`categoryId`),
  KEY `user_category` (`uid`),
  KEY `category_index` (`indexes`) USING BTREE,
  CONSTRAINT `user_category` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES ('0', '默认分类', '/img/icon_7.png', null, '1');
INSERT INTO `category` VALUES ('10', '测试分类4', '/img/icon_1.png', '502864a3f77d4c718d9afa18a2355431', '13');
INSERT INTO `category` VALUES ('32bc0907559c43209e11ed58836dcc0a', '测试分类5', '/img/icon_2.png', '5f01e7e8b32a4c96b7e128cf04e86353', '28');
INSERT INTO `category` VALUES ('42a20b0944014bf9886efa29fdb1161b', '测试分类6', '/img/icon_3.png', '5f01e7e8b32a4c96b7e128cf04e86353', '36');
INSERT INTO `category` VALUES ('5654645', '测试分类1', '/img/icon_4.png', '5f01e7e8b32a4c96b7e128cf04e86353', '2');
INSERT INTO `category` VALUES ('5654646', '测试分类2', '/img/icon_5.png', '5f01e7e8b32a4c96b7e128cf04e86353', '3');
INSERT INTO `category` VALUES ('b7e006644b18443ea5efab65d7e6ca13', '测试分类3', '/img/icon_6.png', '5f01e7e8b32a4c96b7e128cf04e86353', '35');

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `id` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `content` varchar(4000) COLLATE utf8_unicode_ci NOT NULL,
  `created` bigint(20) NOT NULL,
  `ip` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `state` int(1) NOT NULL,
  `parent` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `aid` varchar(12) COLLATE utf8_unicode_ci DEFAULT NULL,
  `uid` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `comment_user_FK` (`uid`),
  KEY `comment_article_FK` (`aid`),
  CONSTRAINT `comment_article_FK` FOREIGN KEY (`aid`) REFERENCES `article` (`aid`),
  CONSTRAINT `comment_user_FK` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES ('1', '评论1', '1506536987282', '1', '1', '0', '10', '502864a3f77d4c718d9afa18a2355431');
INSERT INTO `comment` VALUES ('2', '评论1的评论', '1505906904955', '1', '1', '1', '10', '78faae18e6f84b0bade8743fe8241173');
INSERT INTO `comment` VALUES ('3', '评论2', '1505906904966', '1', '1', '0', '10', '5f01e7e8b32a4c96b7e128cf04e86353');
INSERT INTO `comment` VALUES ('4', '评论1的评论的评论', '1505906904966', '1', '1', '2', '10', '5f01e7e8b32a4c96b7e128cf04e86353');
INSERT INTO `comment` VALUES ('5', '评论1的评论的评论', '1505906904966', '1', '1', '4', '10', '5f01e7e8b32a4c96b7e128cf04e86353');
INSERT INTO `comment` VALUES ('6', '评论3（违规）', '1505906904966', '1', '0', '0', '10', '5f01e7e8b32a4c96b7e128cf04e86353');

-- ----------------------------
-- Table structure for file
-- ----------------------------
DROP TABLE IF EXISTS `file`;
CREATE TABLE `file` (
  `id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `file_url` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `real_name` varchar(80) COLLATE utf8_unicode_ci NOT NULL,
  `file_type` int(1) NOT NULL,
  `uid` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `created` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `file_user_FK` (`uid`),
  CONSTRAINT `file_user_FK` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of file
-- ----------------------------
INSERT INTO `file` VALUES ('0989ddafc89d4cc1b488a206c1a580c4', '/upload/20171001211611246294109.png', '内存与主存.png', '1', '5f01e7e8b32a4c96b7e128cf04e86353', '1506863771541');
INSERT INTO `file` VALUES ('12', '/upload/20170927040017475390773.jpg', 'avatar.jpg', '3', '5f01e7e8b32a4c96b7e128cf04e86353', '1506456018455');
INSERT INTO `file` VALUES ('13', '/upload/20170927040017475390773.jpg', 'avatar.jpg', '4', '5f01e7e8b32a4c96b7e128cf04e86353', '1506456018455');
INSERT INTO `file` VALUES ('139e7b44ec8e48e0978d5f5e02ec018c', '/upload/20171003011138893173314.pdf', '01_项目环境搭建.pdf', '0', '5f01e7e8b32a4c96b7e128cf04e86353', '1506964300514');
INSERT INTO `file` VALUES ('13c99027268c408ea5de3f975e4ecc4f', '/upload/20171001205334093327032.txt', 'html1.txt', '2', '5f01e7e8b32a4c96b7e128cf04e86353', '1506862416870');
INSERT INTO `file` VALUES ('14', '/upload/20170927040017475390773.jpg', 'avatar.jpg', '5', '5f01e7e8b32a4c96b7e128cf04e86353', '1506456018455');
INSERT INTO `file` VALUES ('148d614c1a1a4155996349126034d6f6', '/upload/20171001205818167272052.png', '11.png', '1', '5f01e7e8b32a4c96b7e128cf04e86353', '1506862698457');
INSERT INTO `file` VALUES ('15', '/upload/20170927040017475390773.jpg', 'avatar.jpg', '0', '5f01e7e8b32a4c96b7e128cf04e86353', '1506456018455');
INSERT INTO `file` VALUES ('16', '/upload/20170927040017475390773.jpg', 'avatar.jpg', '1', '5f01e7e8b32a4c96b7e128cf04e86353', '1506456018455');
INSERT INTO `file` VALUES ('17', '/upload/20170927040017475390773.jpg', 'avatar.jpg', '2', '5f01e7e8b32a4c96b7e128cf04e86353', '1506456018455');
INSERT INTO `file` VALUES ('18', '/upload/20170927040017475390773.jpg', 'avatar.jpg', '2', '5f01e7e8b32a4c96b7e128cf04e86353', '1506456018455');
INSERT INTO `file` VALUES ('2', '/upload/20170927040017475390773.jpg', 'avatar.jpg', '3', '5f01e7e8b32a4c96b7e128cf04e86353', '1506456018455');
INSERT INTO `file` VALUES ('24521bd8efdc4d9e8111cbba1b53feb2', '/upload/20171001205150055289035.doc', '1.doc', '2', '5f01e7e8b32a4c96b7e128cf04e86353', '1506862312334');
INSERT INTO `file` VALUES ('3', '/upload/20170927040017475390773.jpg', 'avatar.jpg', '4', '5f01e7e8b32a4c96b7e128cf04e86353', '1506456018455');
INSERT INTO `file` VALUES ('4', '/upload/20170927040017475390773.jpg', 'avatar.jpg', '5', '5f01e7e8b32a4c96b7e128cf04e86353', '1506456018455');
INSERT INTO `file` VALUES ('5', '/upload/20170927040017475390773.jpg', 'avatar.jpg', '0', '5f01e7e8b32a4c96b7e128cf04e86353', '1506456018455');
INSERT INTO `file` VALUES ('50c415bef1124d8e9c4c06a074728a00', '/upload/20171001211205416316185.chm', 'j2EE6.0.chm', '0', '5f01e7e8b32a4c96b7e128cf04e86353', '1506863527081');
INSERT INTO `file` VALUES ('55147123bbf14c3987cb5793edd1cf27', '/upload/20171001205506729988192.zip', 'PAInstall.zip', '0', '5f01e7e8b32a4c96b7e128cf04e86353', '1506862508680');
INSERT INTO `file` VALUES ('5808187a3dae46b9bfd1b25e69082016', '/upload/20171001203414306683814.png', '鲸鱼.png', '1', '5f01e7e8b32a4c96b7e128cf04e86353', '1506861257714');
INSERT INTO `file` VALUES ('6fcdbbd064534ba2a52f04650985b713', '/upload/20171001212915865591033.png', 'v2-6e85ed5876356e196f95c427db5f85ad_r.png', '1', '5f01e7e8b32a4c96b7e128cf04e86353', '1506864557338');
INSERT INTO `file` VALUES ('7', '/upload/20170927040017475390773.jpg', 'avatar.jpg', '2', '5f01e7e8b32a4c96b7e128cf04e86353', '1506456018455');
INSERT INTO `file` VALUES ('7275044eb24948e3aee9e0c4719a565c', '/upload/20171001211227955768323.png', 'diagram_2.png', '1', '5f01e7e8b32a4c96b7e128cf04e86353', '1506863548337');
INSERT INTO `file` VALUES ('727dbc775a7b429d8e7e2e7d08000c65', '/upload/20171002190807542963392.jpg', '1110099o6uqqx5ozdh5xid.jpg', '1', '5f01e7e8b32a4c96b7e128cf04e86353', '1506942488941');
INSERT INTO `file` VALUES ('8', '/upload/20170927040017475390773.jpg', 'avatar.jpg', '2', '5f01e7e8b32a4c96b7e128cf04e86353', '1506456018455');
INSERT INTO `file` VALUES ('9', '/upload/20170927040017475390773.jpg', 'avatar.jpg', '2', '5f01e7e8b32a4c96b7e128cf04e86353', '1506456018455');
INSERT INTO `file` VALUES ('9567f039a1d54bb9a0535a9257bbf5d9', '/upload/20171001212832838187285.jpg', 'f56513788384645db768d0ec542dec33_r.jpg', '1', '5f01e7e8b32a4c96b7e128cf04e86353', '1506864513214');
INSERT INTO `file` VALUES ('aa50a617d28a4d8bbc1872bea91f8921', '/upload/20171001205335437591800.java', 'Idea快捷键.java', '0', '5f01e7e8b32a4c96b7e128cf04e86353', '1506862416919');
INSERT INTO `file` VALUES ('b5c25b53248f4f26af6e9f25a654538e', '/upload/20171002191425143248644.jpg', '1110118axoucib8i9xa8ia.jpg', '1', '5f01e7e8b32a4c96b7e128cf04e86353', '1506942865702');
INSERT INTO `file` VALUES ('d3e20172f0eb4484b38c759db6e52b60', '/upload/20171001212750441543622.ico', 'ht1.ico', '1', '5f01e7e8b32a4c96b7e128cf04e86353', '1506864470718');

-- ----------------------------
-- Table structure for logs
-- ----------------------------
DROP TABLE IF EXISTS `logs`;
CREATE TABLE `logs` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `action` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `data` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `uid` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `ip` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `creatrd` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_logs` (`uid`),
  CONSTRAINT `user_logs` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=152 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of logs
-- ----------------------------
INSERT INTO `logs` VALUES ('9', '初始化博客', 'lisi ---> 初始化数据', '502864a3f77d4c718d9afa18a2355431', '127.0.0.1', '1505970482127');
INSERT INTO `logs` VALUES ('10', '登录后台', '{\"username\":\"lisi\",\"remeber_me\":\"off\"}', '502864a3f77d4c718d9afa18a2355431', '127.0.0.1', '1505970483281');
INSERT INTO `logs` VALUES ('11', '初始化博客', 'zs ---> 初始化数据', '78faae18e6f84b0bade8743fe8241173', '127.0.0.1', '1505975470059');
INSERT INTO `logs` VALUES ('12', '登录后台', '{\"username\":\"zs\",\"remeber_me\":\"off\"}', '78faae18e6f84b0bade8743fe8241173', '127.0.0.1', '1505975470515');
INSERT INTO `logs` VALUES ('13', '登录后台', '{\"username\":\"zs\",\"remeber_me\":\"off\"}', '78faae18e6f84b0bade8743fe8241173', '127.0.0.1', '1505975934222');
INSERT INTO `logs` VALUES ('14', '初始化博客', 'hutao ---> 初始化数据', '5f01e7e8b32a4c96b7e128cf04e86353', '127.0.0.1', '1505979163123');
INSERT INTO `logs` VALUES ('37', '登录后台', '{\"username\":\"hutao\",\"remeber_me\":\"off\"}', '5f01e7e8b32a4c96b7e128cf04e86353', '127.0.0.1', '1506388445344');
INSERT INTO `logs` VALUES ('38', '登录后台', '{\"username\":\"hutao\",\"remeber_me\":\"off\"}', '5f01e7e8b32a4c96b7e128cf04e86353', '127.0.0.1', '1506431261510');
INSERT INTO `logs` VALUES ('39', '登录后台', '{\"username\":\"hutao\",\"remeber_me\":\"off\"}', '5f01e7e8b32a4c96b7e128cf04e86353', '127.0.0.1', '1506446596786');
INSERT INTO `logs` VALUES ('40', '登录后台', '{\"username\":\"hutao\",\"remeber_me\":\"off\"}', '5f01e7e8b32a4c96b7e128cf04e86353', '127.0.0.1', '1506452254080');
INSERT INTO `logs` VALUES ('41', '登录后台', '{\"username\":\"hutao\",\"remeber_me\":\"off\"}', '5f01e7e8b32a4c96b7e128cf04e86353', '127.0.0.1', '1506454444225');
INSERT INTO `logs` VALUES ('42', '登录后台', '{\"username\":\"hutao\",\"remeber_me\":\"off\"}', '5f01e7e8b32a4c96b7e128cf04e86353', '127.0.0.1', '1506455985121');
INSERT INTO `logs` VALUES ('43', '发表文章', 'hutao ---> 发布新文章:文章标题', '5f01e7e8b32a4c96b7e128cf04e86353', '127.0.0.1', '1506456244205');
INSERT INTO `logs` VALUES ('44', '登录后台', '{\"username\":\"hutao\",\"remeber_me\":\"off\"}', '5f01e7e8b32a4c96b7e128cf04e86353', '127.0.0.1', '1506461511637');
INSERT INTO `logs` VALUES ('45', '登录后台', '{\"username\":\"hutao\",\"remeber_me\":\"off\"}', '5f01e7e8b32a4c96b7e128cf04e86353', '127.0.0.1', '1506461821541');
INSERT INTO `logs` VALUES ('46', '登录后台', '{\"username\":\"hutao\",\"remeber_me\":\"off\"}', '5f01e7e8b32a4c96b7e128cf04e86353', '127.0.0.1', '1506462841953');
INSERT INTO `logs` VALUES ('47', '登录后台', '{\"username\":\"hutao\",\"remeber_me\":\"off\"}', '5f01e7e8b32a4c96b7e128cf04e86353', '127.0.0.1', '1506498502025');
INSERT INTO `logs` VALUES ('48', '登录后台', '{\"username\":\"hutao\",\"remeber_me\":\"off\"}', '5f01e7e8b32a4c96b7e128cf04e86353', '127.0.0.1', '1506501577754');
INSERT INTO `logs` VALUES ('49', '登录后台', '{\"username\":\"hutao\",\"remeber_me\":\"off\"}', '5f01e7e8b32a4c96b7e128cf04e86353', '127.0.0.1', '1506508447805');
INSERT INTO `logs` VALUES ('50', '登录后台', '{\"username\":\"zs\",\"remeber_me\":\"off\"}', '78faae18e6f84b0bade8743fe8241173', '127.0.0.1', '1506510302769');
INSERT INTO `logs` VALUES ('51', '登录后台', '{\"username\":\"hutao\",\"remeber_me\":\"off\"}', '5f01e7e8b32a4c96b7e128cf04e86353', '127.0.0.1', '1506511309696');
INSERT INTO `logs` VALUES ('52', '登录后台', '{\"username\":\"zs\",\"remeber_me\":\"off\"}', '78faae18e6f84b0bade8743fe8241173', '127.0.0.1', '1506511370781');
INSERT INTO `logs` VALUES ('53', '登录后台', '{\"username\":\"lisi\",\"remeber_me\":\"off\"}', '502864a3f77d4c718d9afa18a2355431', '127.0.0.1', '1506511459561');
INSERT INTO `logs` VALUES ('54', '登录后台', '{\"username\":\"hutao\",\"remeber_me\":\"off\"}', '5f01e7e8b32a4c96b7e128cf04e86353', '127.0.0.1', '1506520544498');
INSERT INTO `logs` VALUES ('55', '登录后台', '{\"username\":\"hutao\",\"remeber_me\":\"off\"}', '5f01e7e8b32a4c96b7e128cf04e86353', '127.0.0.1', '1506523432949');
INSERT INTO `logs` VALUES ('56', '登录后台', '{\"username\":\"lisi\",\"remeber_me\":\"off\"}', '502864a3f77d4c718d9afa18a2355431', '127.0.0.1', '1506523463445');
INSERT INTO `logs` VALUES ('57', '登录后台', '{\"username\":\"lisi\",\"remeber_me\":\"off\"}', '502864a3f77d4c718d9afa18a2355431', '127.0.0.1', '1506524005566');
INSERT INTO `logs` VALUES ('58', '登录后台', '{\"username\":\"hutao\",\"remeber_me\":\"off\"}', '5f01e7e8b32a4c96b7e128cf04e86353', '127.0.0.1', '1506524271367');
INSERT INTO `logs` VALUES ('59', '登录后台', '{\"username\":\"hutao\",\"remeber_me\":\"off\"}', '5f01e7e8b32a4c96b7e128cf04e86353', '127.0.0.1', '1506525877165');
INSERT INTO `logs` VALUES ('60', '登录后台', '{\"username\":\"hutao\",\"remeber_me\":\"off\"}', '5f01e7e8b32a4c96b7e128cf04e86353', '127.0.0.1', '1506526479538');
INSERT INTO `logs` VALUES ('61', '登录后台', '{\"username\":\"hutao\",\"remeber_me\":\"off\"}', '5f01e7e8b32a4c96b7e128cf04e86353', '127.0.0.1', '1506526867264');
INSERT INTO `logs` VALUES ('62', '登录后台', '{\"username\":\"hutao\",\"remeber_me\":\"off\"}', '5f01e7e8b32a4c96b7e128cf04e86353', '127.0.0.1', '1506527169829');
INSERT INTO `logs` VALUES ('63', '登录后台', '{\"username\":\"hutao\",\"remeber_me\":\"off\"}', '5f01e7e8b32a4c96b7e128cf04e86353', '127.0.0.1', '1506527879595');
INSERT INTO `logs` VALUES ('64', '登录后台', '{\"username\":\"hutao\",\"remeber_me\":\"off\"}', '5f01e7e8b32a4c96b7e128cf04e86353', '127.0.0.1', '1506528856770');
INSERT INTO `logs` VALUES ('65', '登录后台', '{\"username\":\"hutao\",\"remeber_me\":\"off\"}', '5f01e7e8b32a4c96b7e128cf04e86353', '127.0.0.1', '1506530665564');
INSERT INTO `logs` VALUES ('66', '登录后台', '{\"username\":\"hutao\",\"remeber_me\":\"off\"}', '5f01e7e8b32a4c96b7e128cf04e86353', '127.0.0.1', '1506532347556');
INSERT INTO `logs` VALUES ('67', '登录后台', '{\"username\":\"hutao\",\"remeber_me\":\"off\"}', '5f01e7e8b32a4c96b7e128cf04e86353', '127.0.0.1', '1506541088867');
INSERT INTO `logs` VALUES ('68', '登录后台', '{\"username\":\"hutao\",\"remeber_me\":\"off\"}', '5f01e7e8b32a4c96b7e128cf04e86353', '192.168.1.7', '1506546921397');
INSERT INTO `logs` VALUES ('69', '登录后台', '{\"username\":\"lisi\",\"remeber_me\":\"off\"}', '502864a3f77d4c718d9afa18a2355431', '192.168.1.7', '1506558432845');
INSERT INTO `logs` VALUES ('70', '登录后台', '{\"username\":\"hutao\",\"remeber_me\":\"off\"}', '5f01e7e8b32a4c96b7e128cf04e86353', '127.0.0.1', '1506585871686');
INSERT INTO `logs` VALUES ('71', '登录后台', '{\"username\":\"hutao\",\"remeber_me\":\"off\"}', '5f01e7e8b32a4c96b7e128cf04e86353', '127.0.0.1', '1506596080326');
INSERT INTO `logs` VALUES ('72', '登录后台', '{\"username\":\"hutao\",\"remeber_me\":\"off\"}', '5f01e7e8b32a4c96b7e128cf04e86353', '127.0.0.1', '1506596196046');
INSERT INTO `logs` VALUES ('73', '登录后台', '{\"username\":\"hutao\",\"remeber_me\":\"off\"}', '5f01e7e8b32a4c96b7e128cf04e86353', '127.0.0.1', '1506608790059');
INSERT INTO `logs` VALUES ('74', '登录后台', '{\"username\":\"hutao\",\"remeber_me\":\"off\"}', '5f01e7e8b32a4c96b7e128cf04e86353', '127.0.0.1', '1506616917104');
INSERT INTO `logs` VALUES ('75', '登录后台', '{\"username\":\"hutao\",\"remeber_me\":\"off\"}', '5f01e7e8b32a4c96b7e128cf04e86353', '127.0.0.1', '1506623783816');
INSERT INTO `logs` VALUES ('76', '登录后台', '{\"username\":\"hutao\",\"remeber_me\":\"off\"}', '5f01e7e8b32a4c96b7e128cf04e86353', '127.0.0.1', '1506631260111');
INSERT INTO `logs` VALUES ('77', '登录后台', '{\"username\":\"hutao\",\"remeber_me\":\"off\"}', '5f01e7e8b32a4c96b7e128cf04e86353', '127.0.0.1', '1506631344295');
INSERT INTO `logs` VALUES ('78', '登录后台', '{\"username\":\"hutao\",\"remeber_me\":\"off\"}', '5f01e7e8b32a4c96b7e128cf04e86353', '127.0.0.1', '1506676058061');
INSERT INTO `logs` VALUES ('79', '登录后台', '{\"username\":\"hutao\",\"remeber_me\":\"off\"}', '5f01e7e8b32a4c96b7e128cf04e86353', '127.0.0.1', '1506680524222');
INSERT INTO `logs` VALUES ('80', '登录后台', '{\"username\":\"hutao\",\"remeber_me\":\"off\"}', '5f01e7e8b32a4c96b7e128cf04e86353', '127.0.0.1', '1506689372958');
INSERT INTO `logs` VALUES ('81', '登录后台', '{\"username\":\"lisi\",\"remeber_me\":\"off\"}', '502864a3f77d4c718d9afa18a2355431', '127.0.0.1', '1506693369724');
INSERT INTO `logs` VALUES ('82', '登录后台', '{\"username\":\"hutao\",\"remeber_me\":\"off\"}', '5f01e7e8b32a4c96b7e128cf04e86353', '127.0.0.1', '1506694226860');
INSERT INTO `logs` VALUES ('83', '登录后台', '{\"username\":\"hutao\",\"remeber_me\":\"off\"}', '5f01e7e8b32a4c96b7e128cf04e86353', '127.0.0.1', '1506694237342');
INSERT INTO `logs` VALUES ('84', '登录后台', '{\"username\":\"lisi\",\"remeber_me\":\"off\"}', '502864a3f77d4c718d9afa18a2355431', '127.0.0.1', '1506694843939');
INSERT INTO `logs` VALUES ('85', '登录后台', '{\"username\":\"zs\",\"remeber_me\":\"off\"}', '78faae18e6f84b0bade8743fe8241173', '127.0.0.1', '1506694917151');
INSERT INTO `logs` VALUES ('86', '登录后台', '{\"username\":\"lisi\",\"remeber_me\":\"off\"}', '502864a3f77d4c718d9afa18a2355431', '127.0.0.1', '1506694960115');
INSERT INTO `logs` VALUES ('87', '登录后台', '{\"username\":\"hutao\",\"remeber_me\":\"off\"}', '5f01e7e8b32a4c96b7e128cf04e86353', '127.0.0.1', '1506694970616');
INSERT INTO `logs` VALUES ('88', '登录后台', '{\"username\":\"hutao\",\"remeber_me\":\"off\"}', '5f01e7e8b32a4c96b7e128cf04e86353', '127.0.0.1', '1506696931260');
INSERT INTO `logs` VALUES ('89', '登录后台', '{\"username\":\"hutao\",\"remeber_me\":\"off\"}', '5f01e7e8b32a4c96b7e128cf04e86353', '127.0.0.1', '1506700298060');
INSERT INTO `logs` VALUES ('90', '登录后台', '{\"username\":\"lisi\",\"remeber_me\":\"off\"}', '502864a3f77d4c718d9afa18a2355431', '127.0.0.1', '1506700313571');
INSERT INTO `logs` VALUES ('91', '登录后台', '{\"username\":\"zs\",\"remeber_me\":\"off\"}', '78faae18e6f84b0bade8743fe8241173', '127.0.0.1', '1506700615925');
INSERT INTO `logs` VALUES ('92', '登录后台', '{\"username\":\"hutao\",\"remeber_me\":\"off\"}', '5f01e7e8b32a4c96b7e128cf04e86353', '127.0.0.1', '1506705356954');
INSERT INTO `logs` VALUES ('93', '登录后台', '{\"username\":\"lisi\",\"remeber_me\":\"off\"}', '502864a3f77d4c718d9afa18a2355431', '127.0.0.1', '1506706164593');
INSERT INTO `logs` VALUES ('94', '登录后台', '{\"username\":\"zs\",\"remeber_me\":\"off\"}', '78faae18e6f84b0bade8743fe8241173', '127.0.0.1', '1506706174298');
INSERT INTO `logs` VALUES ('95', '登录后台', '{\"username\":\"hutao\",\"remeber_me\":\"off\"}', '5f01e7e8b32a4c96b7e128cf04e86353', '127.0.0.1', '1506706181729');
INSERT INTO `logs` VALUES ('96', '登录后台', '{\"username\":\"hutao\",\"remeber_me\":\"off\"}', '5f01e7e8b32a4c96b7e128cf04e86353', '127.0.0.1', '1506709756903');
INSERT INTO `logs` VALUES ('97', '登录后台', '{\"username\":\"hutao\",\"remeber_me\":\"off\"}', '5f01e7e8b32a4c96b7e128cf04e86353', '127.0.0.1', '1506711766895');
INSERT INTO `logs` VALUES ('98', '登录后台', '{\"username\":\"hutao\",\"remeber_me\":\"off\"}', '5f01e7e8b32a4c96b7e128cf04e86353', '127.0.0.1', '1506712147492');
INSERT INTO `logs` VALUES ('99', '登录后台', '{\"username\":\"hutao\",\"remeber_me\":\"off\"}', '5f01e7e8b32a4c96b7e128cf04e86353', '127.0.0.1', '1506712281648');
INSERT INTO `logs` VALUES ('100', '登录后台', '{\"username\":\"hutao\",\"remeber_me\":\"off\"}', '5f01e7e8b32a4c96b7e128cf04e86353', '127.0.0.1', '1506723432859');
INSERT INTO `logs` VALUES ('101', '登录后台', '{\"username\":\"hutao\",\"remeber_me\":\"off\"}', '5f01e7e8b32a4c96b7e128cf04e86353', '127.0.0.1', '1506733875595');
INSERT INTO `logs` VALUES ('102', '登录后台', '{\"username\":\"hutao\",\"remeber_me\":\"off\"}', '5f01e7e8b32a4c96b7e128cf04e86353', '127.0.0.1', '1506771417358');
INSERT INTO `logs` VALUES ('103', '登录后台', '{\"username\":\"hutao\",\"remeber_me\":\"off\"}', '5f01e7e8b32a4c96b7e128cf04e86353', '127.0.0.1', '1506781327840');
INSERT INTO `logs` VALUES ('104', '登录后台', '{\"username\":\"hutao\",\"remeber_me\":\"off\"}', '5f01e7e8b32a4c96b7e128cf04e86353', '127.0.0.1', '1506788921919');
INSERT INTO `logs` VALUES ('105', '登录后台', '{\"username\":\"hutao\",\"remeber_me\":\"off\"}', '5f01e7e8b32a4c96b7e128cf04e86353', '127.0.0.1', '1506801630969');
INSERT INTO `logs` VALUES ('106', '登录后台', '{\"username\":\"hutao\",\"remeber_me\":\"off\"}', '5f01e7e8b32a4c96b7e128cf04e86353', '127.0.0.1', '1506859889896');
INSERT INTO `logs` VALUES ('107', '登录后台', '{\"username\":\"hutao\",\"remeber_me\":\"off\"}', '5f01e7e8b32a4c96b7e128cf04e86353', '127.0.0.1', '1506861178230');
INSERT INTO `logs` VALUES ('108', '登录后台', '{\"username\":\"hutao\",\"remeber_me\":\"off\"}', '5f01e7e8b32a4c96b7e128cf04e86353', '127.0.0.1', '1506862262411');
INSERT INTO `logs` VALUES ('109', '登录后台', '{\"username\":\"hutao\",\"remeber_me\":\"off\"}', '5f01e7e8b32a4c96b7e128cf04e86353', '127.0.0.1', '1506936247888');
INSERT INTO `logs` VALUES ('110', '登录后台', '{\"username\":\"hutao\",\"remeber_me\":\"off\"}', '5f01e7e8b32a4c96b7e128cf04e86353', '127.0.0.1', '1506940404615');
INSERT INTO `logs` VALUES ('111', '登录后台', '{\"username\":\"hutao\",\"remeber_me\":\"off\"}', '5f01e7e8b32a4c96b7e128cf04e86353', '127.0.0.1', '1506942476382');
INSERT INTO `logs` VALUES ('112', '登录后台', '{\"username\":\"hutao\",\"remeber_me\":\"off\"}', '5f01e7e8b32a4c96b7e128cf04e86353', '127.0.0.1', '1506945446263');
INSERT INTO `logs` VALUES ('113', '登录后台', '{\"username\":\"hutao\",\"remeber_me\":\"off\"}', '5f01e7e8b32a4c96b7e128cf04e86353', '127.0.0.1', '1506948962342');
INSERT INTO `logs` VALUES ('114', '登录后台', '{\"username\":\"hutao\",\"remeber_me\":\"off\"}', '5f01e7e8b32a4c96b7e128cf04e86353', '127.0.0.1', '1506949122473');
INSERT INTO `logs` VALUES ('115', '登录后台', '{\"username\":\"hutao\",\"remeber_me\":\"off\"}', '5f01e7e8b32a4c96b7e128cf04e86353', '127.0.0.1', '1506952057841');
INSERT INTO `logs` VALUES ('116', '登录后台', '{\"username\":\"hutao\",\"remeber_me\":\"off\"}', '5f01e7e8b32a4c96b7e128cf04e86353', '127.0.0.1', '1506962117312');
INSERT INTO `logs` VALUES ('117', '登录后台', '{\"username\":\"hutao\",\"remeber_me\":\"off\"}', '5f01e7e8b32a4c96b7e128cf04e86353', '192.168.1.5', '1506963871526');
INSERT INTO `logs` VALUES ('118', '登录后台', '{\"username\":\"hutao\",\"remeber_me\":\"off\"}', '5f01e7e8b32a4c96b7e128cf04e86353', '192.168.1.7', '1506963942681');
INSERT INTO `logs` VALUES ('119', '登录后台', '{\"username\":\"lisi\",\"remeber_me\":\"off\"}', '502864a3f77d4c718d9afa18a2355431', '192.168.1.7', '1506964928584');
INSERT INTO `logs` VALUES ('120', '登录后台', '{\"username\":\"hutao\",\"remeber_me\":\"off\"}', '5f01e7e8b32a4c96b7e128cf04e86353', '192.168.1.7', '1506965019038');
INSERT INTO `logs` VALUES ('121', '登录后台', '{\"username\":\"hutao\",\"remeber_me\":\"off\"}', '5f01e7e8b32a4c96b7e128cf04e86353', '192.168.1.5', '1506973690016');
INSERT INTO `logs` VALUES ('122', '登录后台', '{\"username\":\"hutao\",\"remeber_me\":\"off\"}', '5f01e7e8b32a4c96b7e128cf04e86353', '127.0.0.1', '1507114201248');
INSERT INTO `logs` VALUES ('123', '登录后台', '{\"username\":\"hutao\",\"remeber_me\":\"off\"}', '5f01e7e8b32a4c96b7e128cf04e86353', '127.0.0.1', '1507164874663');
INSERT INTO `logs` VALUES ('124', '登录后台', '{\"username\":\"hutao\",\"remeber_me\":\"off\"}', '5f01e7e8b32a4c96b7e128cf04e86353', '127.0.0.1', '1507249665120');
INSERT INTO `logs` VALUES ('125', '登录后台', '{\"username\":\"hutao\",\"remeber_me\":\"off\"}', '5f01e7e8b32a4c96b7e128cf04e86353', '127.0.0.1', '1507252078850');
INSERT INTO `logs` VALUES ('126', '登录后台', '{\"username\":\"hutao\",\"remeber_me\":\"off\"}', '5f01e7e8b32a4c96b7e128cf04e86353', '127.0.0.1', '1507297273180');
INSERT INTO `logs` VALUES ('127', '登录后台', '{\"username\":\"hutao\",\"remeber_me\":\"off\"}', '5f01e7e8b32a4c96b7e128cf04e86353', '127.0.0.1', '1507300441641');
INSERT INTO `logs` VALUES ('128', '登录后台', '{\"username\":\"hutao\",\"remeber_me\":\"off\"}', '5f01e7e8b32a4c96b7e128cf04e86353', '127.0.0.1', '1507317046623');
INSERT INTO `logs` VALUES ('129', '登录后台', '{\"username\":\"hutao\",\"remeber_me\":\"off\"}', '5f01e7e8b32a4c96b7e128cf04e86353', '127.0.0.1', '1507323209453');
INSERT INTO `logs` VALUES ('130', '登录后台', '{\"username\":\"hutao\",\"remeber_me\":\"off\"}', '5f01e7e8b32a4c96b7e128cf04e86353', '127.0.0.1', '1507339782147');
INSERT INTO `logs` VALUES ('131', '登录后台', '{\"username\":\"hutao\",\"remeber_me\":\"off\"}', '5f01e7e8b32a4c96b7e128cf04e86353', '127.0.0.1', '1507347231708');
INSERT INTO `logs` VALUES ('132', '登录后台', '{\"username\":\"hutao\",\"remeber_me\":\"off\"}', '5f01e7e8b32a4c96b7e128cf04e86353', '127.0.0.1', '1507509932442');
INSERT INTO `logs` VALUES ('133', '登录后台', '{\"username\":\"hutao\",\"remeber_me\":\"off\"}', '5f01e7e8b32a4c96b7e128cf04e86353', '127.0.0.1', '1507516408578');
INSERT INTO `logs` VALUES ('134', '登录后台', '{\"username\":\"hutao\",\"remeber_me\":\"off\"}', '5f01e7e8b32a4c96b7e128cf04e86353', '127.0.0.1', '1507516898947');
INSERT INTO `logs` VALUES ('135', '登录后台', '{\"username\":\"hutao\",\"remeber_me\":\"off\"}', '5f01e7e8b32a4c96b7e128cf04e86353', '127.0.0.1', '1507521615901');
INSERT INTO `logs` VALUES ('136', '登录后台', '{\"username\":\"hutao\",\"remeber_me\":\"off\"}', '5f01e7e8b32a4c96b7e128cf04e86353', '127.0.0.1', '1507531678516');
INSERT INTO `logs` VALUES ('137', '登录后台', '{\"username\":\"hutao\",\"remeber_me\":\"off\"}', '5f01e7e8b32a4c96b7e128cf04e86353', '127.0.0.1', '1507535052887');
INSERT INTO `logs` VALUES ('138', '登录后台', '{\"username\":\"hutao\",\"remeber_me\":\"off\"}', '5f01e7e8b32a4c96b7e128cf04e86353', '127.0.0.1', '1507537314152');
INSERT INTO `logs` VALUES ('139', '登录后台', '{\"username\":\"hutao\",\"remeber_me\":\"off\"}', '5f01e7e8b32a4c96b7e128cf04e86353', '127.0.0.1', '1507537741194');
INSERT INTO `logs` VALUES ('140', '登录后台', '{\"username\":\"hutao\",\"remeber_me\":\"off\"}', '5f01e7e8b32a4c96b7e128cf04e86353', '127.0.0.1', '1507538307388');
INSERT INTO `logs` VALUES ('141', '登录后台', '{\"username\":\"hutao\",\"remeber_me\":\"off\"}', '5f01e7e8b32a4c96b7e128cf04e86353', '127.0.0.1', '1507538369975');
INSERT INTO `logs` VALUES ('142', '登录后台', '{\"username\":\"hutao\",\"remeber_me\":\"off\"}', '5f01e7e8b32a4c96b7e128cf04e86353', '127.0.0.1', '1507539133904');
INSERT INTO `logs` VALUES ('143', '登录后台', '{\"username\":\"hutao\",\"remeber_me\":\"off\"}', '5f01e7e8b32a4c96b7e128cf04e86353', '127.0.0.1', '1507541951312');
INSERT INTO `logs` VALUES ('144', '登录后台', '{\"username\":\"hutao\",\"remeber_me\":\"off\"}', '5f01e7e8b32a4c96b7e128cf04e86353', '127.0.0.1', '1507555521571');
INSERT INTO `logs` VALUES ('145', '发表文章', 'hutao ---> 发布新文章:文章标题', '5f01e7e8b32a4c96b7e128cf04e86353', '127.0.0.1', '1507564865254');
INSERT INTO `logs` VALUES ('146', '登录后台', '{\"username\":\"hutao\",\"remeber_me\":\"off\"}', '5f01e7e8b32a4c96b7e128cf04e86353', '127.0.0.1', '1507580266692');
INSERT INTO `logs` VALUES ('147', '登录后台', '{\"username\":\"hutao\",\"remeber_me\":\"off\"}', '5f01e7e8b32a4c96b7e128cf04e86353', '127.0.0.1', '1507588738722');
INSERT INTO `logs` VALUES ('148', '登录后台', '{\"username\":\"hutao\",\"remeber_me\":\"off\"}', '5f01e7e8b32a4c96b7e128cf04e86353', '127.0.0.1', '1507594122967');
INSERT INTO `logs` VALUES ('149', '登录后台', '{\"username\":\"lisi\",\"remeber_me\":\"off\"}', '502864a3f77d4c718d9afa18a2355431', '127.0.0.1', '1507599621059');
INSERT INTO `logs` VALUES ('150', '登录后台', '{\"username\":\"hutao\",\"remeber_me\":\"off\"}', '5f01e7e8b32a4c96b7e128cf04e86353', '127.0.0.1', '1507610451941');
INSERT INTO `logs` VALUES ('151', '登录后台', '{\"username\":\"hutao\",\"remeber_me\":\"off\"}', '5f01e7e8b32a4c96b7e128cf04e86353', '127.0.0.1', '1511837333799');

-- ----------------------------
-- Table structure for tag
-- ----------------------------
DROP TABLE IF EXISTS `tag`;
CREATE TABLE `tag` (
  `tagId` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `tagName` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `uid` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `indexes` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`tagId`),
  KEY `user_tag` (`uid`),
  KEY `category_index` (`indexes`) USING BTREE,
  CONSTRAINT `user_tag` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of tag
-- ----------------------------
INSERT INTO `tag` VALUES ('1', '测试', '5f01e7e8b32a4c96b7e128cf04e86353', '2');
INSERT INTO `tag` VALUES ('10', '测试', '5f01e7e8b32a4c96b7e128cf04e86353', '2');
INSERT INTO `tag` VALUES ('4', '测试', '5f01e7e8b32a4c96b7e128cf04e86353', '2');
INSERT INTO `tag` VALUES ('8', '测试', '5f01e7e8b32a4c96b7e128cf04e86353', '2');
INSERT INTO `tag` VALUES ('a38e4278fb514877b50ee883960a461b', '文章标签1', '5f01e7e8b32a4c96b7e128cf04e86353', '1');
INSERT INTO `tag` VALUES ('f950c8cdbb6b4647836d17b91f5a9ea5', '文章标签2', '5f01e7e8b32a4c96b7e128cf04e86353', '2');

-- ----------------------------
-- Table structure for theme
-- ----------------------------
DROP TABLE IF EXISTS `theme`;
CREATE TABLE `theme` (
  `id` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `logo_img` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `auther_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `keyword` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `describe` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `QR_type` int(1) DEFAULT NULL,
  `QR_img` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `homePage` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `account_weibo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `account_zhihu` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `account_github` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `uid` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`,`uid`),
  KEY `theme_user_FK` (`uid`),
  CONSTRAINT `theme_user_FK` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of theme
-- ----------------------------
INSERT INTO `theme` VALUES ('1', '/static/logo.png', '胡涛', '博客系统，SpringMVC,Mybatis,MySQL', '博客系统，SpringMVC,Mybatis,MySQL', '0', null, 'www.hutaotao.cn', '5360387482', 'hu-tao-6-91', 'httv52', '5f01e7e8b32a4c96b7e128cf04e86353');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `uid` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `username` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `screen_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created` bigint(20) NOT NULL,
  `logged` bigint(20) DEFAULT NULL,
  `activateCode` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `state` int(1) NOT NULL,
  `resume` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `word_number` int(11) DEFAULT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('502864a3f77d4c718d9afa18a2355431', 'lisi', '202cb962ac59075b964b07152d234b70', '413193089@qq.com', '李四', '1505906904954', '1505970482127', 'f5efe96c25814a868773bbb6c5334336', '1', '暂无简介', null);
INSERT INTO `user` VALUES ('5f01e7e8b32a4c96b7e128cf04e86353', 'hutao', '202cb962ac59075b964b07152d234b70', '413193089@qq.com', '胡涛', '1505831972217', '1505979163123', '5f01e7e8b32a4c96b7e128cf04e86353', '1', '探索未知以分享，记录已知以备忘', '22525');
INSERT INTO `user` VALUES ('78faae18e6f84b0bade8743fe8241173', 'zs', '202cb962ac59075b964b07152d234b70', '413193089@qq.com', '张三', '1505838705253', '1505975470059', '78faae18e6f84b0bade8743fe8241173', '1', '暂无简介', null);
SET FOREIGN_KEY_CHECKS=1;
