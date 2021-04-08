<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="UserInfo.aspx.cs" Inherits="Taotaonetwork.UserInfo1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="js/js/bootstrap.min.js"></script>
    <script src="js/js/jquery.min.js"></script>
    <script src="js/js/mychart.js"></script>
    <script src="js/js/popper.min.js"></script>
    <link href="css/css/bootstrap.min.css" rel="stylesheet" />
    <link href="css/css/style.css" rel="stylesheet" />
    <link href="css/css/style.default.css" rel="stylesheet" />

    <title>个人信息页面 </title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="banner-top">
        <div class="header-bottom">
            <div class="content-wrapper">
                <div class="content-top">
                    <div class="box_wrapper">
                        <h2>个人信息页面</h2>
                    </div>
                    <div class="text" style="margin-top: 40px;">
                        用户名：<%--<div class="clear"></div>--%><asp:TextBox ID="TextBox1" runat="server" class="form-control" Width="60%"></asp:TextBox>
                        <br />
                        <br />
                        邮箱：<asp:TextBox ID="TextBox2" runat="server" class="form-control" Width="60%"></asp:TextBox>
                        <br />
                        <br />
                        手机号：<asp:TextBox ID="TextBox3" runat="server" class="form-control" Width="60%"></asp:TextBox>
                        <br />
                        <br />
                        头像：
                        <asp:Image ID="Image1" runat="server" Height="165px" Width="166px" />
                        <asp:FileUpload ID="FileUpload1" runat="server" OnDataBinding="FileUpload1_DataBinding" OnDisposed="FileUpload1_Disposed" />
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        
                        <br />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <br />
                        <br />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Button ID="Button2" runat="server" Text="保存信息" OnClick="Button2_Click" class="btn btn-success" />
                    </div>
                </div>
            </div>

            <div class="clear"></div>
            
        </div>
    </div>
</asp:Content>
