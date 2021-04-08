<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ProductList.ascx.cs" Inherits="TaotaonetworkUI.UserControls.ProductList" %>
<asp:DataList ID="DataList1" runat="server" RepeatColumns="4">
    <ItemTemplate>
        <table>
            <tr>
                <td>
                    <asp:Image ID="ImagePic" ImageUrl='<%# "~/images/2011/"+Eval("ProductPic") %>' runat="server" Height="200px" Width="200px" /></td>
            </tr>
            <tr>
                <td>
                    <%# Eval("ProductName") %>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label1" runat="server" Text="原厂品质保证，绝对值得拥有！有现货！"></asp:Label>
                </td>
            </tr>
            <tr style="color: red">
                <td>¥<%# Eval("ProductPrice") %>
                </td>
            </tr>
        </table>
    </ItemTemplate>
</asp:DataList>





