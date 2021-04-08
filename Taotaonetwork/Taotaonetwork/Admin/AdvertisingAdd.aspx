<%@ Page Title="添加广告" Language="C#" MasterPageFile="~/BackStage.Master" AutoEventWireup="true" CodeBehind="AdvertisingAdd.aspx.cs" Inherits="Taotaonetwork.Admin.AdvertisingAdd" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="height: 600px; padding-left: 20px;">
        <label>广告名称：</label><asp:TextBox ID="AdvertisingId" runat="server" Style="display: none;"></asp:TextBox>
        &nbsp;<asp:TextBox ID="TextBox1" runat="server" class="form-control" Style="width: 70%;"></asp:TextBox>
        
        <label>所属分类：<br />
        <asp:DropDownList ID="DropDownList2" runat="server" class="form-control" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged" >
        </asp:DropDownList>
        <label>是否显示：</label>
        <asp:DropDownList ID="DropDownList1" runat="server" class="form-control" Style="width: 40%;">
            <asp:ListItem Value="1">是</asp:ListItem>
            <asp:ListItem Value="0">否</asp:ListItem>
        </asp:DropDownList>
        &nbsp;<br />
        
        <label>广告图片：</label>

        <br />

        <asp:Image ID="Image1" runat="server" Height="100px" Width="100px" />
        <asp:FileUpload ID="FileUpload1" runat="server" />
        <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="上传图片" class="btn btn-success" />
        <br />
        <br />
        <br />
        <br />
        <asp:Button ID="Button1" runat="server" Text="添加广告" class="btn btn-success" OnClick="Button1_Click" />
        &nbsp;&nbsp;  
      <asp:Button ID="Button2" runat="server" Text="取消添加" class="btn btn-danger" />
    </div>
    </label>
</asp:Content>
