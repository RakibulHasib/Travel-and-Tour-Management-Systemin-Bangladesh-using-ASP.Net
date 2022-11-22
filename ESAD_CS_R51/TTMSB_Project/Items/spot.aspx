<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="spot.aspx.cs" Inherits="TTMSB_Project.Items.spot" %>

<%@ Register Src="~/Items/SpotUserControl.ascx" TagPrefix="uc1" TagName="SpotUserControl" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">
    <asp:UpdateProgress ID="UpdateProgress1" runat="server">
        <ProgressTemplate>
            <img src="../Images/bar.gif" width="100" />
        </ProgressTemplate>
    </asp:UpdateProgress>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <h3 class="text-center alert-info mt-3">Spot Entry Section</h3>
            <div class="row">
                <div class="offset-3 col-6">
                    <asp:FormView ID="FormView1" runat="server" CssClass="table table-bordered mt-2" DataSourceID="ObjectDataSource1" DefaultMode="Insert" BackColor="#99CCFF" Font-Bold="True" OnItemInserted="FormView1_ItemInserted">
                        <InsertItemTemplate>
                            <label class="text-center">SpotName :</label>
                            <asp:TextBox ID="SpotNameTextBox" runat="server" CssClass="form-control" Text='<%# Bind("SpotName") %>' />
                            <br />
                            <asp:LinkButton ID="InsertButton" CssClass="offset-4 btn btn-primary" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                            &nbsp;<asp:LinkButton ID="InsertCancelButton" CssClass="offset-1 btn btn-warning" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                        </InsertItemTemplate>
                    </asp:FormView>
                    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" DataObjectTypeName="TTMSB_Project.Models.Spot" DeleteMethod="Delete" InsertMethod="Insert" SelectMethod="Get" TypeName="TTMSB_Project.DAL.SpotGetWay" UpdateMethod="Update"></asp:ObjectDataSource>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
    <h3 class="text-center alert-info mt-3">Spot View Section</h3>
    <div class="row">
        <div class="offset-1 col-10">
            <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                <ContentTemplate>
                    <asp:GridView ID="GridView1" runat="server" CssClass="table table-bordered mt-3" AutoGenerateColumns="False" DataSourceID="ObjectDataSource2" BackColor="#99CCFF" Font-Bold="True">
                        <Columns>
                            <asp:BoundField DataField="SpotId" HeaderText="SpotId" SortExpression="SpotId" />
                            <asp:BoundField DataField="SpotName" HeaderText="SpotName" SortExpression="SpotName" />
                            <asp:TemplateField HeaderText="Action" ShowHeader="False">
                                <EditItemTemplate>
                                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" Text="Update" CssClass="btn btn-success"><i class="fa fa-refresh"></i></asp:LinkButton>
                                    &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" CssClass="btn btn-secondary"><i class="fa fa-times"></i></asp:LinkButton>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" CssClass="btn btn-success"><i class="fa fa-pencil"></i></asp:LinkButton>
                                    &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" CssClass="btn btn-danger"><i class="fa fa-trash"></i></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </ContentTemplate>
            </asp:UpdatePanel>
            <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" DataObjectTypeName="TTMSB_Project.Models.Spot" DeleteMethod="Delete" SelectMethod="Get" TypeName="TTMSB_Project.DAL.SpotGetWay" UpdateMethod="Update"></asp:ObjectDataSource>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">
</asp:Content>
