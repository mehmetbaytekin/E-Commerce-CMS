<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="ETicaret.Admin.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<link rel="stylesheet" href="css/bootstrap.min.css" />
		<link rel="stylesheet" href="css/bootstrap-responsive.min.css" />
        <link rel="stylesheet" href="css/matrix-login.css" />
        <link href="font-awesome/css/font-awesome.css" rel="stylesheet" />
		<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,700,800' rel='stylesheet' type='text/css' />

</head>
<body>
    <form id="form1" runat="server" defaultbutton="LinkButton2">
         <div id="loginbox">            
            <div id="loginform" class="form-vertical">
				 <div class="control-group normal_text"> <h3>ADMİN GİRİŞ</h3></div>
                <div class="control-group">
                    <div class="controls">
                        <div class="main_input_box">
                            <span class="add-on bg_lg"><i class="icon-user"> </i></span>
                            <asp:TextBox ID="TextBox1" runat="server" placeholder="kullanıcı adı"></asp:TextBox>
                        </div>
                    </div>
                </div>
                <div class="control-group">
                    <div class="controls">
                        <div class="main_input_box">
                            <span class="add-on bg_ly"><i class="icon-lock"></i></span>
                             <asp:TextBox ID="TextBox2" runat="server" placeholder="password" TextMode="Password"></asp:TextBox>
                        </div>
                    </div>
                </div>
                <div class="form-actions">
                    <span class="pull-left">
                        <asp:LinkButton ID="LinkButton1" CssClass="flip-link btn btn-info" Visible="false"  OnClick="Button2_Click" runat="server">Normal Giriş</asp:LinkButton>
                        </span>
                    <span class="pull-right">
                         <asp:LinkButton ID="LinkButton2" CssClass="btn btn-success"  OnClick="Button1_Click" runat="server">Giriş Yap</asp:LinkButton>
                        </span>
                </div>
            </div>
        </div>
        
        <script src="js/jquery.min.js"></script>  
        <script src="js/matrix.login.js"></script> 
     
    </form>
</body>
</html>
