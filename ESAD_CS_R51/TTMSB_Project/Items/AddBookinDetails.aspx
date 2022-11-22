<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddBookinDetails.aspx.cs" Inherits="TTMSB_Project.Items.AddBookinDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        #goto {
            margin-left: 180px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">
    <h2 class="text-center alert-info mt-3 mb-3">Add Booking Details</h2>
    <a id="goto" class="mb-2 btn btn-primary" href="BookkingDetails.aspx"><i class="fa fa-plus-circle"></i>Go To Booking Details</a>
    <div class="row">
        <div class="offset-2 col-8">
            <asp:UpdateProgress ID="UpdateProgress1" runat="server">
                <ProgressTemplate>
                    <img src="../Images/bar.gif" width="100" />
                </ProgressTemplate>
            </asp:UpdateProgress>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <asp:DetailsView ID="DetailsView1" runat="server" CssClass="table table-bordered alert-info" AutoGenerateRows="False" DataKeyNames="bookingId" DataSourceID="SqlDataSource1" DefaultMode="Insert">
                        <Fields>
                            <asp:BoundField DataField="bookingId" HeaderText="bookingId" InsertVisible="False" ReadOnly="True" SortExpression="bookingId" />
                            <asp:TemplateField HeaderText="Client Name" SortExpression="clientId">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("clientId") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    <asp:DropDownList ID="DropDownList1" CssClass="table table-bordered" runat="server" SelectedValue='<%# Bind("clientId") %>' DataSourceID="SqlDataSource1" DataTextField="clientName" DataValueField="clientId"></asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:eviTTMSBCon %>" SelectCommand="SELECT [clientId], [clientName] FROM [client]"></asp:SqlDataSource>
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("clientId") %>'></asp:Label>
                                </ItemTemplate>
                                <ControlStyle ForeColor="Black" />
                                <HeaderStyle ForeColor="Black" Height="20px" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Spot Name" SortExpression="spotId">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("spotId") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    <asp:DropDownList ID="DropDownList2" CssClass="table table-bordered" SelectedValue='<%# Bind("spotId") %>' runat="server" DataSourceID="SqlDataSource2" DataTextField="spotName" DataValueField="spotId"></asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:eviTTMSBCon %>" SelectCommand="SELECT * FROM [spot]"></asp:SqlDataSource>
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("spotId") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Hotel Name" SortExpression="hotelId">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("hotelId") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    <asp:DropDownList ID="DropDownList3" CssClass="table table-bordered" runat="server" SelectedValue='<%# Bind("hotelId") %>' DataSourceID="SqlDataSource3" DataTextField="hotelName" DataValueField="hotelId"></asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:eviTTMSBCon %>" SelectCommand="SELECT * FROM [hotel]"></asp:SqlDataSource>
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("hotelId") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Transportation Name" SortExpression="transpotId">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("transpotId") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    <asp:DropDownList ID="DropDownList4" CssClass="table table-bordered" runat="server" SelectedValue='<%# Bind("transpotId") %>' DataSourceID="SqlDataSource4" DataTextField="transportName" DataValueField="transpotId"></asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:eviTTMSBCon %>" SelectCommand="SELECT * FROM [transportation]"></asp:SqlDataSource>
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("transpotId") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Tour Duration" SortExpression="tourDuration">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("tourDuration") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    <asp:TextBox ID="TextBox5" runat="server" CssClass="table table-bordered" Text='<%# Bind("tourDuration") %>'></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Tour Duration is Requird!!!" ForeColor="Red" ControlToValidate="TextBox5"></asp:RequiredFieldValidator>
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("tourDuration") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Tour Cost" SortExpression="tourCost">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("tourCost") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    <asp:TextBox ID="TextBox6" runat="server" CssClass="table table-bordered" Text='<%# Bind("tourCost") %>'></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Tour Cost is Requird!!!" ForeColor="Red" ControlToValidate="TextBox6"></asp:RequiredFieldValidator>
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label6" runat="server" Text='<%# Bind("tourCost") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Traveller Number" SortExpression="travellerNumber">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("travellerNumber") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    <asp:TextBox ID="TextBox7" runat="server" CssClass="table table-bordered" Text='<%# Bind("travellerNumber") %>'></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Traveller Number is Requird!!!" ForeColor="Red" ControlToValidate="TextBox7"></asp:RequiredFieldValidator>
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label7" runat="server" Text='<%# Bind("travellerNumber") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField ShowHeader="False">
                                <InsertItemTemplate>
                                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" class="btn btn-success"><i class="fa fa-save"></i></asp:LinkButton>
                                    &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" CssClass="btn btn-warning"><i class="fa fa-times"></i></asp:LinkButton>
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="New" Text="New"></asp:LinkButton>
                                </ItemTemplate>
                                <ControlStyle CssClass="btn btn-success" />
                            </asp:TemplateField>
                        </Fields>
                    </asp:DetailsView>
                </ContentTemplate>
            </asp:UpdatePanel>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:eviTTMSBCon %>" DeleteCommand="DELETE FROM [bookingDetails] WHERE [bookingId] = @bookingId" InsertCommand="INSERT INTO [bookingDetails] ([clientId], [spotId], [hotelId], [transpotId], [tourDuration], [tourCost], [travellerNumber]) VALUES (@clientId, @spotId, @hotelId, @transpotId, @tourDuration, @tourCost, @travellerNumber)" SelectCommand="SELECT * FROM [bookingDetails]" UpdateCommand="UPDATE [bookingDetails] SET [clientId] = @clientId, [spotId] = @spotId, [hotelId] = @hotelId, [transpotId] = @transpotId, [tourDuration] = @tourDuration, [tourCost] = @tourCost, [travellerNumber] = @travellerNumber WHERE [bookingId] = @bookingId">
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
