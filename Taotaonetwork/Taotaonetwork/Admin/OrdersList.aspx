<%@ Page Title="订单管理" Language="C#" MasterPageFile="~/BackStage.Master" AutoEventWireup="true" CodeBehind="OrdersList.aspx.cs" Inherits="Taotaonetwork.Admin.OrdersList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row" style="height: 600px;">
        <script src="js/jquery.min.js"></script>
        <asp:Repeater ID="Repeater1" runat="server">
            <HeaderTemplate>
                <table class="table table-hover">
                    <thead>
                        <tr class="bg-info text-white">
                            <th>订单ID</th>
                            <th>用户名</th>
                            <th>联系人</th>
                            <th>支付状态</th>

                            <th>操作</th>
                        </tr>
                    </thead>
                    <tbody>
            </HeaderTemplate>
            <ItemTemplate>
                <tr>
                    <th scope="row"><%# Eval("orderid") %></th>
                    <td><%# Eval("user_name") %></td>
                    <td><%# Eval("name") %></td>
                    <td><%# Eval("ordertype") %>

                        <a href="#" onclick="pays(<%# Eval("id") %>)" class="" style='display: <%# Eval("ordertype").ToString() == "已支付" ? ainline :anone %>;'>点击发货</a>

                        <%--   <input type="button" value="点击支付" />--%>
                    </td>
                    <td>
                        <a href="#" onclick="deletes(<%# Eval("id") %>)">删除</a>
                        <%--<asp:LinkButton ID="LinkButton1" runat="server" CommandArgument='<%# Eval("id") %>' CommandName="del">删除</asp:LinkButton>--%>
                        <%--<a href="#" runat="server" onserverclick="a_click" CommandArgument='<%# Eval("id") %>' CommandName="del">删除</a>--%>

                    </td>
                </tr>
            </ItemTemplate>
            <FooterTemplate>
                </tbody>
        </table>
            </FooterTemplate>
        </asp:Repeater>

        <%--分页--%>
        <ul class="pagination" style="margin-left: 40%; margin-top: -50px;">
        <li class="page-item" onclick="jian()">
            <a class="page-link" href="#">&laquo;</a>
        </li>
        <%for (int i = 0; i < pageindex; i++)
          { %>
        <li class="page-item">
            <%--<a id="aa" runat="server" onserverclick="a_click"></a>--%>
            <a class="page-link" href="#" onclick="fen(<%=i+1 %>)"><%=i+1 %></a>
        </li>
        <% } %>
        <li class="page-item"><a class="page-link" href="#" onclick="jia()">&raquo;</a></li>
    </ul>
    </div>
    
    <script type="text/javascript">

        //分页
        function fen(shu) {
            $.ajax({
                type: 'post',
                url: 'OrdersList.aspx/dd',
                async: false,
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                data: JSON.stringify({ shu: shu }),
                success: function (data) {
                    window.location.href = "OrdersList.aspx?indexx=" + data.d;
                }
            });
        }

        //减页
        function jia() {
            $.ajax({
                type: 'post',
                url: 'OrdersList.aspx/sh',
                async: true,
                contentType: "application/json;charset=utf-8",
                dataType: "json",
                success: function (data) {
                    window.location.href = "OrdersList.aspx?indexx=" + data.d;
                },
            });
        }
        //加页
        function jian() {
            $.ajax({
                type: 'post',
                url: 'OrdersList.aspx/jian',
                async: true,
                contentType: "application/json;charset=utf-8",
                dataType: "json",
                success: function (data) {
                    window.location.href = "OrdersList.aspx?indexx=" + data.d;
                },
            });
        }

        function pays(id) {
            swal({
                title: "是否确定发货？",
                type: "warning",
                showCancelButton: true,
                confirmButtonColor: "#DD6B55",
                confirmButtonText: "是",
                cancelButtonText: "否",
                closeOnConfirm: true,
                closeOnCancel: true
            },
                   function (isConfirm) {
                       if (isConfirm) {
                           $.ajax({
                               type: 'post',
                               url: 'OrdersList.aspx/pays',
                               async: true,
                               contentType: "application/json;charset=utf-8",
                               dataType: "json",
                               data: JSON.stringify({ id: id }),
                               success: function (data) {
                                   window.location.reload();
                               },
                           });
                           //alert("删除成功");
                       } else {
                       }
                   });


        }

        function deletes(id) {
            swal({
                title: "确认要删除？",
                type: "warning",
                showCancelButton: true,
                confirmButtonColor: "#DD6B55",
                confirmButtonText: "是",
                cancelButtonText: "否",
                closeOnConfirm: true,
                closeOnCancel: true
            },
                   function (isConfirm) {
                       if (isConfirm) {
                           $.ajax({
                               type: 'post',
                               url: 'OrdersList.aspx/deletes',
                               async: true,
                               contentType: "application/json;charset=utf-8",
                               dataType: "json",
                               data: JSON.stringify({ id: id }),
                               success: function (data) {
                                   window.location.reload();
                               },
                           });
                           //alert("删除成功");
                       } else {
                       }
                   });


        }
    </script>
</asp:Content>
