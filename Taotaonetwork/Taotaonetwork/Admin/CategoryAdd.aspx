<%@ Page Title="添加分类" Language="C#" MasterPageFile="~/BackStage.Master" AutoEventWireup="true" CodeBehind="CategoryAdd.aspx.cs" Inherits="Taotaonetwork.CategoryAdd" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="height: 600px; padding-left: 20px;">
        <label>商品分类：</label>
        <asp:TextBox ID="TextBox1" runat="server" class="form-control" Style="width: 70%;"></asp:TextBox>
        <asp:TextBox ID="TextBox2" runat="server" style="display:none;"></asp:TextBox>
        <br />
        <asp:Image ID="Image1" runat="server" Height="100px" Width="100px" />
         <asp:FileUpload ID="FileUpload1" runat="server" />
        <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="上传png格式的图片" class="btn btn-success"/>
        <br />
        <br />
        <asp:Button ID="Button1" runat="server" Text="添加分类" class="btn btn-success" OnClick="Button1_Click" />
    </div>
</asp:Content>
