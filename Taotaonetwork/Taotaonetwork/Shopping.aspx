<%@ Page Title="商场" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Shopping.aspx.cs" Inherits="Taotaonetwork.Shopping" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="banner-top">
        <div class="header-bottom">
            <div class="content-wrapper">
                <div class="content-top">
                    <div class="box_wrapper">
                        <span style="font-size: 22px;">&nbsp;&nbsp;&nbsp;欢迎来到淘淘商城！</span>
                    </div>
                    <div class="text">

                        <% if (!bool.Parse(Session["show"].ToString()))
                           {%>
                        <div class="alert alert-warning" role="alert">
                            <h3 style="color: red;">暂无相关商品！</h3>
                        </div>

                        <%}%>

                        <asp:Repeater ID="RepeaterSearch" runat="server">
                            <ItemTemplate>
                                <div class="grid_1_of_3 images_1_of_3" style="margin-left: 18px; width: 31.2%;">
                                    <div class="grid_1">
                                        <a href='Details.aspx?productid=<%#Eval("id") %>'>
                                            <asp:Image ID="Image1" runat="server" ImageUrl='<%# "~/images/2011/"+Eval("productpic") %>' title="continue reading" Style="width: 200px; height: 144px; margin: 0px auto;" /></a>
                                        <div class="grid_desc">
                                            <p class="title"><%# Eval("productname") %></p>
                                            <p class="title1">原厂品质保证，绝对值得拥有！</p>
                                            <div class="price" style="height: 19px;">
                                                <span class="reducedfrom">￥<%# Eval("productprice") %></span>
                                            </div>
                                            <div class="cart-button">
                                                <div class="cart">
                                                    <a href="javascript:void(0);" onclick="addCart(this)" pid='<%#Eval("id") %>'>
                                                        <img src="images/cart.png" alt="" style="margin-top: 20px;" /></a>
                                                </div>
                                                <a href='Details.aspx?productid=<%#Eval("id") %>'>
                                                    <input class="button" type="button" value="详情" /></a>
                                                <div class="clear"></div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="clear"></div>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>


                        <div class="clear"></div>
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

    <script type="text/javascript">
        function addCart(obj) {
            if ('<%=Session["username"]%>' == "") {
                toastr.error("请先登录！");
            } else {

                var uid = '<%=Session["uid"]%>';
                var pid = obj.getAttribute("pid");

                $.ajax({
                    type: 'post',
                    url: 'Cart.aspx/AddCart',
                    async: false,
                    contentType: "application/json;charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({
                        uid: uid,
                        pid: pid,
                        num: "1"
                    }),
                    success: function (data) {
                        toastr.success("加入购物车成功！");
                    },
                    error: function (data) {
                        alert('ERROR!');
                    }
                });


            }
        }
    </script>
</asp:Content>
