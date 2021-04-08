<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="LiJiPayment.aspx.cs" Inherits="Taotaonetwork.LiJiPayment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="banner-top">
        <div class="header-bottom">
            <div class="content-wrapper">
                <div class="content-top">
                    <div class="box_wrapper">
                        <h3>支付</h3>
                    </div>



                    <div class="text">

                        <h3 style="margin-left: 70px;">应付金额：<span style="color: #d0c9c9; font-size: 28px;">￥</span><span style="color: red; font-size: 28px;" name="prices"><asp:Label ID="Label1" runat="server" Text="Label"></asp:Label></span>
                        </h3>

                        <div style="margin-left: 70px; margin-top: 27px; margin-bottom: 60px;">
                            <input type="button" class="btn btn-success" id="zf" value="使用电子钱包支付" />
                        </div>
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
    <script>
        $(function () {
            if ('<%=Session["username"]%>' == "") {
                location.href = "Login.aspx";
            }
        })

        $("#zf").click(function () {
            var price = $("[name=prices]").text();
            var uid = '<%=Session["uid"]%>';
            $.ajax({
                type: 'post',
                url: 'LiJiPayment.aspx/Pay',
                async: false,
                contentType: "application/json;charset=utf-8",
                dataType: "json",
                data: JSON.stringify({
                    uid: uid,
                    price: price
                }),
                success: function (data) {
                    if (data.d) {
                        toastr.success("支付成功，2秒钟后跳转到我的订单!");
                        setTimeout(function () {
                            window.location.href = "MyOrders.aspx";
                        }, 2000);
                    } else {
                        toastr.warning("钱包余额不足！");
                    }
                },
                error: function (data) {
                    alert('ERROR!');
                }
            });
        })
    </script>
</asp:Content>
