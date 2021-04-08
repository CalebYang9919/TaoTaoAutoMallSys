<%@ Page Title="账户充值" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Wallets.aspx.cs" Inherits="Taotaonetwork.Wallets" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Admin/js/toastr/toastr.min.css" rel="stylesheet" />
    <script src="Admin/js/toastr/toastr.min.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div style="margin: 50px 50px; background-color: white; height: 300px; padding: 20px 50px;">
            <p style="margin-top: 50px; margin: 50px 50px;">
                <h3 style="display: inline;">当前电子钱包金额为：</h3>
                <asp:Label ID="Label1" runat="server" Text="Label" Style="font-size: 30px;"></asp:Label>
                <br />
                <br />
                <label>请输入充值金额*</label>
                <input id="chd" type="text" class="form-control" />
                <input type="button" value="点击充值" class="btn btn-success" onclick="recharge()" />
            </p>
        </div>
    </div>

    <script type="text/javascript">
        function recharge() {
            var ch = $("#chd").val();
            if (ch == "") {
                toastr.warning("充值金额不能为空！");
            }
            else if (!/^[0-9]+\d{0,20}[0-9]?$/.test(ch)) {
                toastr.warning("充值金额必须为数字！");
            }
            else {
                var userid =<%=Session["uid"]%>
                $.ajax({
                    type: 'post',
                    url: 'Wallets.aspx/ch',
                    async: true,
                    contentType: "application/json;charset=utf-8",
                    dataType: "json",
                    data: JSON.stringify({ ch: ch, userid: userid }),
                    success: function (data) {
                        $("#chd").val("");
                        toastr.success("充值成功！");
                        window.location.reload();
                    },
                });
            }
    }
    </script>
</asp:Content>
