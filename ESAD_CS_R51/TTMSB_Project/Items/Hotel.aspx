<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Hotel.aspx.cs" Inherits="TTMSB_Project.Items.Hotel" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">
    <div class="row">
        <div class="col">
            <asp:UpdateProgress ID="UpdateProgress1" runat="server">
                <ProgressTemplate>
                    <img src="../Images/bar.gif" width="100"/>
                </ProgressTemplate>
            </asp:UpdateProgress>
            <h2 class="text-center alert-info mt-3 mb-3">All the Hotel information</h2>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <asp:ListView ID="ListView1" runat="server" ItemPlaceholderID="itemHolder" InsertItemPosition="LastItem" DataKeyNames="hotelId" DataSourceID="SqlDataSource1">
                        <ItemTemplate>
                            <tr>
                                <td><%# Eval("hotelId") %></td>
                                <td><%# Eval("hotelName") %></td>
                                <td>
                                    <asp:Button ID="btnEdit" runat="server" Text="Edit" CommandName="Edit" CssClass="btn btn-outline-success btn-sm" CausesValidation="false" />
                                    <asp:Button ID="btnDelete" runat="server" Text="Delete" CssClass="btn btn-outline-danger btn-sm" CausesValidation="false" />
                                </td>
                            </tr>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <tr>
                                <td>
                                    <asp:Label ID="lblClientid" runat="server" Text='<%# Bind("hotelId") %>'></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtHotelName" CssClass="form-control" Text='<%# Bind("hotelName") %>' runat="server"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:Button ID="btnUpdate" runat="server" Text="Update" CommandName="Update" CssClass="btn btn-outline-secondary btn-sm" CausesValidation="false" />
                                    <asp:Button ID="btnCancel" runat="server" Text="Cancel" CommandName="Cancel" CssClass="btn btn-outline-warning btn-sm" CausesValidation="false" />
                                </td>
                            </tr>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <tr>
                                <td>Not Required</td>
                                <td>
                                    <asp:TextBox ID="txtHotelName" CssClass="form-control" Text='<%# Bind("hotelName") %>' runat="server"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:Button ID="btnInsert" runat="server" Text="Insert" CommandName="Insert" CssClass="btn btn-outline-primary btn-sm" CausesValidation="true" />
                                    <asp:Button ID="btnCancel" runat="server" Text="Cancel" CommandName="Cancel" CssClass="btn btn-outline-warning btn-sm" CausesValidation="false" />
                                </td>
                            </tr>
                        </InsertItemTemplate>
                        <LayoutTemplate>
                            <table class="table table-bordered">
                                <thead>
                                    <tr>
                                        <th>Id</th>
                                        <th>Name</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody id="itemHolder" runat="server"></tbody>
                            </table>
                        </LayoutTemplate>
                    </asp:ListView>
                </ContentTemplate>
            </asp:UpdatePanel>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:eviTTMSBCon %>" DeleteCommand="DELETE FROM [hotel] WHERE [hotelId] = @hotelId" InsertCommand="INSERT INTO [hotel] ([hotelName]) VALUES (@hotelName)" SelectCommand="SELECT * FROM [hotel]" UpdateCommand="UPDATE [hotel] SET [hotelName] = @hotelName WHERE [hotelId] = @hotelId">
                <DeleteParameters>
                    <asp:Parameter Name="hotelId" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="hotelName" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="hotelName" Type="String" />
                    <asp:Parameter Name="hotelId" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">
    <script src="../Scripts/jquery-3.6.1.js"></script>
    <script>
        $(document).ready(() => {
            $("input[name$='btnDelete']").click((evt) => {
                if (!confirm("Delete can't be possible for FK constraint!!!")) {
                    evt.preventDefault();
                }
            })
        });
    </script>
</asp:Content>
