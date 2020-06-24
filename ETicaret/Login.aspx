<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="ETicaret.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="span9">
    <ul class="breadcrumb">
		<li><a href="/">Ana Sayfa</a> <span class="divider">/</span></li>
		<li class="active">Üye Girişi</li>
    </ul>
	<h3> Üye Girişi</h3>	
	<hr class="soft"/>
	
	<div class="row">
		<div class="span4">
			<div class="well">
			  <div class="control-group">
				<label class="control-label" for="inputEmail1">Email</label>
				<div class="controls">
                     <asp:TextBox ID="txtLoginEmail" CssClass="span3" runat="server" placeholder="Email"></asp:TextBox>
				
				</div>
			  </div>
			  <div class="control-group">
				<label class="control-label" for="inputPassword1">Password</label>
				<div class="controls">
                    <asp:TextBox ID="txtLoginPassword" CssClass="span3" runat="server" TextMode="Password" placeholder="Password"></asp:TextBox>
				 
				</div>
			  </div>
			  <div class="control-group">
				<div class="controls">
				<asp:Button ID="btnLogin" CssClass="btn btn-info" runat="server" Text="Giriş Yap" OnClick="btnLogin_Click"/>

                </div>
			  </div>
		</div>
		</div>
        <div class="span5">
             <img src="/UrunResimleri/login.png" alt="Bootsshop" />
        </div>
	</div>	
	
</div>
   
   
</asp:Content>
