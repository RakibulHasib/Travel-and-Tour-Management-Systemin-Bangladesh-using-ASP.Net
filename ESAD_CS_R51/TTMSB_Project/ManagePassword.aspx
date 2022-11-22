<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ManagePassword.aspx.cs" Inherits="TTMSB_Project.ManagePassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">
    <div class="row">
        <div class="col">
            <h2 class="display-4">Manage Password</h2>
            <p>Change Password Form</p>
            <asp:Panel ID="Panel1" runat="server" CssClass="alert alert-warning" Visible="false">
                <h5>Failed!!!!</h5>
                <p>Failed to change password!!</p>
            </asp:Panel>
            <div class="form-group row">
                <label class="col-form-label col-2 text-right">Current Password</label>
                <asp:TextBox ID="currentPassword" runat="server" CssClass="form-control col-6"></asp:TextBox>
            </div>
            <div class="form-group row">
                <label class="col-form-label col-2 text-right">New Password</label>
                <asp:TextBox ID="newPassword" TextMode="Password" runat="server" CssClass="form-control col-6"></asp:TextBox>
            </div>
            <div class="form-group row">
                <label class="col-form-label col-2 text-right">Confirm New Password</label>
                <asp:TextBox ID="confirmNewPassword" TextMode="Password" runat="server" CssClass="form-control col-6"></asp:TextBox>
            </div>
            <div class="form-group row">
                <div class="offset-2">
                    <asp:Button ID="changePassword" runat="server" Text="Change Password" class="btn btn-primary" OnClick="changePassword_Click"/>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">
</asp:Content>
