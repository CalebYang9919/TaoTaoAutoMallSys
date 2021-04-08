<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MyOrders.aspx.cs" Inherits="Taotaonetwork.MyOrders" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="banner-top">
        <div class="header-bottom">
            <div class="content-wrapper">
                <div class="content-top">
                    <div class="box_wrapper">
                        <h2>我的订单</h2>
                    </div>


                    <div class="text">

                        <input type="button" class="btn btn-success" data-toggle="collapse" id="a"
                            data-target="#demo1" style="margin-bottom: 35px;" value="全部订单" />
                        <input type="button" class="btn btn-success" data-toggle="collapse" id="b"
                            data-target="#demo2" style="margin-bottom: 35px;" value="未支付" />
                        <input type="button" class="btn btn-success" data-toggle="collapse" id="c"
                            data-target="#demo3" style="margin-bottom: 35px;" value="待发货" />
                        <input type="button" class="btn btn-success" data-toggle="collapse" id="d"
                            data-target="#demo4" style="margin-bottom: 35px;" value="待收货" />



                        <div id="demo1" class="collapse in">
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th>订单编号</th>
                                        <th>联系人姓名</th>
                                        <th>联系人电话</th>
                                        <th>订单状态</th>
                                        <th>订单金额</th>
                                        <th></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <asp:Repeater ID="Repeater1" runat="server">
                                        <ItemTemplate>
                                            <tr>
                                                <td><a href='OrderDetail.aspx?orderid=<%# Eval("orderid") %>'><%# Eval("orderid") %></a></td>
                                                <td><%# Eval("name") %></td>
                                                <td><%# Eval("mobile") %></td>
                                                <td><%# Eval("ordertype") %></td>
                                                <td>￥<%# Eval("productprice") %></td>
                                                <td><a onclick="payment(this)" oid='<%# Eval("orderid") %>' price='<%# Eval("productprice") %>'><%# Eval("ordertype").ToString() == "未支付" ? "去支付" : "" %>
                                                    <%# Eval("ordertype").ToString() == "已发货" ? "签收" : "" %></a>
                                                </td>
                                            </tr>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </tbody>
                            </table>

                             <% if (showa)
                               {%>
                            <div style="font-size: 26px; color: #858282; margin-left: 400px; margin-bottom: 100px; margin-top: 100px;">
                                <img src="img/no.png" />您还没有相关订单！
                            </div>
                            <%} %>

                        </div>



                        <div id="demo2" class="collapse in">
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th>订单编号</th>
                                        <th>联系人姓名</th>
                                        <th>联系人电话</th>
                                        <th>订单状态</th>
                                        <th>订单金额</th>
                                        <th></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <asp:Repeater ID="Repeater2" runat="server">
                                        <ItemTemplate>
                                            <tr>
                                                <td><a href='OrderDetail.aspx?orderid=<%# Eval("orderid") %>'><%# Eval("orderid") %></a></td>
                                                <td><%# Eval("name") %></td>
                                                <td><%# Eval("mobile") %></td>
                                                <td><%# Eval("ordertype") %></td>
                                                <td>￥<%# Eval("productprice") %></td>
                                                <td><a onclick="payment(this)" oid='<%# Eval("orderid") %>' price='<%# Eval("productprice") %>'><%# Eval("ordertype").ToString() == "未支付" ? "去支付" : "" %>
                                                    <%# Eval("ordertype").ToString() == "已发货" ? "签收" : "" %></a>
                                                </td>
                                            </tr>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </tbody>
                            </table>

                             <% if (showb)
                               {%>
                            <div style="font-size: 26px; color: #858282; margin-left: 400px; margin-bottom: 100px; margin-top: 100px;">
                                <img src="img/no.png" />您还没有相关订单！
                            </div>
                            <%} %>

                        </div>
                        <div id="demo3" class="collapse in">
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th>订单编号</th>
                                        <th>联系人姓名</th>
                                        <th>联系人电话</th>
                                        <th>订单状态</th>
                                        <th>订单金额</th>
                                        <th></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <asp:Repeater ID="Repeater3" runat="server">
                                        <ItemTemplate>
                                            <tr>
                                                <td><a href='OrderDetail.aspx?orderid=<%# Eval("orderid") %>'><%# Eval("orderid") %></a></td>
                                                <td><%# Eval("name") %></td>
                                                <td><%# Eval("mobile") %></td>
                                                <td><%# Eval("ordertype") %></td>
                                                <td>￥<%# Eval("productprice") %></td>
                                                <td><a onclick="payment(this)" oid='<%# Eval("orderid") %>'price='<%# Eval("productprice") %>'><%# Eval("ordertype").ToString() == "未支付" ? "去支付" : "" %>
                                                    <%# Eval("ordertype").ToString() == "已发货" ? "签收" : "" %></a>
                                                </td>
                                            </tr>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </tbody>
                            </table>
                             <% if (showc)
                               {%>
                            <div style="font-size: 26px; color: #858282; margin-left: 400px; margin-bottom: 100px; margin-top: 100px;">
                                <img src="img/no.png" />您还没有相关订单！
                            </div>
                            <%} %>

                        </div>

                        <div id="demo4" class="collapse in">
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th>订单编号</th>
                                        <th>联系人姓名</th>
                                        <th>联系人电话</th>
                                        <th>订单状态</th>
                                        <th>订单金额</th>
                                        <th></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <asp:Repeater ID="Repeater4" runat="server">
                                        <ItemTemplate>
                                            <tr>
                                                <td><a href='OrderDetail.aspx?orderid=<%# Eval("orderid") %>'><%# Eval("orderid") %></a></td>
                                                <td><%# Eval("name") %></td>
                                                <td><%# Eval("mobile") %></td>
                                                <td><%# Eval("ordertype") %></td>
                                                <td>￥<%# Eval("productprice") %></td>
                                                <td><a onclick="payment(this)" oid='<%# Eval("orderid") %>' price='<%# Eval("productprice") %>'><%# Eval("ordertype").ToString() == "未支付" ? "去支付" : "" %>
                                                    <%# Eval("ordertype").ToString() == "已发货" ? "签收" : "" %></a>
                                                </td>
                                            </tr>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </tbody>
                            </table>

                            <% if (showd)
                               {%>
                            <div style="font-size: 26px; color: #858282; margin-left: 400px; margin-bottom: 100px; margin-top: 100px;">
                                <img src="img/no.png" />您还没有相关订单！
                            </div>
                            <%} %>
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

    <script type="text/javascript">
        $(function () {
            $('#demo1').collapse('show');
            $('#demo2').collapse('hide');
            $('#demo3').collapse('hide');
            $('#demo4').collapse('hide');
        })
        $(function () {
            $('#demo1').on('show.bs.collapse', function () {
                $('#demo2').collapse('hide');
                $('#demo3').collapse('hide');
                $('#demo4').collapse('hide');
            })
        });
        $(function () {
            $('#demo2').on('show.bs.collapse', function () {
                $('#demo1').collapse('hide');
                $('#demo3').collapse('hide');
                $('#demo4').collapse('hide');
            })
        });
        $(function () {
            $('#demo3').on('show.bs.collapse', function () {
                $('#demo2').collapse('hide');
                $('#demo1').collapse('hide');
                $('#demo4').collapse('hide');
            })
        });
        $(function () {
            $('#demo4').on('show.bs.collapse', function () {
                $('#demo2').collapse('hide');
                $('#demo3').collapse('hide');
                $('#demo1').collapse('hide');
            })
        });

        function payment(obj) {
            var orderid = $(obj).attr("oid");
            var price = $(obj).attr("price");
            var a = $(obj).text().trim();
            if ($(obj).text().trim() == "去支付") {
                location.href = "QuPay.aspx?orderid=" + orderid + "&price=" + price;
            }
            if ($(obj).text().trim() == "签收") {
                $.ajax({
                    type: 'post',
                    url: 'MyOrders.aspx/Qs',
                    async: false,
                    contentType: "application/json;charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({
                        orderid: orderid
                    }),
                    success: function (data) {
                        if (data.d) {
                            toastr.success("签收成功!");
                            $(obj).text("");
                            $(obj).parent().prev().prev().text("已签收");
                        }
                    },
                    error: function (data) {
                        alert('ERROR!');
                    }
                });
            }
        }

    </script>

</asp:Content>
