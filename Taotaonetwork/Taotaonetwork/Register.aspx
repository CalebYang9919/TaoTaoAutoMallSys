<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="TaotaonetworkUI.Register" ValidateRequest="false" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link rel="stylesheet" href="css/bootstrap.min.css" />
     <link href="toastr/build/toastr.min.css" rel="stylesheet" />
    <style type="text/css">
        * {
            margin: 0px;
            padding: 0px;
        }

        #textlist input {
            margin-top: 10px;
            display: inline;
        }

        #textlist span {
            display: none;
        }

        #labellist p {
            margin-top: 25px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div style="background-color: #E6E6E6;">
            <div class="container">
                <img src="images/Image/logo.png" style="margin-top: 23px; margin-bottom: 22px;" />
                <div style=" height: 500px;">
                    <div style="height: 40px; border: 1px solid #C0C0C0; background-color: #F75633; line-height: 40px;">
                        <span>欢迎注册</span>
                        <span style="float: right;">我已经注册，现在就<a href="Login.aspx">登录</a></span>
                    </div>
                    <div style="background-color: white;" class="row">
                        <div id="labellist" style="margin-top: 20px; padding-left: 90px; margin-left: 20px;" class="col-lg-2">
                            <p>用户名：</p>
                            <p>设置密码：</p>
                            <p>确认密码：</p>
                            <p>注册邮箱：</p>
                            <p>手机Phone：</p>
                            <p style="margin-top: 48px;">验证码：</p>
                        </div>
                        <div id="textlist" style="margin-top: 20px; margin-bottom: 20px;" class="col-lg-6">
                            <input id="username" type="text" style="width: 300px;" class="form-control" />
                            <span id="saa"><i class="glyphicon glyphicon-ok"></i></span><span id="sab"><i class="glyphicon glyphicon-remove"></i>请输入用户名</span> <span id="sac"><i class="glyphicon glyphicon-remove"></i>用户名已存在</span>
                            <input id="password" type="password" style="width: 300px;" class="form-control" />
                            <span id="sba"><i class="glyphicon glyphicon-ok"></i></span><span id="sbb"><i class="glyphicon glyphicon-remove"></i>请输入密码</span> <span id="sbc"><i class="glyphicon glyphicon-remove"></i>密码必须由6到12个字符组成</span>
                            <input id="pwd" type="password" style="width: 300px;" class="form-control" />
                            <span id="sca"><i class="glyphicon glyphicon-ok"></i></span><span id="scb"><i class="glyphicon glyphicon-remove"></i>密码输入不一致</span>
                            <input id="email" type="email" style="width: 300px;" class="form-control" />
                            <span id="sda"><i class="glyphicon glyphicon-ok"></i></span><span id="sdb"><i class="glyphicon glyphicon-remove"></i>请输入邮箱</span><span id="sdc"><i class="glyphicon glyphicon-remove"></i>请输入正确的邮箱格式</span>
                            <input id="mobile" type="tel" style="width: 300px;" class="form-control" maxlength="11" />
                            <span id="sea"><i class="glyphicon glyphicon-ok"></i></span><span id="seb"><i class="glyphicon glyphicon-remove"></i>请输入手机号码</span><span id="sec"><i class="glyphicon glyphicon-remove"></i>请输入正确的手机号码格式</span>
                            <p>
                                <input id="btnyzm" type="button" style="text-decoration-style: none;" onclick="fayzm(this)" value="发送验证码" /></p>
                            <input id="yzm" type="text" style="width: 250px;" class="form-control" />
                            <span id="sfa"><i class="glyphicon glyphicon-ok"></i></span><span id="sfb"><i class="glyphicon glyphicon-remove"></i>请输入验证码</span> <span id="sfc"><i class="glyphicon glyphicon-remove"></i>验证码输入不正确</span>
                        </div>
                        <div style="margin: 20px; height: 280px;" class="col-lg-2">
                            <img src="img/psds34083.jpg" style="width: 420px; margin-top: 60px; margin-left: -90px;" />
                        </div>
                        <input id="btnreg" type="button" style="margin-left: 140px; font-size: 20px; width: 400px; margin-bottom: 30px; color: red; background-color: #C0C0C0;" class="btn btn-default" value="立即注册" />
                    </div>
                </div>
            </div>
            <hr style="border: 1px solid #C0C0C0; margin-top: 50px;" />
            <div class="container" style="text-align: center; color: #9D9D9D;">
                <p>CopyRight©2007-2014Taotao Inc.All Rights Reserved 沪ICP备02110488号</p>
                <p>上海淘淘科技有限公司 版权所有 站长统计 服务邮箱 service@taotao.com</p>
            </div>
        </div>
    </form>
</body>
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
    <script src="toastr/build/toastr.min.js"></script>
<script type="text/javascript">

    var a = false;
    var b = false;
    var c = false;
    var d = false;
    var e = false;

    $("#username").focus(function () {
        $("#saa").hide();
        $("#sab").hide();
        $("#sac").hide();
    })

    $("#username").blur(function () {
        if ($("#username").val().trim() != "") {
            $.ajax({
                type: 'post',
                url: 'Register.aspx/isusername',
                async: false,
                contentType: "application/json;charset=utf-8",
                dataType: "json",
                data: JSON.stringify({ username: $("#username").val().trim() }),
                success: function (data) {
                    if (data.d) {
                        $("#saa").hide();
                        $("#sab").hide();
                        $("#sac").show();
                    } else {
                        $("#saa").show();
                        $("#sab").hide();
                        $("#sac").hide();
                        a = true;
                    }
                },
                error: function () {
                    alert('ERROR!');
                }
            });
        } else {
            $("#saa").hide();
            $("#sab").show();
            $("#sac").hide();
            a = false;
        }
    })

    $("#password").focus(function () {
        $("#sba").hide();
        $("#sbb").hide();
        $("#sbc").hide();
    })

    $("#password").blur(function () {
        if ($("#password").val().trim() != "") {
            if ($("#password").val().trim().length < 6 || $("#password").val().trim().length > 12) {
                $("#sba").hide();
                $("#sbb").hide();
                $("#sbc").show();
            } else {
                $("#sba").show();
                $("#sbb").hide();
                $("#sbc").hide();
                b = true;
            }
        } else {
            $("#sba").hide();
            $("#sbb").show();
            $("#sbc").hide();
            b = false;
        }
    })

    $("#pwd").focus(function () {
        $("#sca").hide();
        $("#scb").hide();
    })

    $("#pwd").blur(function () {
        if ($("#pwd").val().trim() != "") {
            if ($("#pwd").val().trim() == $("#password").val().trim()) {
                $("#sca").show();
                $("#scb").hide();
                c = true;
            } else {
                $("#sca").hide();
                $("#scb").show();
                c = false;
            }
        } else {
            $("#sca").hide();
            $("#scb").show();
            c = false;
        }
    })

    $("#email").focus(function () {
        $("#sda").hide();
        $("#sdb").hide();
        $("#sdc").hide();
    })

    $("#email").blur(function () {
        var email = /^[A-Za-z0-9\u4e00-\u9fa5]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$/;
        if ($("#email").val().trim() != "") {
            if (email.test($("#email").val().trim())) {
                $("#sda").show();
                $("#sdb").hide();
                $("#sdc").hide();
                d = true;
            } else {
                $("#sda").hide();
                $("#sdb").hide();
                $("#sdc").show();
                d = false;
            }
        } else {
            $("#sda").hide();
            $("#sdb").show();
            $("#sdc").hide();
            d = false;
        }
    })

    $("#mobile").focus(function () {
        $("#sea").hide();
        $("#seb").hide();
        $("#sec").hide();
    })

    $("#mobile").blur(function () {
        var mobile = /^(13[0-9]{9})|(18[0-9]{9})|(14[0-9]{9})|(17[0-9]{9})|(15[0-9]{9})$/;
        if ($("#mobile").val().trim() != "") {
            if (mobile.test($("#mobile").val().trim())) {
                $("#sea").show();
                $("#seb").hide();
                $("#sec").hide();
                e = true;
            } else {
                $("#sea").hide();
                $("#seb").hide();
                $("#sec").show();
                e = false;
            }
        } else {
            $("#sea").hide();
            $("#seb").show();
            $("#sec").hide();
            e = false;
        }
    })

    $("#yzm").focus(function () {
        $("#sfa").hide();
        $("#sfb").hide();
        $("#sfc").hide();
    })

    $("#yzm").blur(function () {
        if ($("#yzm").val().trim() != "") {
            if ($("#yzm").val().trim() != sessionStorage.getItem('yzm')) {
                $("#sfa").hide();
                $("#sfb").hide();
                $("#sfc").show();
            } else {
                $("#sfa").show();
                $("#sfb").hide();
                $("#sfc").hide();
            }
        } else {
            $("#sfa").hide();
            $("#sfb").show();
            $("#sfc").hide();
        }
    })



    function fayzm(obj) {
        var mobile = /^(13[0-9]{9})|(18[0-9]{9})|(14[0-9]{9})|(17[0-9]{9})|(15[0-9]{9})$/;
        if ($("#mobile").val().trim() != "") {
            if (mobile.test($("#mobile").val().trim())) {
                $("#sea").show();
                $("#seb").hide();
                $("#sec").hide();

                $.ajax({
                    type: 'post',
                    url: 'Register.aspx/yzm',
                    async: false,
                    contentType: "application/json;charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ tel: $("#mobile").val().trim() }),
                    success: function (data) {
                        sessionStorage.setItem('yzm', data.d);
                    },
                    error: function () {
                        alert('ERROR!');
                    }
                });
                window.setTimeout(refreshCount, 1000 * 60);
                var countdown = 60;
                var t = setInterval(function () {
                    if (countdown == 0) {
                        obj.value = "发送验证码";
                        countdown = 60;
                        obj.disabled = false;
                        clearInterval(t);
                    } else {
                        obj.disabled = true;
                        obj.value = "重新发送(" + countdown + ")";
                        countdown--;
                    }
                }, 1000);
            } else {
                $("#sea").hide();
                $("#seb").hide();
                $("#sec").show();
            }
        } else {
            $("#sea").hide();
            $("#seb").show();
            $("#sec").hide();
        }
    }

    $("#btnreg").click(function () {
        if (a && b && c && d && e && $("#yzm").val().trim() == sessionStorage.getItem('yzm') && $("#yzm").val().trim() != "") {
            $.ajax({
                type: 'post',
                url: 'Register.aspx/show',
                async: false,
                contentType: "application/json;charset=utf-8",
                dataType: "json",
                data: JSON.stringify({
                    username: $("#username").val().trim(),
                    pwd: $("#pwd").val().trim(),
                    email: $("#email").val().trim(),
                    mobile: $("#mobile").val().trim()
                }),
                success: function (data) {
                    if (data.d) {
                        alert("注册成功");
                        location.href = "Login.aspx";
                    } else {
                        $("#saa").hide();
                        $("#sab").hide();
                        $("#sac").show();
                    }
                },
                error: function () {
                    alert('ERROR!');
                }
            });
        }
        if ($("#username").val().trim() == "") {
            $("#saa").hide();
            $("#sab").show();
            $("#sac").hide();
        }
        if ($("#password").val().trim() == "") {
            $("#sba").hide();
            $("#sbb").show();
            $("#sbc").hide();
        }
        if ($("#pwd").val().trim() == "") {
            $("#sca").hide();
            $("#scb").show();
        }
        if ($("#email").val().trim() == "") {
            $("#sda").hide();
            $("#sdb").show();
            $("#sdc").hide();
        }
        if ($("#mobile").val().trim() == "") {
            $("#sea").hide();
            $("#seb").show();
            $("#sec").hide();
        }
        if ($("#yzm").val().trim() == "") {
            $("#sfa").hide();
            $("#sfb").show();
            $("#sfc").hide();
        }
        if ($("#yzm").val().trim() != sessionStorage.getItem('yzm') && $("#yzm").val().trim() != "") {
            $("#sfa").hide();
            $("#sfb").hide();
            $("#sfc").show();
        }
    })

    function refreshCount() {
        sessionStorage.setItem('yzm', "");
    }
</script>
</html>
