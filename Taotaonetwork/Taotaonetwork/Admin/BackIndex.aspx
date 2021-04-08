<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BackIndex.aspx.cs" Inherits="Taotaonetwork.Admin.BackIndex" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>后台登陆</title>
    <link href="css/main.css" rel="stylesheet" type="text/css" />
    <link href="css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="css/font-icon-style.css">
    <link rel="stylesheet" href="css/style.default.css">
    <link href="js/toastr/toastr.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="js/alert/sweet-alert.css" />
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div class="login">
                <div class="box png">
                    <div class="logo png"></div>
                    <div class="input">
                        <div class="log">
                            <div class="name">
                                <label>用户名</label><input type="text" class="form-control" id="value_1" placeholder="用户名" name="value_1" tabindex="1">
                            </div>
                            <div class="pwd">
                                <label>密　码</label><input type="password" class="form-control" id="value_2" placeholder="密码" name="value_2" tabindex="2">
                                <input type="button" class="submit" tabindex="3" value="登录" onclick="login()">
                                <div class="check"></div>
                            </div>
                            <div class="tip"></div>
                        </div>
                    </div>
                </div>
                <div class="air-balloon ab-1 png"></div>
                <div class="air-balloon ab-2 png"></div>
                <div class="footer"></div>
            </div>
            <script src="js/jquery.min.js"></script>
            <script type="text/javascript" src="../js/bootstrap.min.js"></script>
            <script type="text/javascript" src="js/fun.base.js"></script>
            <script type="text/javascript" src="js/scripts.js"></script>
            <script src="js/front.js"></script>
            <script src="js/alert/sweet-alert.min.js"></script>
            <script src="js/toastr/toastr.min.js"></script>

            <script type="text/javascript">
                function login() {
                    var username = $("#value_1").val().trim();
                    var paw = $("#value_2").val().trim();
                    if (username == "") {
                        toastr.error("用户名不能为空");
                    }
                else if( paw == ""){
                    toastr.error("密码不能为空");
                } else {
                    $.ajax({
                        type: 'post',
                        url: 'BackIndex.aspx/logins',
                        async: true,
                        contentType: "application/json;charset=utf-8",
                        dataType: "json",
                        data: JSON.stringify({ username: username, paw: paw }),
                        success: function (data) {
                            if (data.d)
                            {
                                sessionStorage["username"] = username;
                                window.location.href = "UserControl.aspx";
                            }
                            else {
                                toastr.error("登陆失败，用户名或密码错误！");
                            }
                            
                            //toastr.success("登陆成功");
                            //window.location.reload();
                        },
                    });
                }
                }


            </script>


            <!--[if IE 6]>
<script src="js/DD_belatedPNG.js" type="text/javascript"></script>
<script>DD_belatedPNG.fix('.png')</script>
<![endif]-->
            <%--<div style="text-align: center; margin: 50px 0; font: normal 14px/24px 'MicroSoft YaHei';">
                <p>适用浏览器：360、FireFox、Chrome、Safari、Opera、傲游、搜狗、世界之窗. 不支持IE8及以下浏览器。</p>
                <p>More Templates <a href="http://www.cssmoban.com/" target="_blank" title="模板之家">模板之家</a> - Collect from <a href="http://www.cssmoban.com/" title="网页模板" target="_blank">网页模板</a></p>
            </div>--%>
        </div>
    </form>
</body>
</html>
