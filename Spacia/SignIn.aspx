<%@ Page Title="Sign In" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SignIn.aspx.cs" Inherits="Spacia.SignIn" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="form-container">
        <div class="page-header">
            <h2>Sign In to your account</h2>
        </div>

        <div class="form-group" style="margin-bottom: 15px;">
            <label for="TextBox1">Email:</label>
            <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control" placeholder="Email"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="TextBox1" 
                ErrorMessage="Email is required" CssClass="validation-error" Display="Dynamic"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="TextBox1" 
                ErrorMessage="Invalid email format" ValidationExpression="^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$" 
                CssClass="validation-error" Display="Dynamic"></asp:RegularExpressionValidator>
        </div>

        <div class="form-group" style="margin-bottom: 15px;">
            <label for="TextBox2">Password:</label>
            <asp:TextBox ID="TextBox2" runat="server" TextMode="Password" CssClass="form-control" 
                placeholder="Password"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ControlToValidate="TextBox2" 
                ErrorMessage="Password is required" CssClass="validation-error" Display="Dynamic"></asp:RequiredFieldValidator>
        </div>

        <div class="form-group">
            <asp:Button ID="Button1" runat="server" Text="Sign In" OnClick="Button1_Click" 
                CssClass="spacia-btn" />
            <asp:Label ID="Label1" runat="server" CssClass="validation-error" 
                style="display: block; margin-top: 10px; text-align: center;" Visible="false"></asp:Label>
            <br />
<asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/register.aspx" style="display:block; text-align:center;">Don't have an Account? Register Now</asp:HyperLink>
            <br />
        </div>

    </div>
</asp:Content>
