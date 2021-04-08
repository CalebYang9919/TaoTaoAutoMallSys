<%@ Page Title="" Language="C#" MasterPageFile="~/BackStage.Master" AutoEventWireup="true" CodeBehind="UserControl.aspx.cs" Inherits="Taotaonetwork.UserControl" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    
    <script type="text/javascript">
        function deletet() {
            swal({
                title: "确认要删除？",
                type: "warning",
                showCancelButton: true,
                confirmButtonColor: "#DD6B55",
                confirmButtonText: "是",
                cancelButtonText: "否",
                closeOnConfirm: false,
                closeOnCancel: true
            },
                   function (isConfirm) {
                       if (isConfirm) {
                           swal("提示信息", "删除成功");
                           //alert("删除成功");
                       } else {
                           alert("删除失败");
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
                               url: 'UserControl.aspx/deletes',
                               async: true,
                               contentType: "application/json;charset=utf-8",
                               dataType: "json",
                               data: JSON.stringify({ id: id }),
                               success: function (data) {
                                   if (data.d) {
                                       window.location.reload();
                                   }
                                   else {
                                       toastr.warning("该用户还有订单尚未签收，删除失败");
                                   }
                                   
                               },
                           });
                           //alert("删除成功");
                       } else {
                       }
                   });


        }
        
        function wish() {
            toastr.success("收藏成功");
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!--***** CONTENT *****-->
    <div class="row" style="height: 600px;">

        <asp:Repeater ID="Repeater1" runat="server" OnItemCommand="Repeater1_ItemCommand">
            <HeaderTemplate>
                <table class="table table-hover">
                    <thead>
                        <tr class="bg-info text-white">
                            <th>序号</th>
                            <th>用户名</th>
                            <th>电子邮箱</th>
                            <th>电话号码</th>
                            
                            <th>操作</th>
                        </tr>
                    </thead>
                    <tbody>
            </HeaderTemplate>
            <ItemTemplate>
                <tr>
                    <th scope="row"><%# Eval("id") %></th>
                    <td><%# Eval("user_name") %></td>
                    <td><%# Eval("email") %></td>
                    <td><%# Eval("mobile") %></td>
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

        <%--<a href="#" id="shan" onclick="deletet()">删除</a>
        <a href="#" onclick="wish()">收藏</a>--%>
    </div>
    
</asp:Content>
