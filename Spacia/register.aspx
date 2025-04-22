<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="register.aspx.cs" Inherits="Spacia.register" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <p>
        HELLO!</p>
    <p>
        &nbsp;</p>
    <p>
        <asp:TextBox ID="TextBox1" runat="server" placeholder="Name" Height="31px" Width="300px" style ="border-redius: 20px; padding: 5px;" BorderColor="Silver" BorderWidth="2px"></asp:TextBox>
    </p>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="Name is required" ForeColor="#FF3300" style="font-size: xx-small"></asp:RequiredFieldValidator>
    <br />
    <p>
        <asp:TextBox ID="TextBox2" runat="server" placeholder="Email" Height="31px" Width="300px" style ="border-redius: 20px; padding: 5px;" BorderColor="Silver" BorderWidth="2px" OnTextChanged="TextBox2_TextChanged1" TextMode="Email"></asp:TextBox>
    </p>
    <p>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox2" Display="Dynamic" ErrorMessage="Email is required" ForeColor="#FF3300" style="font-size: xx-small"></asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBox2" Display="Dynamic" ErrorMessage="Invalid email format" ForeColor="#FF3300" style="font-size: xx-small" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
    </p>
    <p>
        &nbsp;</p>
    <p>
        <asp:TextBox ID="TextBox3" runat="server" placeholder="Password" Height="31px" Width="300px" style ="border-redius: 20px; padding: 5px;" BorderColor="Silver" BorderWidth="2px" TextMode="Password"></asp:TextBox>
    </p>
    <p>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox3" Display="Dynamic" ErrorMessage="Password is required" ForeColor="#FF3300" style="font-size: xx-small"></asp:RequiredFieldValidator>
    </p>
    <p>
        &nbsp;</p>
    <p>
        <asp:TextBox ID="TextBox4" runat="server" placeholder="Confirm Password" Height="31px" Width="300px" style ="border-redius: 20px; padding: 5px;" BorderColor="Silver" BorderWidth="2px" TextMode="Password"></asp:TextBox>
    </p>
    <p>
        <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="TextBox3" ControlToValidate="TextBox4" Display="Dynamic" ErrorMessage="Password not matched" ForeColor="#FF3300" style="font-size: xx-small"></asp:CompareValidator>
    </p>
    <p>
        &nbsp;</p>
    <p>
        <asp:TextBox ID="TextBox5" runat="server" placeholder="Phone" Height="31px" Width="300px" style ="border-redius: 20px; padding: 5px;" BorderColor="Silver" BorderWidth="2px" TextMode="Phone"></asp:TextBox>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>
    </p>
    <p>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBox5" Display="Dynamic" ErrorMessage="Phone is required" ForeColor="#FF3300" style="font-size: xx-small"></asp:RequiredFieldValidator>
    </p>
    <p>
        <asp:Button ID="Button1" runat="server" Height="53px" OnClick="Button1_Click" style="color: #FFFFFF; background-color: #1F4555" Text="Sign Up" Width="139px" />
    </p>
    <p>
        <asp:Label ID="Label1" runat="server"></asp:Label>
    </p>
</asp:Content>
