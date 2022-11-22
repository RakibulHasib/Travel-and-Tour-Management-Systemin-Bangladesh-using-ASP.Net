<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ClientView.aspx.cs" Inherits="TTMSB_Project.Items.ClientView" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">
    <h2>Client Information</h2>
    <a class="mb-2 btn btn-primary" href="Client.aspx"><i class="fa fa-plus-circle"></i>Add New</a>
    <div class="row">
        <div class="col form-group">
            <asp:GridView ID="GridView1" runat="server" CssClass="table table-bordered" AutoGenerateColumns="False" DataKeyNames="clientId" DataSourceID="SqlDataSource1" OnRowUpdating="GridView1_RowUpdating" BackColor="#daefe9">
                <Columns>
                    <asp:TemplateField HeaderText="Id" SortExpression="clientId" InsertVisible="False">
                        <EditItemTemplate>
                            <asp:Label ID="Label1" runat="server" CssClass="table table-bordered" Text='<%# Eval("clientId") %>'></asp:Label>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" CssClass="form-control-sm" Text='<%# Bind("clientId") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Name" SortExpression="clientName">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" CssClass="table table-bordered" runat="server" Text='<%# Bind("clientName") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" CssClass="form-control-sm" Text='<%# Bind("clientName") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Birth Date" SortExpression="birthDate">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox2" runat="server" CssClass="table table-bordered" TextMode="Date" Text='<%# Bind("birthDate","{0:yyyy-MM-dd}") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" CssClass="form-control-sm" Text='<%# Bind("birthDate","{0:yyyy-MM-dd}") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Phone" SortExpression="phone">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox3" CssClass="table table-bordered" runat="server" Text='<%# Bind("phone") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label4" runat="server" CssClass="form-control-sm" Text='<%# Bind("phone") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Email" SortExpression="email">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox4" runat="server" CssClass="table table-bordered" Text='<%# Bind("email") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate> 
                            <asp:Label ID="Label5" runat="server" CssClass="form-control-sm" Text='<%# Bind("email") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Picture" SortExpression="picture">
                        <EditItemTemplate>
                            <asp:FileUpload ID="fuPicture" runat="server" CssClass="table table-bordered" />
                            <asp:HiddenField ID="HiddenField1" runat="server" />
                        </EditItemTemplate>
                        <ItemTemplate>
                            <img src='<%# Eval("clientId","/Items/DatabaseImageHandler.ashx?id={0}") %>' width="50" Class="form-control-sm"/>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Spot" SortExpression="spotId">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox5" CssClass="table table-bordered" runat="server" Text='<%# Bind("spotId") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label6" CssClass="form-control-sm" runat="server" Text='<%# Bind("spotName") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Is Available" SortExpression="isAvailable">
                        <EditItemTemplate>
                            <asp:CheckBox ID="CheckBox1" CssClass="table table-bordered" runat="server" Checked='<%# Bind("isAvailable") %>' />
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:CheckBox ID="CheckBox1" CssClass="form-control-sm" runat="server" Checked='<%# Bind("isAvailable") %>' Enabled="false" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Action" ShowHeader="False">
                        <EditItemTemplate>
                            <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" Text="Update" CssClass="btn btn-primary"><i class="fa fa-refresh"></i></asp:LinkButton>
                            &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" CssClass="btn btn-warning"><i class="fa fa-times"></i></asp:LinkButton>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" CssClass="btn btn-success"><i class="fa fa-pencil"></i></asp:LinkButton>
                            &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" Text="Delete" CssClass="btn btn-danger"><i class="fa fa-trash"></i></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:eviTTMSBCon %>" DeleteCommand="DELETE FROM [client] WHERE [clientId] = @clientId" InsertCommand="INSERT INTO [client] ([clientName], [birthDate], [phone], [email], [picture], [spotId], [isAvailable]) VALUES (@clientName, @birthDate, @phone, @email, @picture, @spotId, @isAvailable)" SelectCommand="SELECT c.clientId,c.clientName,c.birthDate,c.phone,c.email,c.picture,c.spotId,s.spotName,c.isAvailable FROM client c INNER JOIN spot s ON s.spotId=c.spotId" UpdateCommand="UPDATE [client] SET [clientName] = @clientName, [birthDate] = @birthDate, [phone] = @phone, [email] = @email, [picture] = @picture, [spotId] = @spotId, [isAvailable] = @isAvailable WHERE [clientId] = @clientId">
                <DeleteParameters>
                    <asp:Parameter Name="clientId" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="clientName" Type="String" />
                    <asp:Parameter DbType="Date" Name="birthDate" />
                    <asp:Parameter Name="phone" Type="Int32" />
                    <asp:Parameter Name="email" Type="String" />
                    <asp:Parameter Name="picture" Type="Object" />
                    <asp:Parameter Name="spotId" Type="Int32" />
                    <asp:Parameter Name="isAvailable" Type="Boolean" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="clientName" Type="String" />
                    <asp:Parameter DbType="Date" Name="birthDate" />
                    <asp:Parameter Name="phone" Type="Int32" />
                    <asp:Parameter Name="email" Type="String" />
                    <asp:Parameter Name="picture" DbType="Binary" />
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
