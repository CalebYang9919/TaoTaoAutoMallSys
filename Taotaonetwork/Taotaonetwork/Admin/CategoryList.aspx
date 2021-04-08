<%@ Page Title="" Language="C#" MasterPageFile="~/BackStage.Master" AutoEventWireup="true" CodeBehind="CategoryList.aspx.cs" Inherits="Taotaonetwork.CategoryList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Repeater ID="Repeater1" runat="server" OnItemCommand="Repeater1_ItemCommand">
        <HeaderTemplate>
                <table class="table table-hover">
                    <thead>
                        <tr class="bg-info text-white">
                            <th>分类ID</th>
                            <th>商品分类</th>
                            <th>删除</th>
                            <th>编辑</th>
                        </tr>
                    </thead>
                    <tbody>
            </HeaderTemplate>
            <ItemTemplate>
                <tr>
                    <th scope="row"><%# Eval("classid") %></th>
                    <td><%# Eval("classname") %></td>
                    <td>
                        <a href="#" onclick="deletes(<%# Eval("classid") %>)">删除</a>
                        <%--<asp:LinkButton ID="LinkButton2" runat="server" CommandArgument='<%# Eval("classid") %>' CommandName="del">删除</asp:LinkButton></td>--%>
                    <td>
                        <%--<asp:LinkButton ID="LinkButton1" runat="server" CommandArgument='<%# Eval("classid") %>' CommandName="editer">编辑</asp:LinkButton>--%>

                        <a href="CategoryAdd.aspx?classid=<%# Eval("classid") %>">编辑</a>
                        <%--<a href="#" runat="server" onserverclick="a_click" CommandArgument='<%# Eval("id") %>' CommandName="del">删除</a>--%>
                    </td>
                </tr>
            </ItemTemplate>
            <FooterTemplate>
                </tbody>
        </table>
            </FooterTemplate>
    </asp:Repeater>

    <script type="text/javascript">
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
                               url: 'CategoryList.aspx/deletes',
                               async: true,
                               contentType: "application/json;charset=utf-8",
                               dataType: "json",
                               data: JSON.stringify({ id: id }),
                               success: function (data) {
                                   if (data.d) {
                                       window.location.reload();
                                   }
                                   else {
                                       toastr.warning("该商品分类下还有商品，请删除分类下的商品后再删除该分类，删除失败");
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
