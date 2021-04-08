<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ChangePassWord.aspx.cs" Inherits="Taotaonetwork.ChangePassWord" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

     <script src="js/js/bootstrap.min.js"></script>
    <script src="js/js/jquery.min.js"></script>
    <script src="js/js/mychart.js"></script>
    <script src="js/js/popper.min.js"></script>
    <link href="css/css/bootstrap.min.css" rel="stylesheet" />
    <link href="css/css/style.css" rel="stylesheet" />
    <link href="css/css/style.default.css" rel="stylesheet" />

    <title>修改密码页面 </title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="banner-top">
        <div class="header-bottom">
            <div class="content-wrapper">
                <div class="content-top">
                    <div class="box_wrapper">
                        <h2>修改密码页面</h2>
                    </div>


                    <div class="text" style="margin-top:40px;">
                        当前密码：<%--<div class="clear"></div>--%><asp:TextBox ID="TextBox1"  TextMode="Password" runat="server" class="form-control" Width="60%"></asp:TextBox>
                        <br />
                        <br />
                        新密码：<asp:TextBox ID="TextBox2" runat="server" TextMode="Password" class="form-control" Width="60%"></asp:TextBox>
                        <br />
                        <br />
                        确认新密码：<asp:TextBox ID="TextBox3" runat="server" TextMode="Password" class="form-control" Width="60%"></asp:TextBox>
                        <br />
                     

                        <asp:Button ID="Button2" runat="server" Text="确认修改" OnClick="Button2_Click" class="btn btn-success"  />
                    </div>
                </div>
            </div>

            <div class="clear"></div>
            <%--<div class="footer-bottom">
                <div class="copy">
                    <p>CopyRight©2007-2014Taotao Inc.All Rights Reserved 沪ICP备02110488号</p>
                </div>
            </div>--%>
        </div>
    </div>
</asp:Content>
