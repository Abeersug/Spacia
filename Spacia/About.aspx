<%@ Page Title="About" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="Spacia.About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="content-container">
        <div class="page-header">
            <h2>About Spacia</h2>
            <p>Your Premier Coworking Space Solution</p>
        </div>

        <div class="grid-container">
            <div class="card">
                <h3 class="text-primary mb-4">Our Mission</h3>
                <p>At Spacia, we believe in creating inspiring workspaces that foster creativity, collaboration, and productivity. Our mission is to provide professionals with flexible, modern, and well-equipped spaces to help them achieve their goals.</p>
            </div>

            <div class="card">
                <h3 class="text-primary mb-4">What We Offer</h3>
                <ul class="list-unstyled">
                    <li class="mb-4">✨ Modern workspaces with high-speed internet</li>
                    <li class="mb-4">☕ Fully equipped kitchen and coffee bar</li>
                    <li class="mb-4">🤝 Meeting rooms and event spaces</li>
                    <li class="mb-4">🔒 24/7 secure access for members</li>
                </ul>
            </div>

            <div class="card">
                <h3 class="text-primary mb-4">Our Values</h3>
                <p>We prioritize:</p>
                <ul class="list-unstyled">
                    <li class="mb-4">🌟 Excellence in service</li>
                    <li class="mb-4">🤝 Community building</li>
                    <li class="mb-4">💡 Innovation and creativity</li>
                    <li class="mb-4">🌱 Sustainability</li>
                </ul>
            </div>
        </div>

        <div class="card mt-4">
            <h3 class="text-primary mb-4 text-center">Visit Us Today</h3>
            <p class="text-center">Experience the perfect blend of comfort and productivity in our state-of-the-art facilities.</p>
            <div class="text-center mt-4">
                <asp:Button runat="server" Text="Book a Tour" CssClass="spacia-btn" OnClick="BookTour_Click" />
            </div>
        </div>
    </div>
</asp:Content>
