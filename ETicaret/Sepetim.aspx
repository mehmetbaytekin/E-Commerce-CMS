<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Sepetim.aspx.cs" Inherits="ETicaret.Sepetim" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:GridView ID="grdSepet" runat="server" CssClass="table table-bordered table-striped" style="width:75%"></asp:GridView>
    <br />
    <asp:Button ID="btnTamamla" runat="server" Text="Devam et" CssClass="btn  btn-mini btn-danger pull-right" OnClick="btnTamamla_Click" />
</asp:Content>
