<%@ Page Title="" Language="C#" MasterPageFile="~/BackStage.Master" AutoEventWireup="true" CodeBehind="ProductList.aspx.cs" Inherits="Taotaonetwork.ProductList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/boot/bootstrap.min.css" rel="stylesheet" />
    <script src="js/jquery.min.js"></script>
    <script src="js/boot/bootstrap.min.js"></script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Repeater ID="Repeater1" runat="server">
        <HeaderTemplate>
            <table class="table table-hover">
                <thead>
                    <tr class="bg-info text-white">
                        <th>商品ID</th>
                        <th>商品名称</th>
                        <th>所属种类</th>
                        <th>实际库存</th>
                        <th>商品单价</th>
                        <th>操作</th>
                    </tr>
                </thead>
                <tbody>
        </HeaderTemplate>
        <ItemTemplate>
            <tr>
                <th scope="row"><%# Eval("id") %></th>
                <td><%# Eval("productname") %></td>
                <th scope="row"><%# Eval("classname") %></th>
                <th scope="row"><%# Eval("quantity") %></th>
                <td>￥<%# Eval("productprice") %></td>
                <td>
                    <a href="ProductAdd.aspx?id=<%# Eval("id") %>">编辑</a>
                    <%--<asp:LinkButton ID="LinkButton1" runat="server" CommandArgument='<%# Eval("id") %>' CommandName="del">编辑</asp:LinkButton>--%>
                    <a href="#" onclick="deletes(<%# Eval("id") %>)">删除</a>
                    <%--<a href="#" runat="server" onserverclick="a_click" CommandArgument='<%# Eval("id") %>' CommandName="del">删除</a>--%>
                </td>
            </tr>
        </ItemTemplate>
        <FooterTemplate>
            </tbody>
        </table>
        </FooterTemplate>
    </asp:Repeater>

    <ul class="pagination" style="margin-left: 40%;margin-top:20px;">
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


    <script type="text/javascript">

        //分页
        function fen(shu) {
            $.ajax({
                type:'post',
                url: 'ProductList.aspx/dd',
                async: false,
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                data: JSON.stringify({ shu: shu }),
                success: function (data) {
                    window.location.href = "ProductList.aspx?indexx="+data.d;
                }
            });
        }

        //减页
        function jia() {
            $.ajax({
                type: 'post',
                url: 'ProductList.aspx/sh',
                async: true,
                contentType: "application/json;charset=utf-8",
                dataType: "json",
                success: function (data) {
                    window.location.href = "ProductList.aspx?indexx=" + data.d;
                },
            });
        }
        //加页
        function jian() {
            $.ajax({
                type: 'post',
                url: 'ProductList.aspx/jian',
                async: true,
                contentType: "application/json;charset=utf-8",
                dataType: "json",
                success: function (data) {
                    window.location.href = "ProductList.aspx?indexx=" + data.d;
                },
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
                               url: 'ProductList.aspx/deletes',
                               async: true,
                               contentType: "application/json;charset=utf-8",
                               dataType: "json",
                               data: JSON.stringify({ id: id }),
                               success: function (data) {
                                   if (data.d) {
                                       window.location.reload();
                                   }
                                   else {
                                       toastr.error("该商品已在订单中被购买，不能删除！");
                                   }
                                   
                               },
                           });
                           //alert("删除成功");
                       } else {
                       }
                   });


        }
    </script>
</asp:Content>
