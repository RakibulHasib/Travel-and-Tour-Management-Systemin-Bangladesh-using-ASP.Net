<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Client.aspx.cs" Inherits="TTMSB_Project.Items.Client" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        #goto {
            margin-left: 690px;
        }
    </style>
    <a href="Client.aspx">Client.aspx</a>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">
    <h2 class="text-center  mt-3 mb-3">All the client information</h2>
    <a id="goto" class="mb-2 btn btn-primary" href="ClientView.aspx"><i class="fa fa-plus-circle"></i>Go To Client Details</a>
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" />
    <div class="row">
        <div class="offset-2 col-8">
            <asp:DetailsView ID="DetailsView1" runat="server" CssClass="table table-bordered" AutoGenerateRows="False" DataKeyNames="clientId" DataSourceID="SqlDataSource1" DefaultMode="Insert" OnItemInserting="DetailsView1_ItemInserting" BackColor="#D5F0EB">
                <Fields>
                    <asp:BoundField DataField="clientId" HeaderText="clientId" InsertVisible="False" ReadOnly="True" SortExpression="clientId" />
                    <asp:TemplateField HeaderText="Client Name" SortExpression="clientName">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("clientName") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="TextBox1" CssClass="form-control" runat="server" Text='<%# Bind("clientName") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Name is Required!!!" ControlToValidate="TextBox1" ForeColor="Red"></asp:RequiredFieldValidator>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("clientName") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Birth Date" SortExpression="birthDate">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("birthDate") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="TextBox2" runat="server" TextMode="Date" CssClass="form-control" Text='<%# Bind("birthDate","{0:yyyy-MM-dd}") %>'></asp:TextBox>
                            <asp:RangeValidator ID="RangeValidator1" runat="server" ErrorMessage="Date must between 1950 to 2005!!" ForeColor="Red" ControlToValidate="TextBox2" MaximumValue="12-12-2005" MinimumValue="12-12-1950" Type="Date"></asp:RangeValidator>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("birthDate") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Phone" SortExpression="phone">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("phone") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="TextBox3" runat="server" CssClass="form-control" Text='<%# Bind("phone") %>'></asp:TextBox>
                            <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="You have to give only integer number!!!" ForeColor="Red" ControlToValidate="TextBox3" Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("phone") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Email" SortExpression="email">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("email") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="TextBox4" runat="server" CssClass="form-control" Text='<%# Bind("email") %>'></asp:TextBox>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="You have to enter correct email format!!!" ControlToValidate="TextBox4" ForeColor="#CC0000" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label4" runat="server" Text='<%# Bind("email") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Picture" SortExpression="picture">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("picture") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:FileUpload ID="fuPicture" runat="server" CssClass="form-control" />
                            <asp:HiddenField ID="HiddenField1" runat="server" Value='<%# Bind("picture") %>' />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Image is Required" ForeColor="Red" ControlToValidate="fuPicture"></asp:RequiredFieldValidator>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label4" runat="server" Text='<%# Bind("picture") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Spot" SortExpression="spotId">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("spotId") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <%--<asp:TextBox ID="TextBox5" runat="server" CssClass="form-control" Text='<%# Bind("spotId") %>'></asp:TextBox>--%>
                            <asp:DropDownList ID="DropDownList1" CssClass="form-control" runat="server" SelectedValue='<%# Bind("spotId") %>' DataSourceID="SqlDataSource1" DataTextField="spotName" DataValueField="spotId"></asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:eviTTMSBCon %>" SelectCommand="SELECT * FROM [spot]"></asp:SqlDataSource>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label5" runat="server" Text='<%# Bind("spotId") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Is Available" SortExpression="isAvailable">
                        <EditItemTemplate>
                            <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("isAvailable") %>' />
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:CheckBox ID="CheckBox1" Text="  Yes" runat="server" CssClass="form-control" Checked='<%# Bind("isAvailable") %>' />
                            <asp:CustomValidator ID="CustomValidator1" runat="server" ErrorMessage="You have to check this checkbox!!!" ForeColor="Red" OnServerValidate="CustomValidator1_ServerValidate"></asp:CustomValidator>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("isAvailable") %>' Enabled="false" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ShowHeader="False">
                        <InsertItemTemplate>
                            <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" CssClass="btn btn-success"><i class="fa fa-save"></i></asp:LinkButton>
                            &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" CssClass="btn btn-warning"><i class="fa fa-times"></i></asp:LinkButton>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="New" Text="New"></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Fields>
            </asp:DetailsView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:eviTTMSBCon %>" DeleteCommand="DELETE FROM [client] WHERE [clientId] = @clientId" InsertCommand="INSERT INTO [client] ([clientName], [birthDate], [phone], [email], [picture], [spotId], [isAvailable]) VALUES (@clientName, @birthDate, @phone, @email, @picture, @spotId, @isAvailable)" SelectCommand="SELECT * FROM [client]" UpdateCommand="UPDATE [client] SET [clientName] = @clientName, [birthDate] = @birthDate, [phone] = @phone, [email] = @email, [picture] = @picture, [spotId] = @spotId, [isAvailable] = @isAvailable WHERE [clientId] = @clientId">
                <DeleteParameters>
                    <asp:Parameter Name="clientId" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="clientName" Type="String" />
                    <asp:Parameter DbType="Date" Name="birthDate" />
                    <asp:Parameter Name="phone" Type="Int32" />
                    <asp:Parameter Name="email" Type="String" />
                    <asp:Parameter Name="picture" DbType="Binary" />
                    <asp:Parameter Name="spotId" Type="Int32" />
                    <asp:Parameter Name="isAvailable" Type="Boolean" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="clientName" Type="String" />
                    <asp:Parameter DbType="Date" Name="birthDate" />
                    <asp:Parameter Name="phone" Type="Int32" />
                    <asp:Parameter Name="email" Type="String" />
                    <asp:Parameter Name="picture" Type="Object" />
                    <asp:Parameter Name="spotId" Type="Int32" />
                    <asp:Parameter Name="isAvailable" Type="Boolean" />
                    <asp:Parameter Name="clientId" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">
</asp:Content>
