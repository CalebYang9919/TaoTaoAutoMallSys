<%@ Page Title="添加商品" Language="C#" MasterPageFile="~/BackStage.Master" AutoEventWireup="true" CodeBehind="ProductAdd.aspx.cs" Inherits="Taotaonetwork.ProductAdd" ValidateRequest="false"%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="height:600px;padding-left:20px;">
    <label>商品名称：</label><asp:TextBox ID="productid" runat="server" style="display:none;"></asp:TextBox>
&nbsp;<asp:TextBox ID="TextBox1" runat="server"  class="form-control" style="width:70%;"></asp:TextBox><label>数量：</label>
    <asp:TextBox ID="TextBox3" runat="server" class="form-control" style="width:70%;"></asp:TextBox>
     
    <label>单价：</label>
    <asp:TextBox ID="TextBox4" runat="server"  class="form-control" style="width:70%;"></asp:TextBox>
     
    <label>所属分类：<br />
        <asp:DropDownList ID="DropDownList1" runat="server" class="form-control" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" >
        </asp:DropDownList>
        </label>
    &nbsp;<br />

        <label>商品图片：</label>

        <br />

        <asp:Image ID="Image1" runat="server" Height="100px" Width="100px" />
        <asp:FileUpload ID="FileUpload1" runat="server" />
        <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="上传图片" class="btn btn-success"/>
        <br />
        <br />
        <br />
    <br />
    <asp:Button ID="Button1" runat="server" Text="添加商品" class="btn btn-success" OnClick="Button1_Click"/>  
      &nbsp;&nbsp;  
      <asp:Button ID="Button2" runat="server" Text="取消添加" class="btn btn-danger" />
    </div>
</asp:Content>
