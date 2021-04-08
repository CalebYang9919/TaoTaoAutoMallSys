<%@ Page Title="广告列表" Language="C#" MasterPageFile="~/BackStage.Master" AutoEventWireup="true" CodeBehind="AdvertisingList.aspx.cs" Inherits="Taotaonetwork.Admin.AdvertisingList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="row" style="height: 600px;">
        <asp:Repeater ID="Repeater1" runat="server">
            <HeaderTemplate>
                <table class="table table-hover">
                    <thead>
                        <tr class="bg-info text-white">
                            <th>广告</th>
                            <th>广告ID</th>
                            <th>广告名称</th>
                            <th>所属分类</th>
                            <th>是否显示</th>
                            <th>操作</th>
                        </tr>
                    </thead>
                    <tbody>
            </HeaderTemplate>
            <ItemTemplate>
                <tr>

                    <th scope="row">
                        <img src="../images/Image/<%# Eval("urls") %>" style="width: 100px; height: 100px;" /></th>
                    <td><%# Eval("id") %></td>
                    <th scope="row"><%# Eval("name") %></th>
                    <th scope="row"><%# Eval("classid") %></th>
                    <th scope="row"><%# Eval("shows") %></th>
                    <td>
                        <a href="AdvertisingAdd.aspx?id=<%# Eval("id") %>">编辑</a>
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
    </div>
    
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
                               url: 'AdvertisingList.aspx/deletes',
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
    </script>
</asp:Content>
