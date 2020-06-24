<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Site1.Master" AutoEventWireup="true" CodeBehind="BannerYonetimi.aspx.cs" Inherits="ETicaret.Admin.BannerYonetimi" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div id="content">
        <div id="content-header">
            <div id="breadcrumb">
                <a href="index.html" title="Go to Home" class="tip-bottom">
                    <i class="icon-home"></i>Ana Sayfa</a>
                <a href="#" class="current">Banner Yönetimi</a>
            </div>

        </div>
        <div class="container-fluid">

            <div class="row-fluid">
                <div class="span6">
                    <div class="widget-box">
                        <div class="widget-title">
                            <span class="icon"><i class="icon-align-justify"></i></span>
                            <h5>Banner Ekle</h5>
                        </div>
                        <div class="widget-content nopadding">
                            <div class="form-horizontal">
                                <div class="control-group">
                                    <asp:HiddenField ID="hdnID" runat="server" Value="0" />
                                    <label class="control-label">Banner Açıklama :</label>
                                    <div class="controls">
                                        <asp:TextBox ID="txtBannerAciklama" CssClass="span11" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label">Banner Tarih :</label>
                                    <div class="controls">
                                        <asp:TextBox ID="txtTarihi" CssClass="span11" TextMode="Date" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label">Aktiflik :</label>
                                    <div class="controls">

                                        <asp:RadioButtonList ID="rblAktiflik" runat="server">
                                            <asp:ListItem Value="1">Aktif</asp:ListItem>
                                            <asp:ListItem Value="0">Pasif</asp:ListItem>
                                        </asp:RadioButtonList>
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label">Banner Resim :</label>
                                    <div class="controls">
                                        <asp:FileUpload ID="FileUpload1" runat="server" />
                                    </div>
                                </div>
                                <div class="form-actions">

                                    <asp:Button ID="btnYeni" runat="server" Text="Yeni Kayıt" OnClick="btnYeni_Click" CssClass="btn btn-info" />
                                    <asp:Button ID="btnKaydet" CssClass="btn btn-success pull-right" OnClick="btnKaydet_Click" runat="server" Text="Kaydet" />
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
                <div class="span6">
                    <div class="widget-box">
                        <div class="widget-title">
                            <span class="icon"><i class="icon-align-justify"></i></span>
                            <h5>Kampanya Bannerler</h5>
                        </div>
                        <div class="widget-content nopadding">
                            <asp:GridView ID="GridView1" CssClass="table table-bordered table-striped" runat="server" AutoGenerateColumns="false">
                                <Columns>
                                   
                                     <asp:BoundField DataField="BannerAciklama" HeaderText="Banner Açıklama" />
                                     <asp:BoundField DataField="BannerTarih" HeaderText="Tarih" />
                                     <asp:BoundField DataField="Aktiflik" HeaderText="Aktiflik Durumu" />
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                           <img src="/KampanyaResimleri/<%#Eval("BannerResim") %>" style="height:40px !important" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <asp:LinkButton ID="btnSil" CssClass="btn btn-danger btn-mini" runat="server"
                                                CommandArgument='<%# Eval("BannerID") %>' OnClick="btnSil_Click"
                                                OnClientClick="return confirm('Silmek istediğinizden emin misiniz?');">
                        Sil
                                            </asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <asp:LinkButton ID="btnDuzenle" CssClass="btn btn-warning btn-mini" runat="server"
                                                CommandArgument='<%# Eval("BannerID") %>' OnClick="btnDuzenle_Click">
                        Düzenle
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
