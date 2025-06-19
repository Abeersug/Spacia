<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="booking.aspx.cs" Inherits="Spacia.booking" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .booking-container {
            max-width: 900px;
            margin: 30px auto;
            background: #ffffff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
        }
        .booking-title {
            text-align: center;
            font-size: 30px;
            margin-bottom: 20px;
            color: #333;
        }
        .detailsview-custom {
            width: 100%;
            border-collapse: collapse;
        }
        .detailsview-custom th, .detailsview-custom td {
            padding: 12px;
            border-bottom: 1px solid #ddd;
            text-align: center;
            vertical-align: middle;
        }
        .detailsview-custom th {
            background-color: #f4f6f9;
            font-weight: bold;
        }
        .book-button {
            display: inline-block;
            margin-top: 20px;
            padding: 15px 30px;
            background-color: #09384c; /* اللون الجديد */
            color: white;
            font-size: 18px;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        .book-button:hover {
            background-color: #062631; 
        }
        .service-photo {
            max-width: 400px; 
            display: block;
            margin: 0 auto; 
            border-radius: 10px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
        }
    </style>

    <div class="booking-container">
        <h1 class="booking-title">Book Appointment</h1>

        <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" 
            DataKeyNames="AvailabilityID,ServiceID" DataSourceID="SqlDataSource1" 
            CssClass="detailsview-custom" GridLines="None">
            <Fields>
                <asp:BoundField DataField="AvailabilityDate" HeaderText="Date" />
                <asp:BoundField DataField="AvailabilityTime" HeaderText="Time" />
                <asp:BoundField DataField="Duration" HeaderText="Duration" />
                <asp:BoundField DataField="ServiceName" HeaderText="Service Name" />
                <asp:BoundField DataField="Description" HeaderText="Description" />
                <asp:BoundField DataField="Price" HeaderText="Price" />
                <asp:TemplateField HeaderText="Service Photo">
                    <ItemTemplate>
                        <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("ServicePhoto") %>' CssClass="service-photo" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Fields>
        </asp:DetailsView>

        <asp:Button ID="Button1" runat="server" Text="Book" CssClass="book-button" OnClick="Button1_Click" />
        
<asp:Label ID="Label1" runat="server" style="color: lime;"></asp:Label>
        
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
            SelectCommand="SELECT Availability.AvailabilityID, Services.ServiceID, Availability.AvailabilityDate, Availability.AvailabilityTime, Services.Duration, Services.ServiceName, Services.Description, Services.Price, Services.ServicePhoto FROM Availability INNER JOIN Services ON Availability.ServiceID = Services.ServiceID WHERE (Availability.AvailabilityID = @x)">
            <SelectParameters>
                <asp:QueryStringParameter Name="x" QueryStringField="id" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
</asp:Content>
