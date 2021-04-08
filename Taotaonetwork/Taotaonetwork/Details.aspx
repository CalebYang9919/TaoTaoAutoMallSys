<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Details.aspx.cs" Inherits="Taotaonetwork.Details" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="css/bootstrap.min.css" />
    <link href="Admin/js/toastr/toastr.min.css" rel="stylesheet" />
    <!--slider-->
    <script src="js/jquery.min.js"></script>
    <script src="js/script.js" type="text/javascript"></script>
    <script src="Admin/js/toastr/toastr.min.js" type="text/javascript"></script>
    <script src="js/superfish.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div style="border: 0px solid red; margin-top: 10px; padding: 10px;">
        <asp:Repeater ID="Repeater1" runat="server">
            <ItemTemplate>
                <div style="overflow: hidden;">
                    <div class="col-lg-3">
                        <asp:Image ID="Image1" runat="server" ImageUrl='<%# "~/images/2011/"+Eval("ProductPic") %>' Width="285px" Height="285px" />
                    </div>
                    <div style="border: 0px solid red; background-color: white; padding-bottom: 10px;" class="col-lg-9">
                        <h3><%# Eval("productname")%></h3>
                        <p style="color: red;">原厂商品，品质保证，你绝对值得拥有！即日起，购买可享受淘淘优惠哦！</p>
                        <hr style="border-top: 1px solid #808080;" />
                        <p name="productids" style="display: none;"><%# Eval("id")%></p>
                        <p>淘淘价：<span style="color: red; font-size: 25px;">￥<%# Eval("productprice")%></span></p>
                        <p>购买数量：<input id="nums" type="number" value="1" min="1" max="999" class="form-control" style="width: 10%; display: inline;" /></p>
                        <p>库存量：<%# Eval("quantity")%></p>
                        <input id="addCart" type="button" value="加入购物车" class="btn btn-default" pid='<%# Eval("id")%>' style="background-color: #f00; color: white;" />
                        <input id="pay" type="button" value="立即购买" class="btn btn-default" pid='<%# Eval("id")%>' style="background-color: #f00; color: white;" />
                    </div>
                </div>

            </ItemTemplate>
        </asp:Repeater>

        <div style="padding-left: 14px; margin-top: 50px;">
            <div style="overflow: hidden; background-color: white; padding-bottom: 10px;" class="col-lg-12">
                <h3>买家评论</h3>
                <asp:Repeater ID="Repeater2" runat="server" OnItemDataBound="Repeater2_ItemDataBound">
                    <ItemTemplate>
                        <div class="margin-bottom-20">
                            <div class="media-body">
                                <h4 class="media-heading size-14">
                                    <%# Eval("user_name") %>&ndash;
                                            <span class="text-muted"><%# Eval("create_time") %></span>&ndash;
												<span class="size-14 text-muted">
                                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("stars") %>'>
                                                        
                                                    <%--<i class="glyphicon glyphicon-star"></i>
                                                    <i class="glyphicon glyphicon-star-empty"></i>--%>
                                                    </asp:Label>
                                                    
                                                </span>
                                </h4>
                                <p><%# Eval("contents") %></p>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>

            <div class="margin-bottom-30">
                <textarea name="content" id="text" class="form-control"
                    rows="6" placeholder="评论内容" maxlength="1000"></textarea>
            </div>

            <!-- Stars -->
            <div class="product-star-vote clearfix" style="margin-top: 30px;">
                <label class=" pull-left">
                    <input type="radio"
                        name="stars" value="1" /><i></i>1星
                </label>
                <label class=" pull-left" style="margin-left: 20px;">
                    <input type="radio"
                        name="stars" value="2" /><i></i>2星
								
                </label>
                <label class=" pull-left" style="margin-left: 20px;">
                    <input type="radio"
                        name="stars" value="3" /><i></i>3星
								
                </label>
                <label class=" pull-left" style="margin-left: 20px;">
                    <input type="radio"
                        name="stars" value="4" /><i></i>4星
								
                </label>
                <label class=" pull-left" style="margin-left: 20px;">
                    <input type="radio"
                        name="stars" value="5" /><i></i>5星
								
                </label>
            </div>
            <input onclick="addReviews()" type="button" value="提交评论" class="btn btn-danger" />
            <input type="hidden" id="uid" value="<%=Session["uid"]%>" />

        </div>
    </div>

     <%--<hr style="border: 1px solid #C0C0C0; margin-top: 50px;" />
   <div class="container" style="text-align: center; color: #9D9D9D;">
        <p>CopyRight©2007-2014Taotao Inc.All Rights Reserved 沪ICP备02110488号</p>
        <p>上海淘淘科技有限公司 版权所有 站长统计 服务邮箱 service@taotao.com</p>
    </div>--%>

    <script>

        $("#addCart").click(function () {

            if ('<%=Session["username"]%>' == "") {
                toastr.error("请先登录！");
            } else {

                var uid = '<%=Session["uid"]%>';
                var pid = $(this).attr("pid");
                var num = $("#nums").val();

                $.ajax({
                    type: 'post',
                    url: 'Cart.aspx/AddCart',
                    async: false,
                    contentType: "application/json;charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({
                        uid: uid,
                        pid: pid,
                        num: num
                    }),
                    success: function (data) {
                        toastr.success("加入购物车成功！");
                    },
                    error: function (data) {
                        alert('ERROR!');
                    }
                });
            }
        });

        $("#pay").click(function () {
            if ('<%=Session["username"]%>' == "") {
                toastr.error("请先登录！");
            } else {

                var uid = '<%=Session["uid"]%>';
                var pid = $(this).attr("pid");
                var num = $("#nums").val();

                location.href = "LiJiPay.aspx?pid=" + pid + "&num=" + num;

            }
        });

        function addReviews() {
            var userid = $("#uid").val();
            if (userid == "") {
                toastr.warning('请登录后再评论!');
                return false;
            }
           var contents = $('textarea[name="content"]').val().trim();
           if (contents.length == 0) {
               toastr.warning('还没填写评论呢!');
               return false;
           }

           var productids = $("p[name='productids']").text();

           var stars = $("input[name='stars']:checked").val();
           if (stars == undefined) {
               toastr.warning('请流下你的心再走!');
               return false;
           }
           

           $.ajax({
               type: "POST",
               url: 'Details.aspx/AddComment',
               async: false,
               contentType: "application/json; charset=utf-8",
               data: JSON.stringify({ "userid":userid,"productids":productids,"contents":contents,"stars":stars }),
               dataType: "json", //ajax返回值设置为text(json格式也可用它返回，可打印出结果，也可设置成json)  
               success: function (data) {
                   if (data.d) {
                       toastr.success("添加评论成功!");
                       $('textarea[name="content"]').val("");
                       window.location.reload();
                   } else {
                       toastr.warning("您还没用购买该商品或没有签收该订单，添加评论失败!");
                   }
               },
               error: function (data) {
                   toastr.error('错误 请刷新页面!');
               }
           });
       }

    </script>

</asp:Content>
