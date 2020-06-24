<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Site1.Master" AutoEventWireup="true" CodeBehind="Uyeler.aspx.cs" Inherits="ETicaret.Admin.Uyeler" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="content">
        <div id="content-header">
            <div id="breadcrumb">
                <a href="default.aspx" title="Go to Home" class="tip-bottom">
                    <i class="icon-home"></i>Ana Sayfa</a>
                <a href="#" class="current">Üyeler</a>
            </div>

        </div>
        <div class="container-fluid">

            <div class="row-fluid">
                <div class="span6">
                    <div class="widget-box">
                        <div class="widget-title">
                            <span class="icon"><i class="icon-align-justify"></i></span>
                            <h5>Üyeler</h5>
                        </div>
                        <div class="widget-content nopadding">
                            <asp:GridView ID="GridView1" CssClass="table table-bordered table-striped" runat="server" AutoGenerateColumns="false">
                                <Columns>

                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <%# Eval("Ad") %> <%# Eval("Soyad") %>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <asp:LinkButton ID="btnSil" CssClass="btn btn-danger btn-mini" runat="server"
                                                CommandArgument='<%# Eval("ID") %>' OnClick="btnSil_Click"
                                                OnClientClick="return confirm('Silmek istediğinizden emin misiniz?');">
                        Üyeliğini sil
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
