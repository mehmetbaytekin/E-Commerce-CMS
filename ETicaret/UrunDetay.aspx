<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="UrunDetay.aspx.cs" Inherits="ETicaret.UrunDetay" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   
    <div class="span9">
        <ul class="breadcrumb">
            <li><a href="/">Ana Sayfa</a> <span class="divider">/</span></li>
            <li>
                <asp:HiddenField ID="hdnYorumID" runat="server" />

                <asp:LinkButton ID="lnkKategori" runat="server"></asp:LinkButton><span class="divider">/</span></li>
            <li class="active">
                <asp:Literal ID="ltlUrunAdi" runat="server"></asp:Literal></li>
        </ul>
        <div class="row">
            <div id="gallery" class="span3">
                <asp:LinkButton ID="lnkAnaResim" runat="server"></asp:LinkButton>
                <div id="differentview" class="moreOptopm carousel slide">
                    <div class="carousel-inner">
                        <div class="item active">
                            <asp:Repeater ID="rptUrunResimleri" runat="server">
                                <ItemTemplate>
                                    <a href="UrunResimleri/<%# Eval("Resim") %>">
                                        <img style="width: 29%" src="UrunResimleri/<%#Eval("Resim") %>" alt="" /></a>
                                </ItemTemplate>
                            </asp:Repeater>
                        </div>

                    </div>
                    <!--  
			  <a class="left carousel-control" href="#myCarousel" data-slide="prev">‹</a>
              <a class="right carousel-control" href="#myCarousel" data-slide="next">›</a> 
			  -->
                </div>

            </div>
            <div class="span6">

                <h5>
                    <asp:Literal ID="ltlUrunMarkasi" runat="server"></asp:Literal></h5>
                <h3>
                    <asp:Literal ID="txtUrunAdi" runat="server"></asp:Literal></h3>
                <small>
                    <asp:Literal ID="ltlUrunAciklama" runat="server"></asp:Literal></small>
                <hr class="soft" />
                <div class="form-horizontal qtyFrm">
                    <div class="control-group">
                        <label class="control-label">
                            <span>₺
                            <asp:Literal ID="txtUrunFiyati" runat="server"></asp:Literal></span></label>
                        <div class="controls">
                            <asp:TextBox ID="txtMiktar" runat="server" TextMode="Number" CssClass="span1" Text="1"></asp:TextBox>
                            <br />
                                                                                                           
                           <asp:TextBox ID="txtYorum" runat="server" TextMode="MultiLine"  CssClass="span4 pull-right"></asp:TextBox>
                             <asp:TemplateField>
                                    <ItemTemplate>
                                      <asp:LinkButton  ID="YorumEkle" runat="server" CssClass="btn btn-medium btn-danger pull-right" OnClick="YorumEkle_Click" CommandArgument='<%# Eval("UrunID") %>'>Yorum Yap</asp:LinkButton>
                              </ItemTemplate>
                                          </asp:TemplateField>
                                    
                        </div>
        </div>
    </div>

    <hr class="soft" />
    <h4>Stokta
                    <asp:Literal ID="ltlStokMiktari" runat="server"></asp:Literal>
        ürün var.</h4>

    </div>
            <asp:Button ID="btnSepeteEkle" CssClass="btn btn-large btn-primary pull-right" runat="server" Text="Sepete Ekle"
                                OnClick="btnSepeteEkle_Click" />      
            <div class="span9">
                <ul id="productDetail" class="nav nav-tabs">   
                    <li><a href="#profile" data-toggle="tab">Yorumlar</a></li>
                </ul>
                <div id="myTabContent" class="tab-content">
                    <div class="tab-pane active" id="profile">
                        <asp:Repeater ID="Rptyorumlar" runat="server">
                            <ItemTemplate>
                             <tr>
                           <td><h4><%# Eval("Ad") %></h4></td>
                            <td><%# Eval("Yorum") %></td></tr><br />
                                 </ItemTemplate>
                        </asp:Repeater>
                       <%-- <h4> <asp:Literal ID="ltlYorumAd" runat="server"></asp:Literal></h4>
                                <asp:Literal ID="ltlYorum" runat="server"></asp:Literal>--%>
                          <br class="clr"> 
                    </div>
                </div>
            </div>

    </div>
    </div>
</asp:Content>
