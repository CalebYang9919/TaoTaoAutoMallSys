<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Taotaonetwork.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>淘淘网登录</title>
    <link rel="stylesheet" href="css/bootstrap.min.css" />
</head>
<body>
    <form id="form1" runat="server">
    <div  style="background-color:#E6E6E6;">
        
    <div class="container">
		<img src="images/Image/logo.png" style="margin-top: 23px; margin-bottom: 22px;">
		<div style="border:1px solid #C0C0C0;height:400px;">
			<div style="height:40px;border:1px solid #C0C0C0;background-color:#F75633"></div>
			
            <div  style="background-color:white;" class="row">
			<div style="margin:20px;padding:20px;" class="col-lg-6" >
				<label>*用户名：</label>
                <asp:TextBox ID="TextBox1" runat="server" style="width:400px;" class="form-control"></asp:TextBox>
				<%--<input type="text" style="width:400px;" class="form-control">--%>
				<label style="margin-top:30px;">*密码：</label>
                <asp:TextBox ID="TextBox2" runat="server"  style="width:400px;" class="form-control" TextMode="Password"></asp:TextBox>
				<%--<input type="password" style="width:400px;" class="form-control">--%>
                <asp:Button ID="Button1" runat="server" Text="登录" style="margin-top:60px;font-size:20px;width:400px;color:red;background-color:#C0C0C0;" class="btn btn-default" OnClick="Button1_Click"/>
				<%--<input type="button" style="margin-top:60px;font-size:20px;width:400px;" class="btn btn-success" value="登录">--%>
			</div>
			<div class="col-lg-1" style="border:1px solid white;height:300px;margin-top:20px;">
				<div style="border-left:1px solid #F75633;width:1px;height:270px;margin-top:30px;"></div>
			</div>
			<div style="margin:20px;" class="col-lg-4">
				<h4 style="font-weight:900;font-size:20px;">还不是淘淘汽配商场用户？</h4>
				<p>现在免费注册成为淘淘汽配商场用户，变能立刻享受便宜又放心的购物乐趣。</p>
				
                <asp:Button ID="Button2" runat="server" Text="注册新用户" style="margin:40px 90px;font-size:20px;width:150px;color:red;background-color:#C0C0C0;" class="btn btn-default" OnClick="Button2_Click"/>
<%--				<input type="button" style="margin:40px 90px;font-size:20px;width:150px;" class="btn btn-success" value="注册新用户">--%>
			<hr style="margin-top:0px;"/>
			<img src="img/wuyihuodong.png"> 
			</div>
</div>

		</div>
		</div>
		
		<hr style="border:1px solid #C0C0C0;margin-top:50px;"/>
		<div class="container" style="text-align:center;color:#9D9D9D;">
			<p >CopyRight©2007-2014Taotao Inc.All Rights Reserved 沪ICP备02110488号</p>
			<p>上海淘淘科技有限公司 版权所有 站长统计 服务邮箱 service@taotao.com</p>
		</div>
    </div>
    </form>
</body>
    <script type="text/javascript" src="js/jquery.min.js" ></script>
	<script type="text/javascript" src="js/bootstrap.min.js" ></script>
</html>
