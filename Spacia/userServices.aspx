<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="userServices.aspx.cs" Inherits="Spacia.userServices" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h1 class="text-center" style="font-size: xx-large">Our Services</h1>
    <div align="center">
    <asp:DataList ID="DataList1" runat="server" RepeatColumns="2" RepeatDirection="Horizontal" CellPadding="30" CellSpacing="30" DataKeyField="ServiceID" DataSourceID="SqlDataSource1" Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" HorizontalAlign="Center" OnSelectedIndexChanged="DataList1_SelectedIndexChanged1">
        <ItemTemplate>
            <div style="width: 350px; padding: 20px; border: 1px solid #ddd; border-radius: 10px; box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1); text-align: center; background-color: #fff;">
                <h2 style="font-size: 24px; margin-bottom: 15px;">
                    <asp:Label ID="ServiceNameLabel0" runat="server" Text='<%# Eval("ServiceName") %>' />
                </h2>
                <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("ServicePhoto") %>' Width="100%" Height="200px" style="border-radius: 8px; object-fit: cover;" />
                <div style="margin-top: 15px; font-size: 18px;">
                    <asp:Label ID="PriceLabel0" runat="server" Text='<%# Eval("Price") %>' /> SR
                </div>
                <div style="font-size: 16px; color: #555; margin-top: 5px;">
                    Duration: <asp:Label ID="DurationLabel0" runat="server" Text='<%# Eval("Duration") %>' />
                </div>
                <p style="font-size: 14px; color: #666; margin-top: 10px;">
                    <asp:Label ID="DescriptionLabel0" runat="server" Text='<%# Eval("Description") %>' />
                </p>
                <a href="shedule.aspx?ServiceID=<%# Eval("ServiceID") %>" style="display: inline-block; margin-top: 10px; color: #007bff; text-decoration: none; font-weight: bold;">Book Now</a>
            </div>
        </ItemTemplate>
    </asp:DataList>
    </div>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Services]"></asp:SqlDataSource>
</asp:Content>
