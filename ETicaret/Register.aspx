<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="ETicaret.Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="span9">
        <ul class="breadcrumb">
            <li><a href="/">Ana Sayfa</a> <span class="divider">/</span></li>
            <li class="active">Üyelik Oluşturma</li>
        </ul>
        <h3>Üyelik Oluşturma</h3>
        <div class="well">
            <div class="form-horizontal">
                <div class="control-group">
                    <label class="control-label">Email <sup>*</sup></label>
                    <div class="controls">
                        
                        <asp:TextBox ID="txtRegisterEmail" runat="server"></asp:TextBox>
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label">Şifre <sup>*</sup></label>
                    <div class="controls">
                        
                        <asp:TextBox ID="txtRegisterPassword" runat="server"></asp:TextBox>
                        
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label">Şifre Tekrar <sup>*</sup></label>
                    <div class="controls">
                        <asp:TextBox ID="txtRegisterPassword2" runat="server" TextMode="Password"></asp:TextBox>
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label"></label>
                    <div class="controls">
                        <asp:Button ID="btnRegister" runat="server" CssClass="btn btn-success btn-large" Text="Kayıt Ol" OnClick="btnRegister_Click" />
                    </div>
                </div>
            </div>
        </div>

    </div>
</asp:Content>
