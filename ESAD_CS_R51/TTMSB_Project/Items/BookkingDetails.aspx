<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="BookkingDetails.aspx.cs" Inherits="TTMSB_Project.Items.BookkingDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">
    <h2 class="text-center alert-info mt-3 mb-3">Booking Information</h2>
    <a class="mb-2 btn btn-primary" href="AddBookinDetails.aspx"><i class="fa fa-plus-circle"></i>Add New</a>
    <div class="row">
        <div class="col">
            <asp:UpdateProgress ID="UpdateProgress1" runat="server">
                <ProgressTemplate>
                    <img src="../Images/bar.gif" width="100" />
                </ProgressTemplate>
            </asp:UpdateProgress>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
<asp:GridView ID="GridView1" runat="server" CssClass="table table-bordered" BackColor="#dff4ee" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="bookingId" DataSourceID="SqlDataSource1">
                <Columns>
                    <asp:BoundField DataField="bookingId" HeaderText="Booking Id" InsertVisible="False" ReadOnly="True" SortExpression="bookingId" />
                    <asp:TemplateField HeaderText="Client Name" SortExpression="clientId">
                        <EditItemTemplate>
                            <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-control" SelectedValue='<%# Bind("clientId") %>' DataSourceID="SqlDataSource1" DataTextField="clientName" DataValueField="clientId"></asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:eviTTMSBCon %>" SelectCommand="SELECT [clientId], [clientName] FROM [client]"></asp:SqlDataSource>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("clientName") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Spot Name" SortExpression="spotId">
                        <EditItemTemplate>
                            <asp:DropDownList ID="DropDownList2" runat="server" CssClass="form-control" SelectedValue='<%# Bind("spotId") %>' DataSourceID="SqlDataSource2" DataTextField="spotName" DataValueField="spotId"></asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:eviTTMSBCon %>" SelectCommand="SELECT * FROM [spot]"></asp:SqlDataSource>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("spotName") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="hotel Name" SortExpression="hotelId">
                        <EditItemTemplate>
                            <asp:DropDownList ID="DropDownList3" runat="server" CssClass="form-control" SelectedValue='<%# Bind("hotelId") %>' DataSourceID="SqlDataSource3" DataTextField="hotelName" DataValueField="hotelId"></asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:eviTTMSBCon %>" SelectCommand="SELECT * FROM [hotel]"></asp:SqlDataSource>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("hotelName") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Transport Name" SortExpression="transpotId">
                        <EditItemTemplate>
                            <asp:DropDownList ID="DropDownList4" runat="server" CssClass="form-control" SelectedValue='<%# Bind("transpotId") %>' DataSourceID="SqlDataSource4" DataTextField="transportName" DataValueField="transpotId"></asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:eviTTMSBCon %>" SelectCommand="SELECT * FROM [transportation]"></asp:SqlDataSource>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label4" runat="server" Text='<%# Bind("transportName") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Tour Duration" SortExpression="tourDuration">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox5" runat="server" CssClass="form-control" Text='<%# Bind("tourDuration") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label5" runat="server" Text='<%# Bind("tourDuration") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Tour Cost" SortExpression="tourCost">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox6" runat="server" CssClass="form-control" Text='<%# Bind("tourCost") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label6" runat="server" Text='<%# Bind("tourCost") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Traveller Number" SortExpression="travellerNumber">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox7" runat="server" CssClass="form-control" Text='<%# Bind("travellerNumber") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label7" runat="server" Text='<%# Bind("travellerNumber") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Action" ShowHeader="False">
                        <EditItemTemplate>
                                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" Text="Update" CssClass="btn btn-secondary"><i class="fa fa-refresh"></i></asp:LinkButton>
                            &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" CssClass="btn btn-warning"><i class="fa fa-times"></i></asp:LinkButton>

                        </EditItemTemplate>
                        <ItemTemplate>
                                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" CssClass="btn btn-info"><i class="fa fa-pencil"></i></asp:LinkButton>
                                    &nbsp;
                                    <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" CssClass="btn btn-danger"><i class="fa fa-trash"></i></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
                </ContentTemplate>
            </asp:UpdatePanel>

            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:eviTTMSBCon %>" DeleteCommand="DELETE FROM [bookingDetails] WHERE [bookingId] = @bookingId" InsertCommand="INSERT INTO [bookingDetails] ([clientId], [spotId], [hotelId], [transpotId], [tourDuration], [tourCost], [travellerNumber]) VALUES (@clientId, @spotId, @hotelId, @transpotId, @tourDuration, @tourCost, @travellerNumber)" SelectCommand="SELECT b.bookingId,c.clientName,c.clientId,s.spotName,s.spotId,h.hotelName,h.hotelId,t.transportName,t.transpotId,b.tourDuration,b.tourCost,b.travellerNumber FROM bookingDetails b INNER JOIN client c ON c.clientId=b.clientId INNER JOIN spot s ON s.spotId=b.spotId INNER JOIN hotel h ON h.hotelId=b.spotId INNER JOIN transportation t ON t.transpotId=b.transpotId" UpdateCommand="UPDATE [bookingDetails] SET [clientId] = @clientId, [spotId] = @spotId, [hotelId] = @hotelId, [transpotId] = @transpotId, [tourDuration] = @tourDuration, [tourCost] = @tourCost, [travellerNumber] = @travellerNumber WHERE [bookingId] = @bookingId">
                <DeleteParameters>
                    <asp:Parameter Name="bookingId" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="clientId" Type="Int32" />
                    <asp:Parameter Name="spotId" Type="Int32" />
                    <asp:Parameter Name="hotelId" Type="Int32" />
                    <asp:Parameter Name="transpotId" Type="Int32" />
                    <asp:Parameter Name="tourDuration" Type="Int32" />
                    <asp:Parameter Name="tourCost" Type="Decimal" />
                    <asp:Parameter Name="travellerNumber" Type="Int32" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="clientId" Type="Int32" />
                    <asp:Parameter Name="spotId" Type="Int32" />
                    <asp:Parameter Name="hotelId" Type="Int32" />
                    <asp:Parameter Name="transpotId" Type="Int32" />
                    <asp:Parameter Name="tourDuration" Type="Int32" />
                    <asp:Parameter Name="tourCost" Type="Decimal" />
                    <asp:Parameter Name="travellerNumber" Type="Int32" />
                    <asp:Parameter Name="bookingId" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">
</asp:Content>
