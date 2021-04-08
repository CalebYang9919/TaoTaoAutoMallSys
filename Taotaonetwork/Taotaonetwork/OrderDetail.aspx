<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="OrderDetail.aspx.cs" Inherits="Taotaonetwork.WebForm3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="description" content="" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta name="robots" content="all,follow" />

    <title>订单详情页</title>
    <link rel="shortcut icon" href="img/logo.ico" />
    <script src="js/js/bootstrap.min.js"></script>
    <script src="js/js/jquery.min.js"></script>
    <script src="js/js/mychart.js"></script>
    <script src="js/js/popper.min.js"></script>
    <!-- global stylesheets -->
    <link href="https://fonts.googleapis.com/css?family=Roboto+Condensed" rel="stylesheet" />
    <link href="css/css/bootstrap.min.css" rel="stylesheet" />
    <link href="css/css/style.default.css" rel="stylesheet" />
    <!-- Core stylesheets -->
    <link href="css/css/style.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="banner-top">
        <div class="header-bottom">
            <div class="content-wrapper">
                <div class="content-top">
                    <div class="box_wrapper">
                        <h2>订单详情 &nbsp;&nbsp; &nbsp; 
                            <% if (show)
                               {%>
                            <font style="font-size: 19px; color: #6d6868;">等待买家付款&nbsp;&nbsp; &nbsp;剩余<asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>小时<asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>分自动关闭</font>
                            <%} %>
                        </h2>
                    </div>


                    <div class="text">


                        <asp:Repeater ID="Repeater1" runat="server">
                            <ItemTemplate>
                                <div style="padding: 30px 40px;">
                                    <h3>订单编号：<%# Eval("orderid") %></h3>
                                    <p>订单状态：<%# Eval("ordertype") %></p>
                                    <p>联系人姓名：<%# Eval("name") %></p>
                                    <p>联系人电话：<%# Eval("mobile") %></p>
                                    <p>送货地址：<%# Eval("address") %></p>
                                    <p>订单金额：&yen;<%# Eval("productprice") %></p>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                        <asp:Repeater ID="Repeater2" runat="server">
                            <HeaderTemplate>
                                <div style="padding: 20px 20px;">
                                    <table class="table">
                                        <tr style="background-color: #f3eded; font-weight: 900; font-size: 20px">
                                            <td>商品</td>
                                            <td>单价</td>
                                            <td>数量</td>
                                            <td>合计金额</td>
                                        </tr>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <tr>
                                    <td>
                                        <a href="Details.aspx?productid=<%#Eval("productid") %>">
                                            <asp:Image ID="Image1" runat="server" ImageUrl='<%#"~/images/2011/"+Eval("productpic") %>' Style="height: 60px;" /><%# Eval("productname") %></td>
                                    </a>
                <td>￥<%# Eval("productprice") %></td>
                                    <td><%# Eval("quantity") %></td>
                                    <td>￥<%# int.Parse(Eval("quantity").ToString())*int.Parse(Eval("ProductPrice").ToString())%></td>
                                </tr>

                            </ItemTemplate>
                            <FooterTemplate>
                                </table>
            </div>
                            </FooterTemplate>
                        </asp:Repeater>
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
    </div>
</asp:Content>
