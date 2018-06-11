-- phpMyAdmin SQL Dump
-- version 2.11.2.1
-- http://www.phpmyadmin.net
--
-- 主机: localhost
-- 生成日期: 2013 年 09 月 26 日 05:28
-- 服务器版本: 5.0.45
-- PHP 版本: 5.2.5

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

--
-- 数据库: `bookshop`
--

-- --------------------------------------------------------

--
-- 表的结构 `allorders`
--

CREATE TABLE `allorders` (
  `Id` int(11) NOT NULL,
  `orderID` int(11) NOT NULL,
  `BookNo` int(11) NOT NULL,
  `Amount` int(11) default NULL,
  PRIMARY KEY  (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 导出表中的数据 `allorders`
--


-- --------------------------------------------------------

--
-- 表的结构 `book`
--

CREATE TABLE `book` (
  `Id` int(11) NOT NULL,
  `BookName` varchar(40) NOT NULL,
  `BookClass` int(11) NOT NULL,
  `Author` varchar(25) default NULL,
  `Publish` varchar(150) default NULL,
  `BookNo` varchar(30) default NULL,
  `Content` longtext,
  `Prince` double default NULL,
  `Amount` int(11) default NULL,
  `Leav_number` int(11) default NULL,
  `RegTime` date NOT NULL,
  `picture` varchar(200) default NULL,
  PRIMARY KEY  (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 导出表中的数据 `book`
--

INSERT INTO `book` (`Id`, `BookName`, `BookClass`, `Author`, `Publish`, `BookNo`, `Content`, `Prince`, `Amount`, `Leav_number`, `RegTime`, `picture`) VALUES
(1, 'Thinging In Java ', 1, 'Bruce Eckel', '人民邮电出版社', '0001', '指导您利用万维网的语言进行面向对象的程序设计，面向初学者和某种程度的专家 \r\n', 50, 100, 90, '2007-01-19', ''),
(2, 'JSP应用开发详解(第三版) ', 1, '刘晓华，张健，周慧贞 ', '电子工业出版社', '0002', '本书结合JSP和Servlet的最新规范，从基本的语法和规范入手，以经验为后盾，以实用为目标，以实例为导向，以实践为指导，深入浅出地讲解了JSP开发中的种种问题。以精简的内容介绍了JSP的语法、Servlet技术、JDBC技术、标签库技术、表达式语言、Struts、JavaServer Face、Spring MVC、Hibernate、Ajax等技术；对于JSP开发中常遇到的典型难点，专门设置了专题进行集中讨论。对于最新兴起的Web 2.0的Ajax技术，用理论和实例进行了深入浅出的描述。本书的最后一篇围绕实例，使用各种最新技术，对实例的各个模块进行开发实现，为读者开发实现系统提供了理论和实践上的指导。飞思在线http://www.fecit.com.cn的“下载专区”提供书中范例源代码下载。\r\n本书不仅适合专业和准专业的Java程序员阅读，也可作为正在进行Java开发的各类程序员的必备参考书。\r\n', 49, 100, 80, '2007-01-19', ''),
(3, 'Eclipse开发入门与项目实践 ', 1, '张桂圆 贾燕枫', '人民邮电出版社', '0003', '本书是Eclipse的学习指南。书中较为全面地介绍了在Eclipse开发环境中进和各种Java应用开发的方式和技巧。本书的特色是以案例为主，将相关知识点作为主线贯穿其中。第1部分是开发基础，内容涉及搭建运行环境和开发平台、基于Eclipse环境实现基本Java应用程序、Java Web应用、基于几种主流数据库系统的开发、Eclipse SWT/JFace应用程序的设计实现以及插件开发的工作流程。考虑到许多初学Jave开发的程序员普遍缺乏在Eclipse平台上进行实际项目开发的工程经验本，本书在 第2部分提供了一个完整的电子商务网站的设计和开发实例，并在该网站中实现了许多可以直接作为商用软件的模块，通过对网站各个功能模块从需求分析、系统设计及部署实现等全过程的分析，使读者能够快速积累基于Eclipse开发平台，结合JSP、Servlet、Struts、Hibernate待主流开发技术的实践经验，并能够依据书中提供的案例定制想要的功能，开发专业的Java Web系统。\r\n本书是作者多年从事教学和开发经验的总结。因此，作者阐述了主流Java开发技术最佳学习路线，以及在学习过程中注意事项。\r\n本书结构清晰、注重实用、深入浅出，非常适合作为Eclipse中Java应用开发的自学教材或培训教材，同时，也可作为Java开发人员的参考用书。\r\n', 48, 80, 50, '2007-01-19', ''),
(4, 'MySQL 5权威指南(第3版) ', 1, '科夫勒', '人民邮电出版社', '0004', '本书全面深入地介绍了MySQL的功能，主要内容包括MySQL、PHP、Apache、Perl等组件的安装与功能简介，mysql等一些重要系统管理工具和用户操作界面的使用，MySQL数据库系统设计的基础知识与用不同语言设计MySQL数据库的过程，以及SQL语法、工具、选项、API应用指南，最大限度地帮助读者更快地学习和掌握MySQL数据库系统的设计和使用。本书覆盖了MySQL 5.0，讨论了新的程序设计接口（如PHP 5里的mysqli）和新的系统管理工具。\r\n', 55.3, 100, 90, '2007-01-19', ''),
(5, 'JavaScript DOM编程艺术 ', 1, '基思', '人民邮电出版社', '0005', '本书讲述了JavaScript和DOM的基础知识，但重点放在DOM编程技术背后的思路和原则：预留退路、循序渐进和以用户为中心等，这些概念对于任何前端Web开发工作都非常重要。本书将这些概念贯穿在书中的所有代码示例中，使你看到用来创建图片库页面的脚本、用来创建动画效果的脚本和用来丰富页面元素呈现效果的脚本，最后结合所讲述的内容创建了一个实际的网站。\r\n本书适合Web设计师和开发人员阅读。', 27.3, 100, 80, '2007-01-19', ''),
(6, '精通Struts：基于MVC的Java Web设计与开发 ', 1, '孙卫琴', '电子工业出版社 ', '0006', 'Struts是目前非常流行的基于MVC的Java Web框架。本书详细介绍了在最新的Struts1.1以及不久将推出的Struts1.2版本上设计和开发Java Web应用的各种技术。本书第1章到第3章为入门篇，通过两个Struts应用实例，引导读者把握设计、开发和部署Struts应用的整体流程，充分体会Struts框架在开放大型、可扩展的Web应用方面发挥的优势。第4章到第7章深入探讨了Struts框架的核心组件ActionServlet和RequestProcessor的实现原理，详细介绍了开发Struts应用的模型、视图和控制器的各种技术，细致的描述了Struts配置文件的每个元素的使用方法。第8章到第9章介绍了开发Struts应用的一些实用技术，如Struts框架的扩展点、Struts应用的国际化，Validator验证框架和异常处理机制等。第12章到第16章结合具体的Struts应用实例，详细介绍了Struts的标签库以及Tiles框架的使用方法。第17章和第18章介绍如何采用EJB和Web服务来实现Struts框架的模型。第19章到第21章介绍了如何采用第三方软件，如Apache Common Logging API、Log4J、ANT和StrutsTestCase，来控制Struts应用的输出日志、管理以及测试Struts应用项目。', 34.1, 80, 50, '2007-01-19', ''),
(7, '网页设计基础:HTML,CSS和JavaScript ', 1, '史晓燕', '清华大学出版社 ', '0007', '本书按照高等院校计算机网页设计教学大纲的要求而编写，是一本全面掌握网页设计语言的基础教程。全书内容共12章分为三个部分。\r\n第一部分的主要内容是HTML语言，由于HTML语言是网页设计的基本语言，因此本部分系统介绍文本、图像、超链接、表格、表单、框架、多媒体等方面的元素和属性。第二部分的主要内容是CSS，在这部分中，完整介绍CSS的基础知识，特别是对CSS的各种属性进行详细的解释和分析。第三部分的主要内容是javascript语言，主要介绍javascript语言的主要特征、语法结构、语句和对象的使用。\r\n本书浅显易懂，结构合理，内容翔实，图文并茂，适合作为高职高专院校计算机类专业的教材，也适合从事网页设计与制作的专业人员的入门教材。\r\n', 12.6, 100, 90, '2007-01-19', ''),
(8, 'Eclipse权威开发指南（第2版） ', 1, '安茹', '清华大学出版社', '0008', '本书由IBM Eclipse Jumpstart小组成员编写，荣获第15届Jolt大奖，是全世界Java开发人员学习Eclipse的首选读本。该书从第1版开始，就以经典的内容影响无数Java程序员，受到业界专家和读者的极大推崇。无论您是否拥有Eclipse开发经验，本书都将使您获益匪浅。\r\n', 75.6, 100, 80, '2007-01-19', ''),
(9, '精通EJB3.0 ', 1, '斯瑞格奈斯', '电子工业出版社', '0009', '本书是关于EJB 3.0的专业技术教程，专注于EJB的概念、方法、开发过程的介绍。同时，本书还研究许多高端的EJB知识，使得开发者能够真正理解和掌握EJB，实践出真知。通过阅读此书，开发者将精通EJB。 \r\n全书共分为4个部分：第一部分对EJB编程基础进行介绍，概要性地对EJB进行了阐述；第二部分重点关注EJB编程的具体内容和过程，向开发者展示了如何使用会话Bean、将会话Bean发布为Web服务、消息驱动Bean；第三部分专注于高级EJB专题；第四部分是附录，收集了EJB组件技术相关的其他内容。\r\n本书适合作为Java程序员、网站开发人员和系统分析员的参考书。\r\n', 41.3, 80, 50, '2007-01-19', ''),
(10, 'Oracle9i&10g编程艺术：深入数据库体系结构', 1, '凯特', '人民邮电出版社', '0010', '本书是一本关于Oracle 9j az& 10g数据库体系结构的权威图书，涵盖了所有最重要的Oracle体系结构特性，包括文件、内存结构和进程，锁和闩，事务、并发和多版本，表和索引，数据类型，以及分区和并行，并利用具体的例子来充分介绍每个特性，不仅讨论了各个特性是什么，还说明了它是如何工作的，如何使用这个特性来开发软件，以及有关的常见陷阱。\r\n　　本书面向从事Oracle数据库应用的所有开发人员的或DBA。\r\n', 69.3, 100, 90, '2007-01-19', ''),
(37, '伟大的博弈', 4, '戈登', '中信出版社 ', '0007', '《伟大的博弈》是一部讲述以华尔街为代表的美国资本市场发展历史的著作。这本书以华尔街为主线展示了美国资本市场发展的全过程。它生动地讲述了华尔街从一条普普通通的小街发展成为世界金融中心的传奇般的历史,展现了以华尔街为代表的美国资本市场在美国经济发展和腾飞过程中的巨大作用。书中大量的历史事实和经济数据,让我们可以更全面和准确地认识美国资本市场的发展过程。\r\n　从世界范围看,资本市场的产生和发展是与社会化大生产紧密相连的。从马克思有关虚拟经济的论述,到后来产生的各种经济学理论,都对资本市场在现代经济中的作用进行过不同角度的阐述。在现代经济生活中,资本市场不仅提供了企业筹集资本的场所,也是实现社会资源配置的工具；并且还起到完善公司治理结构的重要作用。\r\n　了解华尔街的历史,能使我们对于美国如何在两百多年的时间里,从一个殖民地成为世界超级大国这一转变的历史原因增加了认识。在美国经济的发展过程中,华尔街在不同的历史时期承担了不同的历史使命,它支撑了美国联邦政府在南北战争中的战争融资,推动了美国由铁路带来的第一次重工业化浪潮,扩大了美国在两次世界大战中获得的巨大经济利益,也实现了美国在上世纪八十年代后向新经济成功转轨的进程。\r\n　回顾历史,尤其是最近一百年的历史,华尔街的作用在不断丰富和深化,投资人在华尔街追逐自身利益的同时,"看不见的手"实现了社会资源的高效率配置。尤其是在知识经济时代,资本市场将知识和经济紧密地结合起来,推动着美国科技的飞速发展,使美国在当今激烈的国际竞争中,在具有战略意义的科技领域里始终保持着领先地位。\r\n　处在关键战略期的中华民族,面临着实现伟大复兴的历史使命。党的十六大做出了全面建设小康社会的战略部署,这是一项涉及社会各个方面和各个领域的庞大系统工程。以史为鉴,世界历史发展的经验揭示了资本市场在国家发展过程中的重要作用。一个健康、高效和稳定的资本市场,有利于提高社会资源的利用水平和经济的运行效率,实现可持续发展,增强一个国家的综合国力。党中央、国务院深刻地认识到了资本市场的重要作用,将大力发展资本市场作为一项重要的战略任务。我国的资本市场发展到今天,已经取得了巨大的成就,为社会主义建设作出了巨大的贡献。面对新的形势和历史使命,如何进一步推进资本市场改革开放和稳定发展,更好地服务于全面建设小康社会的宏伟目标,是当前摆在我们面前的一个迫切的课题。　\r\n', 23.4, 100, 90, '2007-01-19', ''),
(38, '金字塔原理：思考，写作和解决问题的逻辑 ', 4, '吸托', '民主与建设出版社', '0008', '本书是关于金字塔原理的最新版本，收录了作者从1987年至今获得和发现的所有关于思维表达方面的体会和技巧。与旧版本相比，本书增加了新的章节，如介绍如何界定问题和分析问题，以及如何从视觉的角度出发，在纸张和屏幕上演示金字塔结构。\r\n　　本书分为四大部分。\r\n　　第一篇同以前的版本没有太大的区别，主要对金字塔原理的概念进行了解释，并介绍了如何利用这一原理构建基本的金字塔结构。本篇的内足使你理解和使用简单文书的写作技巧。\r\n　　第二篇介绍了如何深入细致地把握思维的环节，以保证你使用的语句能够真实地反映你希望表达的思想要点。本篇列举了许多实例，突出了强迫自己进行“冷静思维”对明确表达思想的重要性。\r\n　　第三篇是全新的内容，主要针对的对象是需要写研究分析报告的人士，以及需要对复杂的问题进行分析、提出结论供决策使用的人士。本篇介绍了如何在解决问题过程中的不同阶段使用多种框架组织你的分析过程，使你的思维实际上进行了预选组织，从而能够更方便地应用金字塔原理。\r\n　　第四篇介绍了一些演示技巧，能够帮助你在以幻灯片等书面形式演示具有金字塔结构的思想时，使读者或观众感受到金字塔结构的存在。\r\n　　本书还附有三个附录。附录一涉及的是分析法和科学法在解决问题过程中的区别；附录二列举了序言部分的各种常用写作模式；附录三是本书要点的详细提纲，其中突出了本书的关键概念和关键思维技巧，以便读者快速查阅。\r\n', 23.88, 100, 80, '2007-01-19', ''),
(39, '旁观者：管理大师德鲁克回忆录 ', 4, '德鲁克 ', '机械工业出版社 ', '0009', '本书的写作的目的就是在于刻画一些特别的人，以及他们的特立独行。\r\n本书可以说是一本短篇故事集，每一章都可个别独立。我希望借此呈现社会的图像，捕捉并传达这一代的人难以想像的那种神髓、韵味和感觉，比如两次大战间的欧洲、罗斯福的新政时期，以及第二次世界大战刚结束时的美国。事实上，早在餐尼迪执政时，写作此书的念头已开始萌芽。那些年代对我的孩子、我的学生以及许多年轻朋友而言，虽还不算是“历史”，却已如吉亚述王国的尼尼微和阿苏尔般遥不可及。\r\n《旁观者》不仅是一本好书，而且是德鲁克著作中最为重要的一本，是德鲁克迷们最不该错过的一本，是了解德鲁克的必读，我愿意郑重推荐给所有的管理者——我知道大家用来读一本书名中既不包含“管理”也没有“领导”的书的时间很有限，但是如果可能，请翻开这本书，开始读。\r\n', 22.8, 80, 50, '2007-01-19', ''),
(40, '德鲁克日志 ', 4, '（美）德鲁克，马恰列洛', '上海译文出版社', '0010', '有史以来，德鲁克最深刻的思想第一次集中在了一处，那就是《德鲁克日志》。本书采撷了德鲁克毕生作品的精华，向我们提供了理解德鲁克思想的金钥匙。它不仅仅是对德鲁克一生著述精髓的回顾，更是一本行动手册。正如德鲁克自己写道的那样：“书中每页最下端空白处的‘行动指南’部分是本书中最为重要的。相信读者能从中汲取灵感，从而改善自身的行动、决策以及决策的成效。本书正是一本行动手册。” \r\n本书能准确地告诉大家该怎样把德鲁克的思想转化为行动。这就好像世界上最睿智、最善于提供行动方案的管理顾问与你身处一室，向你提供他愈久弥新的宝贵建议。对于所有渴望领会并运用德鲁克金玉良言的人士，《德鲁克日志》都是你的必读佳作。\r\n', 22.8, 100, 90, '2007-01-19', '');
INSERT INTO `book` (`Id`, `BookName`, `BookClass`, `Author`, `Publish`, `BookNo`, `Content`, `Prince`, `Amount`, `Leav_number`, `RegTime`, `picture`) VALUES
(41, '品三国 ', 5, '易中天', '上海文艺出版社', '0001', '我们总是习惯于把王朝的兴衰、事业的成败、历史的更替和事情的对错都归结为个人的原因，归结为某个领袖人物和主导人物个人品质的优劣好坏。与此同时，历史人物也都按照一种简单的善恶二元化论而无一例外地脸谱化了，中国历史则变成了一个大戏台。但我们从来就不知道舞台上为什么会有那么多白脸和白鼻子，也不知道红脸和黑脸的什么时候才能出现，因为我们不知道编剧和导演是谁。我们只能寄希望于运气和等待，却不肯承认每一次“善报”，往往也差不多意味着下一次“恶运”的来临。 \r\n从天下大乱到诸侯割据；从三国鼎立到重归统一；这是一个英雄辈出的时代；这是一段扑朔迷离的历史；这是一些引人入胜的故事；这是一个津津乐道的话题；正史记录，野史传说，戏剧编排，小说演义；不同时期有不同的评点；不同作品有不同的描述；是非真假众说纷纭；成败得失疑窦丛生；厦门大学教授易中天先生站在平民立场，通过现代视角，运用三维结构；以故事说人物，以人物说历史，以历史说文化，以文化说人生；一家之言品三国。\r\n', 15, 100, 90, '2007-01-19', ''),
(43, '帝国的惆怅:中国传统社会的政治与人性 ', 5, '易中天', '文汇出版社', '0003', '本本书是易中天先生以其中央电视台《百家讲坛》汉代人物风云系列讲座为基础，解读中国传统社会的政治与人性之间的冲突，渗透，帝国体制由来去向，改革派的命运沉浮，得失奥妙……纵横捭阖，妙趣横生，发人深思。\r\n历史总是让人惦记，历史也从来没有走远。', 15.6, 80, 50, '2007-01-19', ''),
(44, '影响力 ', 5, '罗伯特.西奥迪尼', '中国人民大学出版社', '0004', '在这本书中，著名的心理学家罗伯特?B?西奥迪尼博士为我们解释了为什么有些人极具说服力，而我们总是容易上当受骗。隐藏在冲动地顺从他人行为背后的6大心理秘笈，正是这一切的根源。那些劝说高手们，总是熟练地运用它们，让我们就范。\r\n　　在这本书中，罗伯特?B?西奥迪尼博士为我们一一拆解他们的招术，学会保护自己以及让这6大秘笈为我们所用。\r\n　　读过此书之后，定能使你做到以下两件事：一是当你真正的意图是要说“不”时，你不会再说“是”，二是可以令你自己变得比以前更具影响力。', 27, 100, 90, '2007-01-19', ''),
(45, '世界是平的', 5, '（美）托马斯.弗里德曼', '湖南科学技术出版社', '0005', '   当学者们讨论世界这20年发展的历史，并把目光聚集在2000年到2004年 3月这一段时间时，他们将说些什么？9·11恐怖袭击还是伊拉克战争？或者，他们将讨论：科技的汇集与传播使得印度、中国和许多发展中国家成为世界商品和服务产品供给链上的一员，从而为世界大的发展中国家中的中产阶级带来了大量的财富，使这两个国家在全球化浪潮中占据更有利的位置？随着世界变得平坦，我们必须以更快的速度前进，才能在竞争中赢得胜利？这个世界是否变得如此之小、变化如此之快，从而使我们的政治体系无法调整到与之相适应的稳定结构？ \r\n在他这本充满智慧的新书里，三度普利策奖得主，《凌志车与橄榄树》的作者托马斯·弗里德曼揭开了笼罩在这个世界上的神秘面纱，深入浅出地讲述复杂的外交政策和经济问题，为读者们释疑解惑。他解释到，世界的平坦化趋势是如何在21世纪初发生的？这个趋势对于国家、公司、社会和个人而言意味着什么？政府与社会要做出而且必须做出怎样的调整以应付这种趋势《世界是平的》及时地就全球化中的这些问题——全球化取得的成功和其面临的挑战——进行了分析。\r\n', 42, 100, 80, '2007-01-19', ''),
(46, '中国历代政治得失 ', 5, '钱穆', '生活·读书·新知三联书店 ', '0006', '这是一本钱穆先生专题演讲的合集，在分题演讲中，钱先生就中国汉、唐、宋、明、清五朝的政府组织、百官职权、考试监察、财经赋税、兵役义务等种种政治制度作了介绍和对比，叙述因革演变，指陈利害得失，既总括了中国历史与政治的精要大义，又点明了近现代中国人对传统文化和精神的种种误解。可以说本书是一本简明的中国政治制度史。\r\n本书为作者的专题演讲合集，分别就中国汉、唐、宋、明、清五代的政府组织、百官职权、考试监察、财经赋税、兵役义务等种种政治制度作了提要勾玄的概观与比照，叙述因革演变，指陈利害得失。既高屋建瓴地总括了中国历史与政治的精要大义，又点明了近现代国人对传统文化和精神的种种误解。言简意赅，语重心长，实不失为一部简明的“中国政治制度史”。\r\n', 9.6, 80, 50, '2007-01-19', ''),
(47, '于丹<论语>心得 ', 5, '于丹', '中华书局 ', '0007', '《百家讲坛》栏目一贯坚持“让专家、学者为百姓服务”的栏目宗旨，栏目在专家、学者和百姓之间架起一座桥梁——“一座让专家通向老百姓的桥梁”，从而达到普及中国优秀传统文化的目的。《百家讲坛》栏目坚持“《百家讲坛》，坛坛都是好酒”的节目制作理念，不断培养专家、学者的公众意识，不断强化媒体为受众着想的服务意识。\r\n　　《论语》，流传2500多年，影响世代中国人，它的经典语句，每一个中国人耳熟能详。《论语》的真谛，就是告诉大家。怎么样才能过上我们心灵所需要的那种快乐的生活。北京师范大学于丹教授紧扣21世纪人类面临的心灵困惑，结合其深厚的古典修养，运用女性特有的细腻情感，从中国人的宇宙观、心灵观、处世之道、交友之道、人格修养之道、理想和人生观等七个方面，从独特的个性视角出发来解读《论语》。\r\n　　灰色的孔子又必须链接多彩的世界。这世界充满生命活力，姹紫嫣红，千姿百态，万类霜天竞自由。正因为有了生活的五彩缤纷，理论的灰色才不显得死寂；也正因为有了思想的高贵纯粹，纷繁的世界才不至于俗不可耐。灰色提升着品位，而多彩保证了活力。这也就是和谐。\r\n　　于丹为我们讲述的就是这样的孔子，一位链接了多彩世界的灰色孔子。链接是广泛的，东西南北，古今中外。主题却是单纯的，单纯到没有色彩，没有性别，没有时间和空间，只有温度。\r\n　　全书以白话诠释经典，以经典诠释智慧，以智慧诠释人生，以人生诠释人性，以人性安顿人心，体悟经典的普适智慧。', 13.8, 100, 90, '2007-01-19', ''),
(48, '明朝那些事(朱元璋卷) ', 5, '当年明月', '中国友谊出版公司', '0008', '《明朝那些事儿》这篇文主要讲述的是从1344年到1644年这三百年间关于明朝的一些事情，以史料为基础，以年代和具体人物为主线，并加入了小说的笔法，对明朝十七帝和其他王公权贵和小人物的命运进行全景展示，尤其对官场政治、战争、帝王心术着墨最多，并加入对当时政治经济制度、人伦道德的演义。\r\n《明朝那些事-朱元璋卷》从朱元璋的出身开始写起，到永乐大帝夺位的靖难之役结束为止，叙述了明朝最坚苦卓绝的开国过程。更有明朝最大的谜团-----永乐夺位、建文失踪的靖难之役。高潮迭起，欲罢不能。', 14.88, 100, 80, '2007-01-19', ''),
(49, '全球通史:从史前史到21世纪（上下册)', 5, '斯塔夫里阿诺斯', '北京大学出版社', '0009', '本书分八个部分，四十四个章节，主要讲述了世界历史的进化，世界文明的发展及其对现代社会的影响。作者着眼于全球，侧重于那些有影响的、促进历史发展的历史事件，其中包括原始社会、欧亚大陆的古代文明、欧亚大陆的原始文明、欧亚以外的世界、地区分割后的世界、西方世界的崛起、西方人统治的世界、西方的衰落与成功等八个主要的部分。重点突出，主题鲜明，着重有三个主要的问题，即（1）欧洲扩张的根源；（2）欧洲扩张前的儒家文化、穆斯林和其它非欧洲的世界；（3）欧洲扩张的各个历史时期：伊比利亚时期，荷兰、法国、英国时期，沙俄时期。本书为上册。 \r\n斯塔夫里阿诺斯的这部潜心力作自1970年初版问世以来，赞誉如潮．被译成多种语言流传于世，可谓经典之中的经典。第7版在保留原文精华的基础上．融入了时新的研究成果．新增了数百幅生动珍贵的图片和脉络清晰的地图，使这部名著在内容和体系上更加完善。作者文笔隽永，笔力深厚，才思横溢，整部著作风格前后一贯，令您在颇具历史韵律的行文中思接千载、视通万里\r\n', 57.6, 80, 50, '2007-01-19', ''),
(82, '男人来自火星，女人来自金星 ', 9, '格雷 ', '吉林文史出版社', '0002', '本书是获得与异性完美关系的最佳指南，是一本有价值、非常有必要的读物，它对理解男人和女人的沟通是一个突出的贡献。 \r\n　　自古以来，不论中外，女性在以男权为中心的社会中都处于一种被压抑的状态。社会不曾给予女性受教育与参与各种社会意见的机会，女性的作用似乎只是一个家庭的看护者，甚且在一夫多妻的社会里可能沦为男人性需求与繁衍后代的工具。女性的聪明才智既受到压抑，在有限的社会圈子里投诉无门，只好把满腹的不平潜藏于心，做一名杜基体装下的驯服者，或是化为泼辣抗俗，为人论柄。女性为男人附属品的位置一坐几千年，所幸本世纪初女权运动因争取女性的政治投票权，加上战争期间，许多女人取代了男人的工作地位，女性才得以走出家庭，在社会建设上发挥其一压数千年的才干。 \r\n　　呈献给中国各年龄层男女读者面前的这本书，是一本有助于完善夫妻关系、保持美满基姻，使夫妻结伴走完人生旅途的通俗性的心理自助读物。英文版于1992 年在美国首次出版。本书一出版，引起了巨大的社会轰动，在美国各年龄层的男男女女中产生了很大影响。美国最权威的书评刊物《纽约时报书评杂装》根据其销售量，将其排在畅销书排行榜前列，时间竟长达一百五十八周。 \r\n　　作者以男女来自不同的星球这一新鲜、生动、形象的比喻作为他的全部实践活动的理论支撑点：即男人和女人无论是在生理上还是心理上，无论是在语言上还是在情感上，都是大不相同的。这一比喻贯穿着他的这本通俗的畅销读物之始终，并冠以书名之中。\r\n', 16.8, 100, 80, '2007-01-19', '');
INSERT INTO `book` (`Id`, `BookName`, `BookClass`, `Author`, `Publish`, `BookNo`, `Content`, `Prince`, `Amount`, `Leav_number`, `RegTime`, `picture`) VALUES
(83, '做最好的自己 ', 9, '李开复', '人民出版社', '0003', '在这本书里的许多想法都是作者在过去的文章或信函中表达过的。而且，如果由职业作家来写本书，语言以及文字一定能更加流畅、更加生动。但是，作者自己总有一种提笔写作的冲动，因为作者相信自己在青年一代中有一定的影响力，作者希望能尽力帮助他们。\r\n作者深信，读者无法理解说教或难以产生共鸣的案例是不可能被读者接受的。在年轻人看来，发生在成功者身边的故事最值得学习和品味，最容易从中汲取经验和教训。如果说作者的写作还有某些特点可循的话，那就是，作者更倾向于用缜密的逻辑和真实的案例来阐释成功的秘诀。虽然这本书不是一本自传，但是在本书中，也有许多发生在作者身上的有意思和价值的事情。\r\n作者把这本书献给我深爱的祖国，献给渴求进步的青年一代，因为我深信：\r\n惟有更多的青年找到了自信和快乐，找到了真正属于自己的成功之路，中华民族才能够拥有加辉煌的未来。\r\n', 16.8, 80, 50, '2007-01-19', ''),
(84, '1000个思维游戏', 9, '莫斯科维奇', '南海出版公司', '0004', '一本富有智慧和挑战的风靡全世界的奇书，全世界聪明人都在做的1000个思维游戏。\r\n游戏通过模型模拟了几乎所有现实生活中的各种条件、愿望和结构。游戏（比如市场游戏、生存游戏、约会游戏）为什么会成为我们生活的重要象征。\r\n答案很显然：做游戏的人\r\n在想赢的同时，知道他们可能输。\r\n如果你觉得这些题很简单，那得祝贺你，但是请记住：事实本身并不代表你聪明，它只能说明你的思维非常适合于解决这些问题。\r\n', 30, 100, 90, '2007-01-19', ''),
(85, '现在，发现你的优势 ', 9, '白金汉', '中国青年出版社 ', '0005', '不幸的是，我们大部分人对自身才干和优势不甚了了，更不具备根据优势安排自己生活的能力。相反，在我们的父母、老师、经理和一心关注病态的心理学引导下，我们成为自身弱点的专家，为修补这些欠缺而一生追求，却对我们的优势不闻不问，任其荒废。\r\n全国畅销书《首先，打破一切常规》的合著者马库斯·白金汉和盖洛普国际研究和教育中心主任唐纳德·克利夫顿发明了一个革命性的方案，来帮助读者们识别自身才干，并将其发展成优势，继而持续达到几乎完美的工作表现。本书的核心是网上进行的优势识别器(StrengthsFinder)测试。这是长达25年，耗资数百万美元的研究成果，旨在识别最普遍的人类优势。该测试推出34个主导“主题”及其成千上万的组合，并揭示如何最有效地将它们转化为个人和事业的成功。在开发这一方案过程中，盖洛普对两百多万人进行了心理测试，继而帮助读者学会关注和增强这些主题。\r\n那么，它的工作原理是什么？本书附有一个独一无二的个人识别码，使你能通过互联网进入优势识别器测试。这一网上访谈分析你的本能反应，并立即向你提供你的五个最强大的主题。你获知自己在34个主题中－例如成就、行动、体谅、前瞻、战略等－的主导主题后，本书就会指导你如何在三个层面上发挥它们，继而产生巨大的效应：你的自身发展，你作为一名经理人的成功和你所在组织的成功。\r\n', 16.8, 100, 80, '2007-01-19', ''),
(86, '善待自己 ', 9, '艾伯斯坦', '哈尔滨出版社 ', '0006', '这是一本有快乐的“日历”，在它的引导下，一年365天，每天做一件事，进行一次小小的冒险，你就能获得一种新的体验，就可以活得更快乐。\r\n阅读本书并加以体验，你会发现创造快乐人生并没有什么不可逾越的困难。善待生活、善待生命，更要善待自己！\r\n', 16.08, 80, 50, '2007-01-19', ''),
-- --------------------------------------------------------

--
-- 表的结构 `bookadmin`
--

CREATE TABLE `bookadmin` (
  `AdminUser` varchar(20) NOT NULL default '',
  `AdminPass` varchar(50) default NULL,
  PRIMARY KEY  (`AdminUser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 导出表中的数据 `bookadmin`
--

INSERT INTO `bookadmin` (`AdminUser`, `AdminPass`) VALUES
('admin', 'admin');

-- --------------------------------------------------------

--
-- 表的结构 `bookclass`
--

CREATE TABLE `bookclass` (
  `Id` varchar(11) NOT NULL,
  `ClassName` varchar(30) NOT NULL,
  PRIMARY KEY  (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 导出表中的数据 `bookclass`
--

INSERT INTO `bookclass` (`Id`, `ClassName`) VALUES
('1', '计算机类'),
('10', '医学类'),
('11', '青春类'),
('12', '动漫类'),
('13', '体育类'),
('14', '美食类'),
('15', '旅游类'),
('16', '工具书'),
('17', '电子类'),
('18', '交通类'),
('19', '教育类'),
('2', '文学类'),
('20', '通讯类'),
('3', '小说类'),
('4', '管理类'),
('5', '文化类'),
('6', '艺术类'),
('7', '科学类'),
('8', '传记类'),
('9', '励志类');

-- --------------------------------------------------------

--
-- 表的结构 `order`
--

CREATE TABLE `order` (
  `Id` int(11) NOT NULL auto_increment,
  `orderId` varchar(20) NOT NULL,
  `UserId` int(11) NOT NULL,
  `SubmitTime` datetime NOT NULL,
  `ConsignmentTime` varchar(20) default NULL,
  `TotalPrice` double default NULL,
  `content` longtext,
  `IPAddress` varchar(20) default NULL,
  `IsPayoff` int(11) default NULL,
  `IsSales` int(11) default NULL,
  PRIMARY KEY  (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- 导出表中的数据 `order`
--


-- --------------------------------------------------------

--
-- 表的结构 `shop_user`
--

CREATE TABLE `shop_user` (
  `Id` int(11) NOT NULL auto_increment,
  `UserName` varchar(20) NOT NULL,
  `PassWord` varchar(50) NOT NULL,
  `Names` varchar(20) default NULL,
  `Sex` varchar(2) default NULL,
  `Address` varchar(150) default NULL,
  `Phone` varchar(25) default NULL,
  `Post` varchar(8) default NULL,
  `Email` varchar(50) default NULL,
  `RegTime` datetime default NULL,
  `RegIpAddress` varchar(50) default NULL,
  PRIMARY KEY  (`Id`),
  KEY `Id` (`Id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- 导出表中的数据 `shop_user`
--

INSERT INTO `shop_user` (`Id`, `UserName`, `PassWord`, `Names`, `Sex`, `Address`, `Phone`, `Post`, `Email`, `RegTime`, `RegIpAddress`) VALUES
(1, 'zhangsan', '123456', '', '男', '', '', '', '', '2013-06-15 09:22:17', 'fe80:0:0:0:bde6:8a04:aed6:a414'),
(2, 'lisi', '123456', '', '?', '', '', '', '', '2013-06-17 22:48:09', '0:0:0:0:0:0:0:1');
