<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Test.aspx.cs" Inherits="ETicaret.Admin.Test" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table border="1">
                <tr>
                    <td>ID</td>
                    <td>Ürün Adı</td>
                    <td>Stok Miktarı</td>
                    <td>Düzenle</td>
                </tr>
                <asp:Repeater ID="Repeater1" runat="server">
                    <ItemTemplate>
                        <tr>
                            <td><%# Eval("ID") %></td>
                            <td><%# Eval("UrunAdi") %></td>
                            <td><%# Eval("StokMiktari") %></td>
                            <td>
                                <asp:LinkButton ID="LinkButton1" 
                                    runat="server" OnClick="LinkButton1_Click"
                                    CommandArgument='<%# Eval("ID") %>'
                                    >
                                    <%# Eval("ID") %> numaralı kaydı düzenle
                                </asp:LinkButton>
                            </td>
                        </tr>  
                    </ItemTemplate>
                </asp:Repeater>
                <%--
                <tr>
                    <td>IPHONE</td>
                    <td>10</td>
                </tr>                
                <tr>
                    <td>SAMSUNG</td>
                    <td>20</td>
                </tr>
                    --%>
            </table>
        </div>
    </form>
</body>
</html>
