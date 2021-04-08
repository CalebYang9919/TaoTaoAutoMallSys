<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="Taotaonetwork.WebForm2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script type="text/javascript">
        $(function () {
            turnPics(); //index页面轮播
        });
        function turnPics() {

            //绑定事件
            $('.next').click(function () {
                next($li)
            })
            $('.previous').click(function () {
                prev($li)
            });

            function next($li) {
                index++;
                if (index >= $li.length) {
                    index = 0;
                    $li.eq(index).stop(true, true).fadeIn("slow").siblings().fadeOut("slow");
                } else {
                    $li.eq(index).stop(true, true).fadeIn("slow").siblings().fadeOut("slow");
                }
            }
            function prev($li) {
                index--;
                if (index >= 0) {
                    $li.eq(index).stop(true, true).fadeIn("slow").siblings().fadeOut("slow");
                } else {
                    index = 4;
                    $li.eq(index).stop(true, true).fadeIn("slow").siblings().fadeOut("slow");
                }
            }
            var index = 0; //播放图片的索引
            var stop = false; //手动/自动切换
            var $li = $("#slideshow").find(".slides li");
            var $div = $("#slideshow");
            setInterval(function () {
                if (stop) return;
                index++;
                if (index >= $li.length) {
                    index = 0;
                }
                $li.eq(index).stop(true, true).fadeIn("slow").siblings().fadeOut("slow");
            }, 3000);
            $div.mouseover(function () {
                stop = true;
                $li.eq(index).stop(true, true).fadeIn("slow").siblings().fadeOut("slow");
            }).mouseout(function () {
                stop = false;
            })
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="banner-top">
        <div class="header-bottom">
            <div class="header_bottom_right_images">
                <div id="slideshow">
                    <ul class="slides">

                        <asp:Repeater ID="Repeater4" runat="server">
                            <ItemTemplate>
                                <li><a href="ProductLists.aspx?ProductClassID=<%# Eval("classid") %>">
                                    <img src='images/Image/<%# Eval("urls") %>' alt="" /></a></li>
                            </ItemTemplate>
                        </asp:Repeater>
                        <%--<li><a href="#">

                            <img src="images/Image/banner1.jpg" alt="Marsa Alam underawter close up" /></a></li>
                        <li><a href="#">

                            <img src="images/Image/banner2.jpg" alt="Turrimetta Beach - Dawn" /></a></li>
                        <li><a href="#">

                            <img src="images/Image/banner3.jpg" alt="Power Station" /></a></li>
                        <li><a href="#">

                            <img src="images/Image/banner4.jpg" alt="Colors of Nature" /></a></li>
                        <li><a href="#">
                            <img src="images/Image/banner5.jpg" alt="Colors of Nature" /></a></li>--%>
                    </ul>
                    <span class="arrow previous" onclick=""></span>
                    <span class="arrow next"></span>
                </div>
                <div class="content-wrapper">
                    <div class="content-top">
                        <div class="box_wrapper">
                            <h1>新品展示&nbsp;&nbsp;<span style="color: red">NEW</span></h1>
                        </div>
                        <div class="text">
                            <asp:Repeater ID="Repeater1" runat="server">
                                <ItemTemplate>
                                    <div class="grid_1_of_3 images_1_of_3">
                                        <div class="grid_1">
                                            <a href="Details.aspx?productid=<%#Eval("id") %>" title="<%# Eval("ProductName") %>" alt="">
                                                <asp:Image ID="Image1" runat="server" ImageUrl='<%#"~/images/2011/"+Eval("ProductPic") %>' Height="144px" Width="259px" />
                                            </a>
                                            <div class="grid_desc">
                                                <p class="title"><%# Eval("ProductName") %></p>
                                                <p class="title1">
                                                    <asp:Label ID="Label2" runat="server" Text="原厂品质保证，绝对值得拥有！"></asp:Label>
                                                </p>
                                                <div class="price" style="height: 40px;">
                                                    <span class="reducedfrom">&yen;<%# Eval("ProductPrice") %></span>
                                                </div>
                                                <div class="cart-button">
                                                    <div class="cart">
                                                        <a href="#" onclick="addCart(this)" pid='<%#Eval("id") %>'>
                                                            <img src="images/cart.png" alt="" /></a>
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
                    <div class="content-top">
                        <div class="box_wrapper">
                            <h1>热卖商品&nbsp;&nbsp;<span style="color: red">HOT</span></h1>
                        </div>
                        <div class="text">
                            <asp:Repeater ID="Repeater2" runat="server">
                                <ItemTemplate>
                                    <div class="grid_1_of_3 images_1_of_3">
                                        <div class="grid_1">
                                            <a href="Details.aspx?productid=<%#Eval("id") %>" title="<%# Eval("ProductName") %>" alt="">
                                                <asp:Image ID="Image2" runat="server" ImageUrl='<%#"~/images/2011/"+Eval("ProductPic") %>' Height="144px" Width="259px" />
                                            </a>
                                            <div class="grid_desc">
                                                <p class="title"><%# Eval("ProductName") %></p>
                                                <p class="title1">
                                                    <asp:Label ID="Label1" runat="server" Text="原厂品质保证，绝对值得拥有！"></asp:Label>
                                                </p>
                                                <div class="price" style="height: 40px;">
                                                    <span class="reducedfrom">&yen;<%# Eval("ProductPrice") %></span>
                                                </div>
                                                <div class="cart-button">
                                                    <div class="cart">
                                                        <a href="#" onclick="addCart(this)" pid='<%#Eval("id") %>'>
                                                            <img src="images/cart.png" alt="" /></a>
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
            </div>
            <div class="header-para">
                <div class="categories">
                    <div class="list-categories">
                        <asp:Repeater ID="Repeater3" runat="server">
                            <ItemTemplate>
                                <div class="first-list">
                                    <div class="div_2"><a style="font-size: 20PX;" href="ProductLists.aspx?ProductClassID=<%# Eval("ClassID") %>"><%# Eval("ClassName") %></a></div>
                                    <div class="div_img">
                                        <asp:Image ID="Image3" runat="server" ImageUrl='<%#"~/images/Image/"+Eval("ClassName")+".png" %>' Height="39px" Width="60px" />
                                    </div>
                                    <div class="clear"></div>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                    <div class="box">
                        <div class="box-heading">
                            <h1><a href="Cart.aspx">购物车:&nbsp;</a></h1>
                        </div>
                        <div class="box-content">
                            你现在购物车有&nbsp;<strong> 0 件商品</strong>
                        </div>
                    </div>
                    <div class="clear"></div>
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
        //搜索
        $("#serach").click(function () {
            if ($("#productname").val().trim() != "") {
                location.href = "SearchProduct.aspx?name=" + $("#productname").val().trim();
            }
        });


        //添加到购物车
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
