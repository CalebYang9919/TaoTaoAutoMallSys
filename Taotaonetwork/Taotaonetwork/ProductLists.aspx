<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ProductLists.aspx.cs" Inherits="Taotaonetwork.ProductLists" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <%@ Register Src="~/UserControls/ProductList.ascx" TagPrefix="uc1" TagName="ProductList" %>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
    <div style="border: 1px solid #dddddd; width: 1020px;margin-left:15px;">
            <uc1:ProductList runat="server" ID="ProductList" ProductClassID="1" />
        </div>
        </div>
</asp:Content>
