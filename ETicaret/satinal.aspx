<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="satinal.aspx.cs" Inherits="ETicaret.satinal" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:GridView ID="grdSepet" runat="server">
        <Columns>

            <asp:TemplateField>
                <ItemTemplate>
                    <asp:LinkButton ID="btnSil" CssClass="btn btn-danger btn-mini" runat="server"
                        CommandArgument='<%# Container.DataItemIndex  %>' OnClick="btnSil_Click">
                        Sil
                    </asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>


        </Columns>
    </asp:GridView>
    Kargo Ücreti:<h4><asp:Label ID="lblkargoUcreti" runat="server" Text=""></asp:Label> TL</h4><br />
      <asp:Label ID="LblToplam" runat="server" Text="Toplam tutar:"></asp:Label>
    <h4>
        <asp:Literal ID="ltlToplamFiyat" runat="server"></asp:Literal> TL</h4>

    <asp:LinkButton ID="btnAdres" OnClick="btnAdres_Click" runat="server">Adres Ekle</asp:LinkButton><br />
    <div>
        <asp:Label ID="lblAdres" runat="server" Text="Adres:" Visible="false"></asp:Label>
        <asp:TextBox ID="txtAdres" TextMode="MultiLine" Visible="false" runat="server"></asp:TextBox><br />
        <asp:Label ID="lblTelefon" runat="server" Text="Telefon:" Visible="false"></asp:Label>
        <asp:TextBox ID="txtTelefon" Visible="false" runat="server"></asp:TextBox><br />
    </div>
    <asp:LinkButton ID="btnSepetTamamla" OnClick="btnSepetTamamla_Click" CssClass="btn btn-success pull-right" Visible="false" runat="server">Ödemeyi Tamamla</asp:LinkButton><br />

</asp:Content>
