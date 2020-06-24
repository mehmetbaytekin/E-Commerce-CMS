<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="ETicaret.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="span9">

        <h4>Vitrindekiler </h4>
        <ul class="thumbnails">
            <asp:Repeater ID="RptVitrin" runat="server">
                <ItemTemplate>
                    <li class="span3">
                        <div class="thumbnail">
                             <a href="/U-<%#Eval("UrunAdi") %>-<%#Eval("ID") %>">
                                <img src='/UrunResimleri/<%# Eval("Resim") %>' alt="" /></a>
                            <div class="caption">
                                <h5><%#Eval("UrunAdi") %></h5>
                                <p>
                                    <%#Eval("UrunAciklamasi") %>
                                </p>

                                <h4 style="text-align: center"><a class="btn" href='/U-<%#Eval("UrunAdi") %>-<%#Eval("ID") %>'>
                                    <i class="icon-zoom-in"></i></a>
                                    &nbsp;
                                    <a class="btn" href="Sepetim.aspx">
                                        <i class="icon-shopping-cart"></i></a>&nbsp;
                                    <a class="btn btn-primary"><%#Eval("UrunFiyati") %> ₺</a></h4>
                            </div>
                        </div>
                    </li>
                </ItemTemplate>
            </asp:Repeater>

           
        </ul>

    </div>


</asp:Content>
