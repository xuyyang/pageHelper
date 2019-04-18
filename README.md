# pageHelper
  前后端数据分离（分页插件）--基于SSM框架+layui+pageHelper+$.getJson()技术实现

  注意：图片效果图请于网址预览，谢谢。
  本文网址：https://42xyyang.top/post-77.html
  
  上篇文章跟大家讲解了SSM+pageHelper+Layui实现数据分页。本篇文章以上篇文章为基础跟大家讲解一下前后端分离。什么是前后端分离呢?大家可以自行百度，我对它的理解就是用eclipse等后端工具写后端接口，用Sublime等前端编辑器写前端页面，我们平时直接打开一个写好的静态页面显示的内容是不是都是页面中已经写好的，俗称“死”的。但是前后端分离则可以把数据库的数据显示在页面上。这也是所谓的实现跨域。

  本文用的技术为SSM框架、pageHelper、layui、$.getJson()
  
  好了，我们一步一步来讲解，请大家先完成上篇文章的内容。

  上篇文章链接：https://42xyyang.top/post-76.html

  如果大家按照我之前写的完成了上篇文章的话，按照如下步骤开始我们今天的学习。

1、在桌面新建一个文件夹，名字随便取，我的为pageHelper。然后将上篇文章下载的静态资源插件static丢在该文件夹里面。然后新建一个index.html网页，并将上文eclipse中的index.jsp中的内容复制到此网页中。效果如下所示：

   桌面文件效果图：

     QQ图片20190418114550.png

   index.html页面代码：

    <!DOCTYPE html>
    <html lang="en">
    <head>
	<meta charset="UTF-8">
	<title>pageHelper</title>
 
	<!-- 前端分页所需静态资源 -->
    <script type="text/javascript" src="static/jquery/1.9.1/jquery.min.js"></script>
    <link type="text/css" href="static/layui-v2.0.2/css/layui.css" rel="stylesheet">
    <script type="text/javascript" src="static/layui-v2.0.2/layui.all.js"></script>
    </head>
    <!-- 表格 -->
    <body>
	<div style="display: flex; flex-direction: column; justify-content: center; align-items: center; ">
	      <table class="layui-table" style="width: 800px">
		  <thead>
		    <tr>
		      <th>ID</th>
			  <th>用户名</th>
			  <th>密码</th>
			  <th>电话</th>
			  <th>地址</th>
			  <th>分数</th>
			  <th>操作</th>
		    </tr>
		  </thead>
		  <!-- 数据库数据  -->
		  <tbody id="tbody">
	          
		  </tbody>
		</table>
		
		<!-- 分页数据 -->
		<div id="page"></div>
	</div>
    </body>
    <script type="text/javascript">
 
       layui.use('laypage', function(){  //此处要是看不懂的可看教程：https://www.layui.com/doc/modules/laypage.html
    	
    	  var laypage = layui.laypage;   //表示在layui中使用  不独立使用laypage
    	  
    	  var url = "http://localhost:8080/SpringMvc-01/list";  //数据api   list为控制层中的list
 
    	  var config = {page: 1 , pageSize: 5};    //默认的参数   config.page表示 当前页   config.pageSize表示当前页的数据条数
    	
    	  
    	  $.getJSON(url,config,function(res){     //$.getJson(url,data,function(res){});
    		  laypage.render({
    			    elem: 'page',   //容器id  上文table下面给出了一个div  id为page的容器  此处获取这个容器
    			    count: res.total, //总条数   这个数据需要从服务器中得到
    			    layout: ['count', 'prev', 'page', 'next', 'limit', 'skip'],
    			    limit: config.pageSize, //每页条数 默认   
    			    limits: [5,10,15,20],  //定义切换的条数
    			    theme: '#FFB800', //自定义主题颜色
    			    
    			    jump: function(obj, first){   //切换分页的回调	  它是一个循环 ，在第一次时不进入 就是当前页         	        
    			        //此处为关键，obj.curr表示多少页  obj.limit 表示点击切换当前页为多少条数据时触发
    			        //大家如果把这个注释掉  就会发现点击条数切换时  当前页的数据不会发生改变了
    			    	var config = {page: obj.curr , pageSize: obj.limit};  
    			       
    			    
    			    	//首次则不进入
    			        if(!first){ 
    			        	config.page = obj.curr;  //就是当前页  第一页
    			        	
    			        	getUserListByPage(url,config);//页数的单击方法 
    			       }
    			    }
    		   });
    		  parseUserList(res,config.page);   //给一个方法 
    	  }); 
 
     });   
 
    //点击页数从后台获取数据
    function getUserListByPage(url,config){
	$.getJSON(url,config,function(res){
		parseUserList(res,config.page);   //页数点击后数据回调
	});
    }
 
    //解析数据，currPage参数为预留参数，当删除一行刷新列表时，可以记住当前页而不至于显示到首页去
    function parseUserList(res,currPage){
	var content = "";
	$.each(res.rows, function (i, o) { //两个参数，i表示遍历的数组的下标，o表示下标对应的值
		content += "<tr>";
		content += "<td>"+o.id+"</td>";
		content += "<td>"+o.username+"</td>";
		content += "<td>"+o.password+"</td>";
		content += "<td>"+o.phone+"</td>";
		content += "<td>"+o.address+"</td>";
		content += "<td>"+o.score+"</td>";
		content += "<td>"+"<a href='#'>删除</a>"+" "+"<a href='#'>修改</a>"+"</td>";
		content += "</tr>";
	});
	$('#tbody').html(content);
    }
    </script>
    </html>
2、然后大家在文件中用浏览器打开index.html显示如下则可以继续进行下一步。如果不是则很有可能是静态资源没导入成功，好好检查即可。

      QQ图片20190418114925.png

3、大家在调试的时候可能会有如下这个错误No 'Access-Control-Allow-Origin' header is present on the requested resource，不用管它，我在下文会提及的。

      QQ图片20190418115102.png

4、以上3步成功完成之后，我们要开始看后端代码了。假如大家按照上篇文章搭建了如下图一样的框架，并且能够成功显示数据分页，那么现在大家先把静态资源和index.jsp页面删除。

   未删除框架图：

      QQ图片20190418115500.png

   已删除框架图：

      QQ图片20190418115552.png

5、在运行eclipse中的项目后。会出现404报错，那是肯定的，因为index.jsp已经删除了嘛。这个不用管它。

6、我们现在打开UserController这个java文件，修改代码如下。关键就是加入response.setHeader("Access-Control-Allow-Origin", "*");解决我们上文提及的错误No 'Access-Control-Allow-Origin' header is present on the requested resource。

    package com.xyyang.controller;
    import java.util.HashMap;
    import java.util.Map;
    import javax.servlet.http.HttpServletResponse;
    import org.springframework.beans.factory.annotation.Autowired;
    import org.springframework.stereotype.Controller;
    import org.springframework.web.bind.annotation.RequestMapping;
    import org.springframework.web.bind.annotation.RequestMethod;
    import org.springframework.web.bind.annotation.ResponseBody;
    import com.github.pagehelper.PageInfo;
    import com.xyyang.bean.User;
    import com.xyyang.service.UserService;
 
    @Controller
    public class UserController{
	
	@Autowired
	UserService userService;	
	
	@RequestMapping(value="list",method=RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> findAllByPage(int page,int pageSize,HttpServletResponse response){
		
		//response设置响应头，解决跨域请求问题
		//No 'Access-Control-Allow-Origin' header is present on the requested resource
		response.setHeader("Access-Control-Allow-Origin", "*");
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		PageInfo<User> pager = userService.findUserByPage(page,pageSize);
		//总条数
		resultMap.put("total", pager.getTotal());
		//获取每页数据
		resultMap.put("rows", pager.getList());
		System.out.println(resultMap);
		return resultMap;	
	}	
    }
7、然后重新运行该项目

      QQ图片20190418120448.png

8、在桌面新建的文件夹中用浏览器打开index.html则会出现如下数据，请看下图

      QQ图片20190418120632.png

9、假如你进行到了这一步，我只能说恭喜你成功实现了前后端分离。

   还需要注意如下几点问题：

   one、切记按照先实现上篇文章的功能，本文皆以它为基础讲解，比如框架搭建，代码修改，数据库等。

   two、index.jsp和静态资源删不删除其实都无所谓，只不过为了证明实现了前后端数据分离。

   three、在index.html中有一个 var url = "http://localhost:8080/SpringMvc-01/list"; 此接口不能写错，大家先按照我写的就行，不用修改。

   four、切记切记切记阅读上文，谢谢。

   five、本文实现跨域主要是用$.getJson()，大家不懂这个参数的可以百度哦，百度肯定比我讲的好，所以我就不多讲解了。其次可以使用$.ajax()跨域实现，主要是jsonp格式转换。
   ......
