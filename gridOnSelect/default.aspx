<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="gridOnSelect._default" enableEventValidation="false" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="css/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
     <form id="form1" runat="server">
    <asp:ScriptManager ID="scm" runat="server"></asp:ScriptManager>

    <asp:UpdatePanel ID="up" runat="server">
        <ContentTemplate   >
           
        <div class="row">
            <div class="col-md-1">
            </div>
            <div class="col-md-4">

                <div class="form-group">
                    <label>Compnay Name:</label>
                    <asp:TextBox ID="txtCName" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label>Contact Person:</label>
                    <asp:TextBox ID="txtPerson" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label>Current Status:</label>
                    <asp:DropDownList ID="ddlCurrentStatus" CssClass="form-control" runat="server">
                        <asp:ListItem Value="1" Text="Approval"></asp:ListItem>
                        <asp:ListItem Value="2" Text="Approved"></asp:ListItem>
                        <asp:ListItem Value="3" Text="Declined"></asp:ListItem>
                        <asp:ListItem Value="4" Text="Pending"></asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="form-group">
                    <label>Financial Status:</label>
                    <asp:DropDownList ID="ddlFinStatus" CssClass="form-control" runat="server">
                        <asp:ListItem Value="1" Text="Average"></asp:ListItem>
                        <asp:ListItem Value="2" Text="Average"></asp:ListItem>
                        <asp:ListItem Value="3" Text="Achieving"></asp:ListItem>
                        <asp:ListItem Value="4" Text="Outstanding"></asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="form-group">
                    <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" />
                    <asp:Label ID="lblmsg" runat="server"></asp:Label>
                </div>
                
            </div>
            <div class="col-md-7">
                <asp:GridView ID="grd" runat="server" AutoGenerateColumns="false"  DataKeyNames="id" OnRowDataBound="grd_RowDataBound"  OnSelectedIndexChanged="grd_SelectedIndexChanged" OnRowEditing="grd_RowEditing">
                    <Columns>
                        <asp:TemplateField HeaderText="id" Visible="false">
                            <ItemTemplate>
                                <%# Eval("id") %>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Company Name">
                            <ItemTemplate>
                                <asp:Label ID="lblcompanyName" runat="server" Text='<%# Eval("companyName") %>'></asp:Label>
                                <asp:TextBox ID="txtcompanyName" runat="server" Text='<%# Eval("companyName") %>' Visible="false"></asp:TextBox>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Contact Person">
                            <ItemTemplate>
                                <asp:Label ID="lblContactPerson" runat="server" Text='<%# Eval("ContactPerson") %>'></asp:Label>
                                <asp:TextBox ID="txtContactPerson" runat="server" Text='<%# Eval("companyName") %>' Visible="false"></asp:TextBox>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Current Status">
                            <ItemTemplate>
                                <asp:Label ID="lblCurrentStatus" runat="server" Text='<%# Eval("CurrentStatus") %>'></asp:Label>
                                <asp:DropDownList ID="ddlCntStatus" CssClass="form-control" runat="server" Visible="false">
                                    <asp:ListItem Value="1" Text="Approval"></asp:ListItem>
                                    <asp:ListItem Value="2" Text="Approved"></asp:ListItem>
                                    <asp:ListItem Value="3" Text="Declined"></asp:ListItem>
                                    <asp:ListItem Value="4" Text="Pending"></asp:ListItem>
                                </asp:DropDownList>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Financial Performance">
                            <ItemTemplate>
                              <asp:Label ID="lblFStatus" runat="server" Text='<%# Eval("FPerformance") %>'></asp:Label>
                                <asp:DropDownList ID="ddlFStatus" CssClass="form-control" runat="server"  Visible="false">
                                    <asp:ListItem Value="1" Text="Average"></asp:ListItem>
                                    <asp:ListItem Value="2" Text="Average"></asp:ListItem>
                                    <asp:ListItem Value="3" Text="Achieving"></asp:ListItem>
                                    <asp:ListItem Value="4" Text="Outstanding"></asp:ListItem>
                                </asp:DropDownList>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
               <div class="form-group">
                   <asp:Button ID="btnRemove" runat="server" Text="Remove" OnClick="btnRemove_Click" />
               </div>
            </div>
        </div>
   
        </ContentTemplate> 
    </asp:UpdatePanel>
     </form>
</body>
</html>
