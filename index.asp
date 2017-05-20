<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<!--此页面实现Word图片自动批量上传的功能-->
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>WordPaster For KindEditor-4.x</title>
    <link type="text/css" rel="Stylesheet" href="WordPaster/css/WordPaster.css"/>
    <link type="text/css" rel="Stylesheet" href="WordPaster/js/skygqbox.css" />
	<link type="text/css" rel="stylesheet" href="themes/simple/simple.css" />
	<script type="text/javascript" charset="utf-8" src="kindeditor-min.js"></script>
	<script type="text/javascript" charset="utf-8" src="lang/zh_CN.js"></script>
    <script type="text/javascript" src="WordPaster/js/json2.min.js" charset="utf-8"></script>
    <script type="text/javascript" src="WordPaster/js/jquery-1.4.min.js" charset="utf-8"></script>
	<script type="text/javascript" src="WordPaster/js/w.edge.js" charset="utf-8"></script>
    <script type="text/javascript" src="WordPaster/js/w.app.js" charset="utf-8"></script>
    <script type="text/javascript" src="WordPaster/js/w.file.js" charset="utf-8"></script>
    <script type="text/javascript" src="WordPaster/js/WordPaster.js" charset="utf-8"></script>
    <script type="text/javascript" src="WordPaster/js/skygqbox.js" charset="utf-8"></script>
</head>
<body>
	<div style=" font-size:medium; line-height:130%;">
	<p>演示方法：</p>
	<ul style="list-style-type:decimal;">
		<li>打开Word文档，复制多张图片，然后点击编辑器中的图片粘贴按钮<img alt="粘贴图片" src="WordPaster/css/paster.png" width="16px" height="16px"/>，编辑器将自动上传所有图片。</li>
		<li>复制电脑中任意图片文件，然后点击编辑器中的粘贴图片按钮<img alt="粘贴图片" src="WordPaster/css/paster.png" width="16px" height="16px"/>。</li>
		<li>通过QQ或其它软件截屏，复制图片，然后点击编辑器中的图片粘贴按钮<img alt="粘贴图片" src="WordPaster/css/paster.png" width="16px" height="16px"/>。</li>
	</ul>
	<p>相关问题：</p>
	<ul style="list-style-type:decimal;">
		<li>WindowsXP如果无法识别数字证书，请先下载运行<a target="_blank" href="http://www.ncmem.com/download/rootsupd.rar">Windows证书补丁</a></li>
		<li>Windows7/Windows2003如果无法识别数字证书，请先下安装<a target="_blank" href="http://www.ncmem.com/download/startcom.cer">数字签名根证书</a></li>
		<li>如果无法安装组件请下载进行安装<a target="_blank" href="http://www.microsoft.com/downloads/details.aspx?FamilyID=9b2da534-3e03-4391-8a4d-074b9f2bc1bf%20">Microsoft Visual C++ 2008 Redistributable Package (x86)</a></li>
		<li>如果有任何问题或建议请向我们<a target="_blank" href="http://www.ncmem.com/blog/guestbook.asp">反馈</a></li>
	</ul>
	</div>
	<!--KindEditor编辑器-->
	<textarea id="content1" name="content1" style="width:700px;height:300px;visibility:hidden;"></textarea>
	<script type="text/javascript">
        var pasterMgr = new WordPasterManager();
		pasterMgr.Config["PostUrl"] = "http://localhost:88/asp/upload.asp";
		pasterMgr.Config["Cookie"] = 'ASPSESSIONID=<%=Session.SessionID%>';
		pasterMgr.Load();//

		var editor;
		KindEditor.ready(function(K)
		{
			editor = K.create('#content1'
			,
			{ items: [
			'source', '|', 'undo', 'redo', '|', 'preview', 'print', 'template', 'cut', 'copy', 'paste',
        'plainpaste', 'wordpaste', 'wordpaster', '|', 'justifyleft', 'justifycenter', 'justifyright',
        'justifyfull', 'insertorderedlist', 'insertunorderedlist', 'indent', 'outdent', 'subscript',
        'superscript', 'clearhtml', 'quickformat', 'selectall', '|', 'fullscreen', '/',
        'formatblock', 'fontname', 'fontsize', '|', 'forecolor', 'hilitecolor', 'bold',
        'italic', 'underline', 'strikethrough', 'lineheight', 'removeformat', '|', 'image',
        'flash', 'media', 'insertfile', 'table', 'hr', 'emoticons', 'map', 'code', 'pagebreak',
        'link', 'unlink', '|', 'about']
			, afterCreate: function()
				{
			    pasterMgr.SetEditor(this);
					var self = this;
					//自定义 Ctrl + V 事件。
					KindEditor.ctrl(self.edit.doc,'V',function(){pasterMgr.Paste();});
				}
			});
		});
	</script>
</body>
</html>