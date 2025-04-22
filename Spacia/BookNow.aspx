<%@ Page Title="Book Now" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="BookNow.aspx.cs" Inherits="Spacia.About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="content-container">
        <div class="page-header">
            <h2>Book Your Space</h2>
            <p>Find the perfect workspace for your needs</p>
        </div>

        <div class="grid-container">
            <div class="card">
                <h3 class="text-primary mb-4">Private Office</h3>
                <img src="Assets/office1.jpg" alt="Private Office" class="img-fluid mb-4" />
                <p>A dedicated private office for you and your team. Includes:</p>
                <ul class="list-unstyled">
                    <li class="mb-4">🔒 24/7 access</li>
                    <li class="mb-4">💺 Ergonomic furniture</li>
                    <li class="mb-4">🌐 High-speed internet</li>
                    <li class="mb-4">☕ Coffee and tea service</li>
                </ul>
                <div class="text-center mt-4">
                    <asp:Button runat="server" Text="Book Private Office" CssClass="spacia-btn" OnClick="BookPrivate_Click" />
                </div>
            </div>

            <div class="card">
                <h3 class="text-primary mb-4">Dedicated Desk</h3>
                <img src="Assets/office2.jpg" alt="Dedicated Desk" class="img-fluid mb-4" />
                <p>Your own desk in our shared workspace. Includes:</p>
                <ul class="list-unstyled">
                    <li class="mb-4">🔑 Personal locker</li>
                    <li class="mb-4">🖥️ Dual monitor setup</li>
                    <li class="mb-4">🎧 Quiet zones</li>
                    <li class="mb-4">📦 Mail handling</li>
                </ul>
                <div class="text-center mt-4">
                    <asp:Button runat="server" Text="Book Dedicated Desk" CssClass="spacia-btn" OnClick="BookDesk_Click" />
                </div>
            </div>

            <div class="card">
                <h3 class="text-primary mb-4">Meeting Room</h3>
                <img src="Assets/office3.jpg" alt="Meeting Room" class="img-fluid mb-4" />
                <p>Professional meeting spaces for your team. Includes:</p>
                <ul class="list-unstyled">
                    <li class="mb-4">📽️ Projector/TV</li>
                    <li class="mb-4">🎥 Video conferencing</li>
                    <li class="mb-4">📝 Whiteboard</li>
                    <li class="mb-4">🥤 Refreshments</li>
                </ul>
                <div class="text-center mt-4">
                    <asp:Button runat="server" Text="Book Meeting Room" CssClass="spacia-btn" OnClick="BookMeeting_Click" />
                </div>
            </div>
        </div>

        <div class="card mt-4">
            <h3 class="text-primary mb-4 text-center">Need Help Choosing?</h3>
            <p class="text-center">Contact our team for personalized assistance in finding the perfect workspace solution for you.</p>
            <div class="text-center mt-4">
                <asp:Button runat="server" Text="Contact Us" CssClass="spacia-btn" OnClick="Contact_Click" />
            </div>
        </div>
    </div>
</asp:Content>
