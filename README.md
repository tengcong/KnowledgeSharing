# Knowledge Sharing System

Knowledge Sharing System 设计初衷是用于团队内部资源共享

团队成员可以将平日看到的好的文章 视频 技术技巧 学习疑问 等保存到系统内

可以为定期的内部交流会议提供资源材料

系统坚持简洁的设计理念，不提供资源分页等等操作，但提供灵活高效的资源检索

* `tags: =program, @mongodb, -mapreduce | type: video | user: congteng45@gmail.com | mapreduce`
*  可以检索=program为标签 video为type 分享用户为congteng45@gmail.com title中包含mapreduce的资源
可以用 上下 箭头选择文章
命令详解:

* `tags or #` : 标签（多个标签需要用,分割）
* `type or &` : 类别
* `user or @` : 用户email
* 默认对title检索
* `上 下`箭头 : 上下选择
* `home`      : 回首页
* `share`     : 到分享页面

可自行扩展filter.js

使用技术

* Rails 
* jQuery
* AngularJs
* underscore
* twitter-bootstrap
