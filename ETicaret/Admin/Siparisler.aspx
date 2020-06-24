<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Site1.Master" AutoEventWireup="true" CodeBehind="Siparisler.aspx.cs" Inherits="ETicaret.Admin.Siparisler" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  <div id="content">
        <div id="content-header">
            <div id="breadcrumb">
                <a href="index.html" title="Go to Home" class="tip-bottom">
                    <i class="icon-home"></i>Ana Sayfa</a>
                <a href="#" class="current">Verilen Siparişler</a>
            </div>

        </div>
        <div class="container-fluid">

            <div class="row-fluid">
                <div class="span6">
                    <div class="widget-box">
                        <div class="widget-title">
                            <span class="icon"><i class="icon-align-justify"></i></span>
                            <h5>Sipariş Düzenle</h5>
                            <asp:HiddenField ID="hdnID" runat="server" Value="0" />
                        </div>
                        <div class="widget-content nopadding">
                            <div class="form-horizontal">
                            
                                </div>  
                                 <div class="control-group">
                                    <label class="control-label">Siparis Durumu :</label>
                                    <div class="controls">
                                        <asp:DropDownList ID="ddlSiparisDurumu" runat="server"></asp:DropDownList>
                                    </div>
                                </div>     
                                <div class="form-actions">
                                    <asp:Button ID="btnKaydet" CssClass="btn btn-success pull-right" OnClick="btnKaydet_Click" runat="server" Text="Güncelle" />
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
                <div class="span6">
                    <div class="widget-box">
                        <div class="widget-title">
                            <span class="icon"><i class="icon-align-justify"></i></span>
                            <h5>Verilen Siparişler</h5>
                        </div>
                        <div class="widget-content nopadding">
                            <asp:GridView ID="GridView1" CssClass="table table-bordered table-striped" runat="server" AutoGenerateColumns="false">
                                <Columns>     
                                    <asp:BoundField DataField="ID" HeaderText="Sipariş No" />
                                     <asp:BoundField DataField="Ad" HeaderText="Müşteri Adı" />
                                     <asp:BoundField DataField="UrunAdi" HeaderText="Ürün Adi" />
                                    <asp:BoundField DataField="Tarih" HeaderText="Sipariş Tarihi" />
                                     <asp:BoundField DataField="SiparisDurumu" HeaderText="Sipariş Durumu" />
                                
                                    
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
