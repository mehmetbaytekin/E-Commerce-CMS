<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Site1.Master" AutoEventWireup="true" CodeBehind="Kategoriler.aspx.cs" Inherits="ETicaret.Admin.Kategoriler" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div id="content">
        <div id="content-header">
            <div id="breadcrumb">
                <a href="index.html" title="Go to Home" class="tip-bottom">
                    <i class="icon-home"></i>Ana Sayfa</a>
                <a href="#" class="current">Kategoriler</a>
            </div>

        </div>
        <div class="container-fluid">

            <div class="row-fluid">
                <div class="span6">
                    <div class="widget-box">
                        <div class="widget-title">
                            <span class="icon"><i class="icon-align-justify"></i></span>
                            <h5>Kategori Ekle</h5>
                        </div>
                        <div class="widget-content nopadding">
                            <div class="form-horizontal">
                                <div class="control-group">
                                    <asp:HiddenField ID="hdnID" runat="server" Value="0" />
                                    <label class="control-label">Kategori Adı :</label>
                                    <div class="controls">
                                        <asp:TextBox ID="txtKategoriAdi" CssClass="span11" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="form-actions">
                                    <asp:Button ID="btnKaydet" CssClass="btn btn-success" runat="server" Text="Kaydet"
                                        OnClick="btnKaydet_Click" />
                                    <asp:Button ID="btnYeni" runat="server" Text="Yeni Kayıt" CssClass="btn btn-info pull-right" OnClick="btnYeni_Click" />

                                </div>

                            </div>
                        </div>
                    </div>
                </div>
                <div class="span6">
                    <div class="widget-box">
                        <div class="widget-title">
                            <span class="icon"><i class="icon-align-justify"></i></span>
                            <h5>Kategoriler</h5>
                        </div>
                        <div class="widget-content nopadding">
                            <asp:GridView ID="GridView1" CssClass="table table-bordered table-striped" runat="server" AutoGenerateColumns="false">
                                <Columns>
                                    <asp:BoundField DataField="KategoriAdi" HeaderText="Kategori Adı" />
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
                                            <asp:LinkButton ID="btnDuzenle" CssClass="btn btn-warning btn-mini" runat="server"
                                                CommandArgument='<%# Eval("ID") %>' OnClick="btnDuzenle_Click">
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
