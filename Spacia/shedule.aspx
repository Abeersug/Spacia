<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="shedule.aspx.cs" Inherits="Spacia.shedule" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .schedule-container {
            max-width: 1000px;
            margin: 30px auto;
            background: #ffffff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
        }
        .schedule-title {
            text-align: center;
            font-size: 30px;
            margin-bottom: 25px;
            color: #333;
        }
        .gridview-custom {
            width: 100%;
            border-collapse: collapse;
        }
        .gridview-custom th {
            background-color: #09384c;
            color: white;
            padding: 12px;
            text-align: center;
        }
        .gridview-custom td {
            padding: 10px;
            border-bottom: 1px solid #ddd;
            text-align: center;
            vertical-align: middle;
        }
        .gridview-custom tr:hover {
            background-color: #f1f5f9;
        }
        .book-btn {
            background-color: #09384c;
            color: white;
            border: none;
            padding: 8px 18px;
            font-size: 16px;
            border-radius: 6px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        .book-btn:hover {
            background-color: #062631;
        }
    </style>

    <div class="schedule-container">
        <h1 class="schedule-title">Show Schedule For Services</h1>

        <asp:GridView ID="GridView1" runat="server" 
            CssClass="gridview-custom"
            BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" 
            CellPadding="4" DataSourceID="SqlDataSource1" ForeColor="Black" GridLines="Horizontal" 
            AutoGenerateColumns="False" DataKeyNames="AvailabilityID" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
            
            <Columns>
                <asp:BoundField DataField="AvailabilityID" HeaderText="Availability ID" InsertVisible="False" ReadOnly="True" SortExpression="AvailabilityID" Visible="false" />
                <asp:BoundField DataField="ServiceID" HeaderText="Service ID" SortExpression="ServiceID" Visible="false" />
                <asp:BoundField DataField="AvailabilityDate" HeaderText="Date" SortExpression="AvailabilityDate" />
                <asp:BoundField DataField="AvailabilityTime" HeaderText="Time" SortExpression="AvailabilityTime" />
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:Button ID="button1" runat="server" Text="Book" CssClass="book-btn"
                            CommandArgument='<%# Eval("AvailabilityID") %>' OnClick="button1_click" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
            SelectCommand="SELECT [AvailabilityID], [ServiceID], [AvailabilityDate], [AvailabilityTime] FROM [Availability] WHERE (([ServiceID] = @ServiceID) AND ([Available] = @Available))">
            <SelectParameters>
                <asp:QueryStringParameter Name="ServiceID" QueryStringField="ServiceID" Type="Int32" />
                <asp:Parameter DefaultValue="0" Name="Available" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
</asp:Content>
