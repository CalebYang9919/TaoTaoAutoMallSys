<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="Taotaonetwork.Cart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="banner-top">
        <div class="header-bottom">
            <div class="content-wrapper">
                <div class="content-top">
                    <div class="box_wrapper">
                        <h3>我的购物车</h3>
                    </div>


                    <div class="text">


                        <section style="margin-top: 60px; margin-bottom: 80px; font-size: 16px;">
                            <div class="container" style="color: #5d5757; font-size: 14px; font-weight: 600;">
                                <!-- 如果购物车为空 -->
                                <div id="msgDiv" class="panel panel-default" style="display: none">
                                    <div class="panel-body">
                                        <strong style='font-size: 25px'>购物车里无商品!</strong><br />
                                        随便看看，优惠多多，赶紧抢购吧！
                                    </div>
                                </div>
                                <div class="row" id="Divmsg">

                                    <div class="col-lg-9 col-sm-8">



                                        <div id="cartContent">
                                            <table class="table table-striped">
                                                <thead>
                                                    <tr>
                                                        <th>
                                                            <input type="checkbox" onclick="checkedAll()" id="checkedAll" /></th>
                                                        <th style="width: 420px;">产品名称</th>
                                                        <th>数量</th>
                                                        <th>单价</th>
                                                        <th>合计价格</th>
                                                        <th></th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <asp:Repeater ID="Repeater1" runat="server">
                                                        <ItemTemplate>
                                                            <tr>
                                                                <td>
                                                                    <input type="checkbox" name="ids" onclick="checkedeqi(this)" pid='<%#Eval("productid") %>' /></td>
                                                                <td>
                                                                    <asp:Image ID="Image1" runat="server" ImageUrl='<%# "~/images/2011/"+Eval("ProductPic") %>' Style="width: 57px;" />
                                                                    <a href="javascript:void(0);" style="margin-left: 15px;"><%#Eval("productname")%></a>
                                                                </td>
                                                                <td>
                                                                    <input type="number" value='<%# Eval("quantity") %>' min="1" max="999" style="width: 50px;" name="qty" pid='<%#Eval("productid") %>' zprice='<%#Eval("ProductPrice")%>' /></td>
                                                                <td>￥<%#Eval("ProductPrice")%></td>
                                                                <td name='total_price' style="color: #f40;">￥<span><%# int.Parse(Eval("quantity").ToString())*int.Parse(Eval("ProductPrice").ToString())%></span></td>
                                                                <td><a href="javascript:void(0);" pid="<%#Eval("productid") %>" name="removeitem"><i class="glyphicon glyphicon-remove"></i></a></td>
                                                            </tr>
                                                        </ItemTemplate>
                                                    </asp:Repeater>
                                                </tbody>
                                            </table>

                                            <input type="button" id="removeall" class="btn btn-danger margin-top-20 pull-right noradius" value="清空购物车" />

                                            <div class="clearfix"></div>
                                        </div>

                                    </div>
                                    <div class="col-lg-3 col-sm-4" style="width: 17%; margin-left: 30px;">
                                        <div>
                                            <div>
                                                <div class="hideDiv">
                                                    <span class="clearfix"><span id="sumCart" class="pull-right" style="color: #f40;">￥0
                                                    </span>
                                                        <strong class="pull-left">商品总价:</strong>
                                                    </span><span class="clearfix"><span class="pull-right">包邮</span>
                                                        <span class="pull-left">物流费用:</span>
                                                    </span>
                                                    <hr />
                                                    <span class="clearfix"><span class="pull-right size-20" style="color: #f40;">￥0
                                                    </span>
                                                        <strong class="pull-left">合计金额:</strong>
                                                        <input type="hidden" id="sum" />
                                                    </span>
                                                    <hr />
                                                    <input type="button" id="payCart" class="btn btn-success margin-top-20 pull-right noradius" value="结算(0)" disabled="disabled" />
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- /CART -->
                            </div>
                        </section>



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
            if ("<%=show%>" == "False") {
                $("#msgDiv").show();
                $("#Divmsg").hide();
            }

            if ('<%=Session["username"]%>' == "") {
                location.href = "Login.aspx";
            }
            $("input[name='ids']:checkbox").prop('checked', false);
        })

        $("[name=qty]").bind('change', function () {
            $(this).parent().siblings("[name=total_price]").find("span").text($(this).attr("zprice") * $(this).val());

            if (!$("#payCart").prop("disabled")) {
                var sum = 0;
                for (var i = 0; i < $("input[name='ids']").length; i++) {
                    if ($("input[name='ids']").eq(i).is(':checked') == true) {
                        sum += Number($("input[name='ids']").eq(i).parent().siblings("[name=total_price]").find("span").text());
                        $(".size-20").text("￥" + sum);
                        $("#sumCart").text("￥" + sum);
                        $("#sum").val(sum);
                    }
                }
            }

        })


        $("[name=qty]").blur(function () {
            if ('<%=Session["username"]%>' == "") {
                location.href = "Login.aspx";
            } else {
                var num = $(this).val();
                var uid = '<%=Session["uid"]%>';
                var pid = $(this).attr("pid");

                $.ajax({ 
                    type: 'post',
                    url: 'Cart.aspx/UpdateNum',
                    async: false,
                    contentType: "application/json;charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({
                        num: num,
                        uid: uid,
                        pid: pid
                    }),
                    success: function (data) {
                    },
                    error: function (data) {
                        alert('ERROR!');
                    }
                });
            }
        })

        $("[name=removeitem]").click(function () {
            if ('<%=Session["username"]%>' == "") {
                location.href = "Login.aspx";
            } else {
                var uid = '<%=Session["uid"]%>';
                var pid = $(this).attr("pid");
                $(this).parent().parent().remove();
                $.ajax({
                    type: 'post',
                    url: 'Cart.aspx/Remove',
                    async: false,
                    contentType: "application/json;charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({
                        uid: uid,
                        pid: pid
                    }),
                    success: function (data) {
                        if ($("[name=qty]")[0] == undefined) {
                            $("#msgDiv").show();
                            $("#Divmsg").hide();
                        }
                    },
                    error: function (data) {
                        alert('ERROR!');
                    }
                });

                if (!$("#payCart").prop("disabled")) {
                    var sumPrice = $("#sum").val();
                    var price = $(this).parent().siblings("[name=total_price]").find("span").text();
                    var sum = Number(sumPrice) - Number(price);
                    $(".size-20").text("￥" + sum);
                    $("#sumCart").text("￥" + sum);
                    $("#payCart").val("结算(" + $("input[name='ids']:checked").length + ")");
                    $("#checkedAll").prop('checked', false);
                    if ($("input[name='ids']:checked").length != 0) {
                        $("#payCart").prop('disabled', false);
                    } else {
                        $("#payCart").prop('disabled', true);
                    }
                    $("#sum").val(sum);
                }
            }
        })

        $("#removeall").click(function () {
            if ('<%=Session["username"]%>' == "") {
                location.href = "Login.aspx";
            } else {
                var uid = '<%=Session["uid"]%>';
                $.ajax({
                    type: 'post',
                    url: 'Cart.aspx/RemoveAll',
                    async: false,
                    contentType: "application/json;charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({
                        uid: uid
                    }),
                    success: function (data) {
                        $("#msgDiv").show();
                        $("#Divmsg").hide();
                    },
                    error: function (data) {
                        alert('ERROR!');
                    }
                });
            }
        })

        $("#checkedAll").click(function () {
            if ($("#checkedAll").is(':checked') == true) {
                //全选
                $("input[name='ids']:checkbox").prop('checked', true);
                var sumPrice = 0;
                for (var i = 0; i < $("[name='total_price']").length; i++) {
                    sumPrice += Number($("[name=total_price]").eq(i).find("span").text());
                }
                $(".size-20").text("￥" + sumPrice);
                $("#sumCart").text("￥" + sumPrice);
                $("#payCart").val("结算(" + $("[name='total_price']").length + ")");
                $("#payCart").prop('disabled', false);
                $("#sum").val(sumPrice);
            } else {
                //取消全选
                $("input[name='ids']:checkbox").prop('checked', false);
                $(".size-20").text("￥" + 0);
                $("#sumCart").text("￥" + 0);
                $("#payCart").val("结算(" + 0 + ")");
                $("#payCart").prop('disabled', true);
                $("#sum").val(0);
            }
        })

        function checkedeqi(obj) {
            if ($(obj).is(':checked') == true) {
                var sumPrice = $("#sum").val();
                var price = $(obj).parent().siblings("[name=total_price]").find("span").text();
                var sum = Number(sumPrice) + Number(price);
                $(".size-20").text("￥" + sum);
                $("#sumCart").text("￥" + sum);
                $("#payCart").val("结算(" + $("input[name='ids']:checked").length + ")");
                if ($("input[name='ids']:checked").length == $("input[name='ids']").length) {
                    $("#checkedAll").prop('checked', true);
                }
                if ($("input[name='ids']:checked").length != 0) {
                    $("#payCart").prop('disabled', false);
                } else {
                    $("#payCart").prop('disabled', true);
                }
                $("#sum").val(sum);
            } else {
                var sumPrice = $("#sum").val();
                var price = $(obj).parent().siblings("[name=total_price]").find("span").text();
                var sum = Number(sumPrice) - Number(price);
                $(".size-20").text("￥" + sum);
                $("#sumCart").text("￥" + sum);
                $("#payCart").val("结算(" + $("input[name='ids']:checked").length + ")");
                $("#checkedAll").prop('checked', false);
                if ($("input[name='ids']:checked").length != 0) {
                    $("#payCart").prop('disabled', false);
                } else {
                    $("#payCart").prop('disabled', true);
                }
                $("#sum").val(sum);
            }
        }

        $("#payCart").click(function () {
            var strIds = new Array();
            for (var i = 0; i < $("input[name='ids']").length; i++) {
                if ($("input[name='ids']").eq(i).is(':checked') == true) {
                    strIds[strIds.length] = $("input[name='ids']").eq(i).attr("pid");
                }
            }
            location.href = "Pay.aspx?strIds=" + strIds;

        });
    </script>
</asp:Content>
