<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Site1.Master" AutoEventWireup="true" CodeBehind="Urunler.aspx.cs" Inherits="ETicaret.Admin.Urunler" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:HiddenField ID="hdnID" runat="server" Value="0" />
    <asp:HiddenField ID="hdnResimID" runat="server" Value="0" />

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
                <div class="span12">
                    <div class="widget-box">
                        <div class="widget-title">
                            <span class="icon"><i class="icon-align-justify"></i></span>
                            <h5>Ürün Ekle</h5>
                        </div>
                        <div class="widget-content nopadding">
                            <div class="form-horizontal">
                                <div class="span6">
                                    <div class="control-group">
                                        <label class="control-label">Ürün Adı :</label>
                                        <div class="controls">
                                            <asp:TextBox ID="UrunAdi" CssClass="span11" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="control-group">
                                        <label class="control-label">Ürün Kategori :</label>
                                        <div class="controls">
                                            <asp:DropDownList ID="Kategori" CssClass="span11" runat="server"></asp:DropDownList>
                                        </div>
                                    </div>
                                    <div class="control-group">
                                        <label class="control-label">Ürün Markası :</label>
                                        <div class="controls">
                                            <asp:TextBox ID="Marka" CssClass="span11" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="control-group">
                                        <label class="control-label">Ürün Fiyatı :</label>
                                        <div class="controls">
                                            <asp:TextBox ID="Fiyat" CssClass="span11" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="span6">
                                    <div class="control-group">
                                        <label class="control-label">İndirim Oranı :</label>
                                        <div class="controls">
                                            <asp:TextBox ID="Indirim" CssClass="span11" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="control-group">
                                        <label class="control-label">Stok Miktarı :</label>
                                        <div class="controls">
                                            <asp:TextBox ID="StokMiktari" CssClass="span11" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="control-group">
                                        <label class="control-label">Açıklama :</label>
                                        <div class="controls">
                                            <asp:TextBox ID="Aciklama" CssClass="span11" runat="server" TextMode="MultiLine"></asp:TextBox>
                                        </div>
                                    </div>

                                </div>
                                <div class="clearfix"></div>
                                <div class="form-actions">
                                    <asp:Button ID="Kaydet" runat="server" Text="Kaydet" CssClass="btn btn-success" OnClick="Kaydet_Click" />
                                    <asp:Button ID="Button1" runat="server" Text="Yeni Kayıt" CssClass="btn btn-info pull-right" OnClick="Button1_Click" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>


            <div class="row-fluid">
                <div class="span12">
                    <div class="widget-box">
                        <div class="widget-title">
                            <span class="icon"><i class="icon-align-justify"></i></span>
                            <h5>Resim Ekle</h5>
                        </div>
                        <div class="widget-content nopadding">
                            <div class="form-horizontal">

                                    <div class="control-group">
                                        <asp:Image ID="Image1" runat="server" />
                                    </div>

                                    <div class="control-group">
                                        <label class="control-label">Resim :</label>
                                        <div class="controls">
                                            <asp:FileUpload ID="FileUpload1" runat="server" />
                                        </div>
                                    </div>

                                    <div class="control-group">
                                        <label class="control-label">Vitrin :</label>
                                        <div class="controls">
                                            <asp:CheckBox ID="chkVitrin" runat="server" />
                                        </div>
                                    </div>
                                    
                                    <div class="control-group">
                                        <label class="control-label"></label>
                                        <div class="controls">
                                            <asp:Button ID="btnResimUpload" runat="server"
                                                Text="Resim Yükle" OnClick="btnResimUpload_Click" />
                                        </div>
                                    </div>
                                    
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <asp:Repeater ID="rptResimler" runat="server">
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton2" runat="server" 
                        CommandArgument='<%# Eval("ID") %>' OnClick="LinkButton2_Click">
                        <img src='/UrunResimleri/<%# Eval("Resim") %>' style="height: 50px;" />
                    </asp:LinkButton>
                </ItemTemplate>
            </asp:Repeater>

            <div class="row-fluid">
                <div class="span12">
                    <div class="widget-box">
                        <div class="widget-title">
                            <span class="icon"><i class="icon-align-justify"></i></span>
                            <h5>Ürünler</h5>
                        </div>
                        <div class="widget-content nopadding">
                            <div class="table-responsive">
                                <asp:GridView ID="GridView1" runat="server" 
                                    AutoGenerateColumns="false"
                                    CssClass="table table-bordered table-striped">
                                    <Columns>
                                        <asp:BoundField DataField="UrunAdi" HeaderText="Ürün Adı" />
                                        <asp:BoundField DataField="KategoriAdi" HeaderText="Ürün Kategorisi" />
                                        <asp:BoundField DataField="StokMiktari" HeaderText="Stok Miktarı" />
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <asp:LinkButton ID="LinkButton1" runat="server" 
                                                    CommandArgument='<%# Eval("ID") %>' 
                                                    CssClass="btn btn-info btn-mini" 
                                                    OnClick="LinkButton1_Click">Düzenle</asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <asp:LinkButton ID="btnSil" runat="server" 
                                                    CommandArgument='<%# Eval("ID") %>' 
                                                    CssClass="btn btn-info btn-mini" 
                                                    OnClientClick="return confirm('Silmek istediğinizden emin misiniz?');"
                                                    OnClick="btnSil_Click">Sil</asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <asp:LinkButton ID="btnResim" runat="server" 
                                                    CommandArgument='<%# Eval("ID") %>' 
                                                    CssClass="btn btn-info btn-mini" 
                                                    OnClick="btnResim_Click">Resimler</asp:LinkButton>
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
    </div>







</asp:Content>
