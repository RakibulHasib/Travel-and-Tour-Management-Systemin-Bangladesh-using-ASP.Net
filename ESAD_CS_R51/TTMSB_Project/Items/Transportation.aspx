<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Transportation.aspx.cs" Inherits="TTMSB_Project.Items.Transportation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">
    <h3 class="text-center alert-info mt-3">Tranport Entry Section</h3>
    <div class="row">
        <div class="offset-3 col-6">
            <asp:UpdateProgress ID="UpdateProgress1" runat="server">
                <ProgressTemplate>
                    <img src="../Images/bar.gif" width="100" />
                </ProgressTemplate>
            </asp:UpdateProgress>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <asp:FormView ID="FormView1" runat="server" CssClass="table table-bordered mt-2" DataKeyNames="transpotId" DataSourceID="SqlDataSource1" DefaultMode="Insert" Font-Bold="True" BackColor="#99CCFF">
                        <InsertItemTemplate>
                            <label class="text-center">Transport Name :</label>
                            <asp:TextBox ID="transportNameTextBox" CssClass="form-control" runat="server" Text='<%# Bind("transportName") %>' />
                            <br />
                            <asp:LinkButton ID="InsertButton" runat="server" CssClass="offset-4 btn btn-primary" CausesValidation="True" CommandName="Insert" Text="Insert" />
                            &nbsp;<asp:LinkButton ID="InsertCancelButton" CssClass="offset-1 btn btn-warning" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                        </InsertItemTemplate>
                    </asp:FormView>
                </ContentTemplate>
            </asp:UpdatePanel>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:eviTTMSBCon %>" DeleteCommand="DELETE FROM [transportation] WHERE [transpotId] = @transpotId" InsertCommand="INSERT INTO [transportation] ([transportName]) VALUES (@transportName)" SelectCommand="SELECT * FROM [transportation]" UpdateCommand="UPDATE [transportation] SET [transportName] = @transportName WHERE [transpotId] = @transpotId">
                <DeleteParameters>
                    <asp:Parameter Name="transpotId" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="transportName" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="transportName" Type="String" />
                    <asp:Parameter Name="transpotId" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>
    </div>

    <h3 class="text-center alert-info mt-3">Transport View Section</h3>
    <div class="row">
        <div class="offset-1 col-10">
            <asp:UpdateProgress ID="UpdateProgress2" runat="server">
                <ProgressTemplate>
                    <img src="../Images/bar.gif" width="100" />
                </ProgressTemplate>
            </asp:UpdateProgress>
            <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                <ContentTemplate>
                    <asp:GridView ID="GridView1" runat="server" CssClass="table table-bordered mt-3" AutoGenerateColumns="False" DataKeyNames="transpotId" DataSourceID="SqlDataSource2" BackColor="#99CCFF" Font-Bold="True">
                        <Columns>
                            <asp:BoundField DataField="transpotId" HeaderText="Transpot Id" InsertVisible="False" ReadOnly="True" SortExpression="transpotId" />
                            <asp:BoundField DataField="transportName" HeaderText="Transport Name" SortExpression="transportName" />
                            <asp:TemplateField ShowHeader="False">
                                <EditItemTemplate>
                                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" Text="Update" CssClass="btn btn-success"><i class="fa fa-refresh"></i></asp:LinkButton>
                                    &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" CssClass="btn btn-secondary"><i class="fa fa-times"></i></asp:LinkButton>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" CssClass="btn btn-warning"><i class="fa fa-pencil"></i></asp:LinkButton>
                                    &nbsp;<asp:LinkButton ID="btnDelete" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" CssClass="btn btn-danger"><i class="fa fa-trash"></i></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </ContentTemplate>
            </asp:UpdatePanel>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:eviTTMSBCon %>" DeleteCommand="DELETE FROM [transportation] WHERE [transpotId] = @transpotId" InsertCommand="INSERT INTO [transportation] ([transportName]) VALUES (@transportName)" SelectCommand="SELECT * FROM [transportation]" UpdateCommand="UPDATE [transportation] SET [transportName] = @transportName WHERE [transpotId] = @transpotId">
                <DeleteParameters>
                    <asp:Parameter Name="transpotId" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="transportName" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="transportName" Type="String" />
                    <asp:Parameter Name="transpotId" Type="Int32" />
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
        })
    </script>
</asp:Content>
