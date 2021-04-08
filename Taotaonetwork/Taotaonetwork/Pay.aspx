    <%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Pay.aspx.cs" Inherits="Taotaonetwork.Pay" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/cssreset-min.css" rel="stylesheet" />
    <style type="text/css">
        .pstylea {
            color: #c3b7b7;
            font-size: 14px;
            font-weight: 700;
        }

        .pstyleb {
            color: grey;
            font-size: 21px;
            font-weight: 700;
        }

        .pstylec {
            color: #3c3434;
            font-size: 14px;
            font-weight: 700;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="banner-top">
        <div class="header-bottom">
            <div class="content-wrapper">
                <div class="content-top">
                    <div class="box_wrapper">
                        <h3 style="font-size: 24px;">确认订单</h3>
                    </div>



                    <div class="text">


                        <section style="margin-top: 35px; margin-bottom: 80px; font-size: 16px;">
                            <div class="container pstylec">
                                <!-- 如果购物车为空 -->
                                <div class="row" id="Divmsg">

                                    <div class="col-lg-12 col-sm-12">
                                        <h3 style='font-size: 18px; display: inline-block;'>确认收货地址</h3>
                                        <a style="margin-left: 30px; color: #8e8e8e;" data-toggle="modal" data-target="#myModal">修改该地址</a>
                                        <a style="margin-left: 30px; color: #8e8e8e;" data-toggle="modal" data-target="#myModa2">添加收货地址</a>
                                        <hr style="margin-top: 0px; margin-bottom: 20px; border: 0; border-top: 2px solid #c5b8b8;" />
                                        <asp:Repeater ID="Repeater2" runat="server">
                                            <ItemTemplate>
                                                <p>
                                                    <input type="radio" name="rd" ischecked='<%#Eval("contact_flag")%>' cid='<%#Eval("id")%>' />
                                                    <span name="addressa"><font name="province"><%#Eval("province")%></font> <font name="city"><%#Eval("city")%></font> <font name="area"><%#Eval("area")%></font> <font name="town"><%#Eval("town")%></font> <font name="address"><%#Eval("address")%></font></span>（<span name="namea"><%#Eval("name")%></span> 收）<span name="mobilea"><%#Eval("mobile")%></span>
                                                </p>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                        <br />
                                        <br />
                                        <h3 style='font-size: 18px'>确认订单信息</h3>

                                        <div id="cartContent">
                                            <table class="table table-striped">
                                                <thead>
                                                    <tr>
                                                        <th style="width: 420px;">产品名称</th>
                                                        <th>数量</th>
                                                        <th>单价</th>
                                                        <th>合计价格</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <asp:Repeater ID="Repeater1" runat="server">
                                                        <ItemTemplate>
                                                            <tr>
                                                                <td>
                                                                    <asp:Image ID="Image1" runat="server" ImageUrl='<%# "~/images/2011/"+Eval("ProductPic") %>' Style="width: 57px;" />
                                                                    <%#Eval("productname")%>
                                                                </td>
                                                                <td>
                                                                    <%# Eval("quantity") %>
                                                                </td>
                                                                <td>￥<span><%#Eval("ProductPrice")%></span>
                                                                </td>
                                                                <td name='total_price'>￥<span name="price"><%# int.Parse(Eval("quantity").ToString())*int.Parse(Eval("ProductPrice").ToString())%></span></td>
                                                            </tr>
                                                        </ItemTemplate>
                                                    </asp:Repeater>
                                                </tbody>
                                            </table>
                                            <div class="clearfix"></div>
                                        </div>
                                        <br />
                                        <div style="display: inline-block; border: 1px solid #f40; width: 410px; height: 150px;" class="pull-right">
                                            <div style="border: 4px solid #ffe8e8; min-width: 230px; padding: 10px 10px 10px 20px; width: 408px; height: 148px;">
                                                <p class="pull-right"><span>实付款：</span><span style="color: #d0c9c9; font-size: 28px;">￥</span><span style="color: red; font-size: 28px;" name="prices">1000</span></p>
                                                <p class="pull-right" id="addressb">
                                                    寄送至：<span style="font-size: 13px; font-weight: 500;"><%--湖南省 长沙市 长沙县 湘龙街道 水渡河路100号湖南工程职业技术学院--%></span>
                                                </p>
                                                <p class="pull-right" id="namemobile">
                                                    收货人：<span style="font-size: 13px; font-weight: 500;"><%--蒋小东17673348878--%></span>
                                                </p>
                                            </div>
                                        </div>
                                    </div>
                                    <input type="button" value="提交订单" class="pull-right btn btn-success" style="margin-right: 16px;" id="pay" />
                                    <a href="Cart.aspx" class="pull-right">
                                        <input type="button" value="返回购物车" class="pull-right btn btn-success" style="margin-right: 16px;" /></a>
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


    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        &times;
                    </button>
                    <h4 class="modal-title" id="myModalLabel">修改收货地址
                    </h4>
                </div>
                <div class="modal-body">
                    <div id="demo3" class="citys">
                        <p>
                            地址信息:
                            <select id="provincea" name="province" style="height: 25px;"></select>
                            <select id="citya" name="city" style="height: 25px;"></select>
                            <select id="areaa" name="area" style="height: 25px;"></select>
                            <select id="towna" name="town" style="height: 25px;"></select>
                        </p>
                     </div>
                    <div>
                         <br />
                        <p>
                            详细地址:
                            <input type="text" id="xxdz" class="form-control" />
                        </p>
                        <br />
                        <p>
                            收货人姓名:
                            <input type="text" id="xm" class="form-control"/>
                        </p>
                         <br />
                        <p>
                            手机号码:
                            <input type="tel" id="mobile" class="form-control" maxlength="11"/>
                        </p>
                         <br />
                    </div>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">
                        关闭
                    </button>
                    <button type="button" class="btn btn-primary" id="update">
                        提交更改
                    </button>
                </div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal -->
    </div>
   

    <div class="modal fade" id="myModa2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        &times;
                    </button>
                    <h4 class="modal-title" id="myModalLabe2">添加收货地址
                    </h4>
                </div>
                <div class="modal-body">
                    <div id="demo4" class="citys">
                        <p>
                            地址信息:
                            <select id="provinceb" name="province" style="height: 25px;"></select>
                            <select id="cityb" name="city" style="height: 25px;"></select>
                            <select id="areab" name="area" style="height: 25px;"></select>
                            <select id="townb"  name="town" style="height: 25px;"></select>
                        </p>
                     </div>
                    <div>
                         <br />
                        <p>
                            详细地址:
                            <input type="text" id="Text1" class="form-control" />
                        </p>
                        <br />
                        <p>
                            收货人姓名:
                            <input type="text" id="Text2" class="form-control"/>
                        </p>
                         <br />
                        <p>
                            手机号码:
                            <input type="tel" id="Tel1" class="form-control" maxlength="11"/>
                        </p>
                         <br />
                    </div>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">
                        关闭
                    </button>
                    <button type="button" class="btn btn-primary" id="add">
                        添加
                    </button>
                </div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal -->
    </div>

    <script>
        $(function () {

            if ('<%=Session["username"]%>' == "") {
                location.href = "Login.aspx";
            }

            $("[name = rd]").parent().addClass("pstylea");
            for (var i = 0; i < $("[name = rd]").length; i++) {
                if ($("[name = rd]").eq(i).attr("ischecked") == '1') {
                    $("[name = rd]").eq(i).prop('checked', 'checked');
                }
            }
            for (var i = 0; i < $("[name = rd]").length; i++) {
                if ($("[name = rd]").eq(i).is(':checked') == true) {
                    $("#addressb").find("span").text($("[name = addressa]").eq(i).text());
                    $("#namemobile").find("span").text($("[name = namea]").eq(i).text() + $("[name = mobilea]").eq(i).text());
                    $("[name = rd]").eq(i).parent().removeClass("pstylea");
                    $("[name = rd]").eq(i).parent().addClass("pstyleb");
                }
            }
            var sum = 0;
            for (var i = 0; i < $("[name = price]").length; i++) {
                sum += Number($("[name = price]").eq(i).text());
            }
            $("[name = prices]").text(sum);
        })

        $("[name = rd]").click(function () {
            if ($(this).is(':checked') == true) {
                $(this).parent("p").siblings("p").removeClass("pstyleb");
                $(this).parent("p").siblings("p").addClass("pstylea");
                $(this).parent("p").removeClass("pstylea");
                $(this).parent("p").addClass("pstyleb");
                $("#addressb").find("span").text($(this).parent().children("[name=addressa]").text());
                $("#namemobile").find("span").text($(this).parent().children("[name=namea]").text() + $(this).parent().children("[name=mobilea]").text());
            }
        })

        $("#pay").click(function () {
            var cid;
            for (var i = 0; i < $("[name = rd]").length; i++) {
                if ($("[name = rd]").eq(i).is(':checked') == true) {
                    cid = $("[name = rd]").eq(i).attr("cid");
                }
            }
            if (cid == undefined) {
                toastr.error("请选择或添加收货地址！");
                return false;
            }
            var price = $("[name = prices]").text();
            location.href = "Payment.aspx?strIds=" + "<%=strIds%>" + "&cid=" + cid + "&price=" + price;
        })

        $('#myModal').on('show.bs.modal', function () {
            for (var i = 0; i < $("[name = rd]").length; i++) {
                if ($("[name = rd]").eq(i).is(':checked') == true) {
                    $("#xm").val($("[name = rd]").eq(i).parent().children("[name=namea]").text());
                    $("#mobile").val($("[name = rd]").eq(i).parent().children("[name=mobilea]").text());
                    $("#xxdz").val($("[name = rd]").eq(i).parent().children("[name=addressa]").children("[name=address]").text());
                }
            }
        })

        $("#update").click(function () {
            var cid = $('input[name="rd"]:checked').attr("cid");
            var province = $("#provincea option:selected").text();
            var city = $("#citya option:selected").text();
            var area = $("#areaa option:selected").text();
            var town = $("#towna option:selected").text();
            var xxdz = $("#xxdz").val();
            var name = $("#xm").val();
            var mobile = $("#mobile").val();
            $.ajax({
                type: 'post',
                url: 'Pay.aspx/Update',
                async: false,
                contentType: "application/json;charset=utf-8",
                dataType: "json",
                data: JSON.stringify({
                    cid: cid,
                    province: province,
                    city: city,
                    area: area,
                    town: town,
                    xxdz: xxdz,
                    name: name,
                    mobile: mobile
                }),
                success: function (data) {
                   
                },
                error: function (data) {
                    alert('ERROR!');
                }
            });
            $('#myModal').modal('hide');
            toastr.success("修改成功！");
            window.setTimeout(refreshCount, 1000 * 1);
        })

        $("#add").click(function () {
            var province = $("#provinceb option:selected").text();
            var city = $("#cityb option:selected").text();
            var area = $("#areab option:selected").text();
            var town = $("#townb option:selected").text();
            var xxdz = $("#Text1").val();
            var name = $("#Text2").val();
            var mobile = $("#Tel1").val();
            var uid = '<%=Session["uid"]%>';
            $.ajax({
                type: 'post',
                url: 'Pay.aspx/Add',
                async: false,
                contentType: "application/json;charset=utf-8",
                dataType: "json",
                data: JSON.stringify({
                    province: province,
                    city: city,
                    area: area,
                    town: town,
                    xxdz: xxdz,
                    name: name,
                    mobile: mobile,
                    uid : uid
                }),
                success: function (data) {

                },
                error: function (data) {
                    alert('ERROR!');
                }
            });
            $('#myModa2').modal('hide');
            toastr.success("添加成功！");
            window.setTimeout(refreshCount, 1000 * 1);
        })


        function refreshCount() {
            location.reload();
        }
    </script>

    <script type="text/javascript">
        var patha = "${request.contextPath}";
        var adrrs = "";
        var $town = $('#demo3 select[name="town"]');
        var townFormat = function (info) {
            $town.hide().empty();
            if (info['code'] % 1e4 && info['code'] < 7e5) {	//是否为“区”且不是港澳台地区
                $.ajax({
                    url: 'http://passer-by.com/data_location/town/' + info['code'] + '.json',
                    dataType: 'json',
                    success: function (town) {
                        $town.show();
                        for (i in town) {
                            $town.append('<option value="' + i + '">' + town[i] + '</option>');
                        }
                    }
                });
            }
        };
        $('#demo3').citys({
            province: '湖南',
            city: '长沙',
            area: '长沙县',
            required: false,
            nodata: 'disabled',
            onChange: function (info) {
                townFormat(info);
            }
        }, function (api) {
            var info = api.getInfo();
            townFormat(info);
        });
            </script>

    <script type="text/javascript">
        var patha = "${request.contextPath}";
        var adrrs = "";
        var $towna = $('#demo4 select[name="town"]');
        var townFormata = function (info) {
            $towna.hide().empty();
            if (info['code'] % 1e4 && info['code'] < 7e5) {	//是否为“区”且不是港澳台地区
                $.ajax({
                    url: 'http://passer-by.com/data_location/town/' + info['code'] + '.json',
                    dataType: 'json',
                    success: function (town) {
                        $towna.show();
                        for (i in town) {
                            $towna.append('<option value="' + i + '">' + town[i] + '</option>');
                        }
                    }
                });
            }
        };
        $('#demo4').citys({
            province: '湖南',
            city: '长沙',
            area: '长沙县',
            required: false,
            nodata: 'disabled',
            onChange: function (info) {
                townFormata(info);
            }
        }, function (api) {
            var info = api.getInfo();
            townFormata(info);
        });
            </script>
</asp:Content>
