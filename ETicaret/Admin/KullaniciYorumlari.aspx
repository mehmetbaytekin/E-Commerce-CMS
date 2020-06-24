<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Site1.Master" AutoEventWireup="true" CodeBehind="KullaniciYorumlari.aspx.cs" Inherits="ETicaret.Admin.KullaniciYorumlari" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="content">
        <div id="content-header">
            <div id="breadcrumb">
                <a href="index.html" title="Go to Home" class="tip-bottom">
                    <i class="icon-home"></i>Ana Sayfa</a>
                <a href="#" class="current">Üyelerin Yorumları</a>
            </div>

        </div>
        <div class="container-fluid">

            <div class="row-fluid">
                <div class="span6">
                    <div class="widget-box">
                        <div class="widget-title">
                            <span class="icon"><i class="icon-align-justify"></i></span>
                            <h5>Kullanıcılar</h5>
                        </div>
                        <div class="widget-content nopadding">
                            <asp:GridView ID="GridView1" CssClass="table table-bordered table-striped" runat="server" AutoGenerateColumns="false">
                                <Columns>
                                    <asp:BoundField DataField="UrunAdi" HeaderText="Ürün Adı" />
                                    <asp:BoundField DataField="Ad" HeaderText="Üye Adı" />
                                    <asp:BoundField DataField="Yorum" HeaderText="Yorum" />
                                    <asp:BoundField DataField="YorumDurum" HeaderText="Yorum Durumu" />
                                    <%--                                     <asp:TemplateField>
                                        <ItemTemplate>
                                            <%# Eval("UrunAdi") %> 
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <%# Eval("Yorum") %> 
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                     <asp:TemplateField>
                                        <ItemTemplate>
                                            <asp:Literal ID="ltlyorumDurum" runat="server">0</asp:Literal>
                                            
                                        </ItemTemplate>
                                    </asp:TemplateField>--%>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <asp:LinkButton ID="btnSil" CssClass="btn btn-danger btn-mini" runat="server"
                                                CommandArgument='<%# Eval("ID") %>' OnClick="btnSil_Click"
                                                OnClientClick="return confirm('Silmek istediğinizden emin misiniz?');">
                        Sil
                                            </asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <asp:LinkButton ID="btnOnay" CssClass="btn btn-warning btn-mini" runat="server"
                                                CommandArgument='<%# Eval("ID") %>' OnClick="btnOnay_Click">
                        Onayla
                                            </asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
