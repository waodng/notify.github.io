﻿﻿﻿## PDA快速定位问题点

## 一、通过开发的PDA接口测试界面来帮助自己定位和测试接口是否存在问题

### 1.浏览器中输入：本地部署的站点IP和端口，可正常访问，出现如下界面。

![image-20220124165008576](images\image-20220124165008576.png)

### 2.选择一个业务下对应的接口名称，像PDA一样测试调用接口

![image-20220124165934678](images\image-20220124165452842.png)

![image-20220124165934678](images\image-20220124165934678.png)

![image-20220124170056298](images\image-20220124170056298.png)

## 二、通过系统记录的接口调用记录表来定位问题

### 1.数据库表ActionLogInfo

Id										guid全球唯一编码
RequestUri						请求url
controllerName				控制器名称
actionName					   方法名称
httpMethod						http请求方法	
ip										  客户端请求IP
navigator							浏览器类型
costTime							请求花费时间
enterTime						  触发时间					
saveTime 						   保存时间
userId                                 用户ID
token             					 用户凭据
comments 						备注
executeResult					执行结果
userHostName				 主机名
urlReferrer						上一个url地址
browser							 浏览器版本
paramaters 					 请求参数
status 								请求状态
pdaVersion						PDA客户端使用版本
apiVersion						 API调用版本号
DEVICEFLAG					  设备版本号
webconfig 						该接口调用所使用的配置文件信息记录

### 2.如何通过PDA信息提示来定位当前接口报错的问题

* 下面这种情况调用查看接口调用情况

### ![image-20220124135854008](images\image-20220124135854008.png)

上图中可以明确的知道本次接口调用的地址，控制器名称，方法名。通过该信息可以去表中查看相关的接口调用信息。***样例：***

~~~select top 100 * from ActionLogInfo
select top 100 * from ActionLogInfo
where 1=1
and actionName='GetMjqStateList_New'
and controllerName='SterilizeInfoTbl'
order by saveTime desc
~~~

通过查看记录情况，是否加大top的值。

* 有些情况无法弹出错误提示，或者是数据问题，想要定位当前页面的接口调用情况，只能保证单一PDA设备使用，不能同时使用，然后查看最近日志表的数据来定位当前调用的接口情况，或者通过当前页面的参数来检索。**举个栗子：** 页面上扫码器械包编号，可通过字段paramaters模糊查询所有接口中含有该器械包编号的调用情况，其他使用自行摸索。
* 日志记录表中无数据，登录都无法访问，大概率是配置文件的问题，刚更新程序时，会出现这种问题。
* 利用PDA接口调试工具来定位问题，访问地址：http://服务器IP：端口

#### 关于PDA接口问题查找和定位，各位伙伴有更好的建议，可以直接@PDA开发组，我们将尽力做好和完善。

powerBy PDA客户端开发团队
