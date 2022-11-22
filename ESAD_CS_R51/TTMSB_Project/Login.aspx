<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="TTMSB_Project.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">
    <h2 class="display-6 text-center">Log in first</h2>
    <div class="row">
        <div class="col">
            <h2>Please login here....</h2>
            <asp:Panel ID="Panel1" runat="server" CssClass="alert alert-warning" Visible="false">
                <h5>Login failed!!!!</h5>
                <p>Failed to login user!!</p>
            </asp:Panel>
            <div class="form-group row">
                <label class="col-form-label col-2 text-right">Username</label>
                <asp:TextBox ID="userName" runat="server" CssClass="form-control col-6"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Username is Required!!!" ForeColor="Red" ControlToValidate="userName"></asp:RequiredFieldValidator>
            </div>
            <div class="form-group row">
                <label class="col-form-label col-2 text-right">Password</label>
                <asp:TextBox ID="password" TextMode="Password" runat="server" CssClass="form-control col-6"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Password is Required!!!" ForeColor="Red" ControlToValidate="password"></asp:RequiredFieldValidator>
            </div>
            <div class="form-group row">
                <div class="offset-2">
                    <asp:Button ID="login" runat="server" Text="Login" class="btn btn-primary" OnClick="login_Click"/>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">
</asp:Content>
