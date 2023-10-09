<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GridView.aspx.cs" Inherits="GridViewTable.GridView" Theme="Theme1" Title="Cars" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Car Model</title>
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <script src="Scripts/bootstrap.bundle.min.js"></script>
</head>
<body>
    <form id="form" runat="server">
        <div style="text-align: center;">
            <asp:ScriptManager ID="ScriptManager" runat="server">
            </asp:ScriptManager>
              <%--Page header--%>
            <h1>CARS</h1>
            <%--Div Grid--%>
            <div id="Dv_Gridview">
                <asp:UpdatePanel ID="UpdatePanel" runat="server">
                    <ContentTemplate>                      
                        <table id="TableAddingData" style="table-layout:fixed;"width:100%;">
                            <thead>
                                <tr>
                                    <th scope="col">Brand Code</th>
                                    <th scope="col">Brand</th>
                                    <th scope="col">Model Code</th>
                                    <th scope="col">Model Description</th>
                                    <th scope="col">
                                        <label>Engine Capacity</label>
                                        <label>[CC]</label></th>
                                    <th scope="col">GearType</th>
                                    <th scope="col">
                                        <label>FuelTank Capacity</label>
                                        <label>[Ltrs]</label>
                                    </th>
                                    <th scope="col">
                                        <label>Mileage</label>
                                        <label>[Kmpl]</label>
                                    </th>
                                    <th scope="col">
                                        <label>Price</label>
                                        <label>[Lakhs]</label>
                                    </th>
                                    <th scope="col" colspan="2">
                                        <asp:Label ID="Lbl_MessageType" runat="server"></asp:Label>
                                    </th>
                                    <%--<th scope="col">                                                                              
                                    </th>--%>
                                </tr>
                            </thead>
                            <tbody>
                                <tr class="form-group">
                                    <td style="width:150px;">
                                        <asp:TextBox ID="Text_BrandCode" runat="server" Width="140px" CssClass="form-control" />
                                    </td>
                                    <td style="width:150px;">
                                        <asp:TextBox ID="Text_Brand" runat="server" Width="140px" CssClass="form-control" />
                                    </td>
                                    <td style="width:150px;">
                                        <asp:TextBox ID="Text_ModelCode" runat="server" Width="140px" CssClass="form-control" />
                                    </td>
                                    <td style="width:150px;">
                                        <asp:TextBox ID="Text_ModelDescription" runat="server" Width="140px" CssClass="form-control" />
                                    </td>
                                    <td style="width:150px;">
                                        <asp:TextBox ID="Text_EngineCapacity" runat="server" Width="140px" CssClass="form-control" />
                                    </td>
                                    <td style="width:150px;">
                                        <asp:TextBox ID="Text_GearType" runat="server" Width="140px" CssClass="form-control" />
                                    </td>
                                    <td style="width:150px;">
                                        <asp:TextBox ID="Text_FuelTankCapacity" runat="server" Width="140px" CssClass="form-control" />
                                    </td>
                                    <td style="width:150px;">
                                        <asp:TextBox ID="Text_Mileage" runat="server" Width="140px" CssClass="form-control" />
                                    </td>
                                    <td style="width:150px;">
                                        <asp:TextBox ID="Text_Price" runat="server" Width="140px" CssClass="form-control" />
                                    </td>                                   
                                    <td style="width:100px;">
                                         <asp:Button ID="btn_Add" runat="server" CssClass="btn btn-success" Text="Add" OnClick="Btn_Add_Click" ValidationGroup="ValidationGroupAddBData" />
                                    </td>
                                    <td style="width:100px;">
                                        <asp:Button ID="btn_Clear" runat="server" CssClass="btn btn-primary" Text="Reset" OnClientClick="this.form.reset();" /> 
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:RequiredFieldValidator runat="server" ControlToValidate="Text_BrandCode" ErrorMessage="BrandCode required" Display="Dynamic" ForeColor="Red" SetFocusOnError="true" ValidationGroup="ValidationGroupAddBData"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator runat="server" ControlToValidate="Text_BrandCode" ValidationExpression="^[A-Za-z]\d+$" ErrorMessage="Alphabet and number type" Display="Dynamic" ForeColor="Red" SetFocusOnError="true" ValidationGroup="ValidationGroupAddBData"></asp:RegularExpressionValidator>
                                    </td>
                                    <td>
                                        <asp:RequiredFieldValidator runat="server" ControlToValidate="Text_Brand" ErrorMessage="Brand required" Display="Dynamic" ForeColor="Red" SetFocusOnError="true" ValidationGroup="ValidationGroupAddBData"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator runat="server" ControlToValidate="Text_Brand" ValidationExpression="^[a-zA-Z]+$" ErrorMessage="Alphabets only" Display="Dynamic" ForeColor="Red" SetFocusOnError="true" ValidationGroup="ValidationGroupAddBData"></asp:RegularExpressionValidator>
                                    </td>
                                    <td>
                                        <asp:RequiredFieldValidator runat="server" ControlToValidate="Text_ModelCode" ErrorMessage="ModelCode required" Display="Dynamic" ForeColor="Red" SetFocusOnError="true" ValidationGroup="ValidationGroupAddBData"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator runat="server" ControlToValidate="Text_ModelCode" ValidationExpression="^[A-Za-z]\d+$" ErrorMessage="Alphabet and number type" Display="Dynamic" ForeColor="Red" SetFocusOnError="true" ValidationGroup="ValidationGroupAddBData"></asp:RegularExpressionValidator>
                                    </td>
                                    <td>
                                        <asp:RequiredFieldValidator runat="server" ControlToValidate="Text_ModelDescription" ErrorMessage="ModelDescription required" Display="Dynamic" ForeColor="Red" SetFocusOnError="true" ValidationGroup="ValidationGroupAddBData"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator runat="server" ControlToValidate="Text_ModelDescription" ValidationExpression="^[a-zA-Z]+$" ErrorMessage="Alphabets only" Display="Dynamic" ForeColor="Red" SetFocusOnError="true" ValidationGroup="ValidationGroupAddBData"></asp:RegularExpressionValidator>
                                    </td>
                                    <td>
                                        <asp:RequiredFieldValidator runat="server" ControlToValidate="Text_EngineCapacity" ErrorMessage="EngineCapacity required" Display="Dynamic" ForeColor="Red" SetFocusOnError="true" ValidationGroup="ValidationGroupAddBData"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator runat="server" ControlToValidate="Text_EngineCapacity" ValidationExpression="^\d+$" ErrorMessage="Numbers only" Display="Dynamic" ForeColor="Red" SetFocusOnError="true" ValidationGroup="ValidationGroupAddBData"></asp:RegularExpressionValidator>
                                    </td>
                                    <td>
                                        <asp:RequiredFieldValidator runat="server" ControlToValidate="Text_GearType" ErrorMessage="GearType required" Display="Dynamic" ForeColor="Red" SetFocusOnError="true" ValidationGroup="ValidationGroupAddBData"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator runat="server" ControlToValidate="Text_GearType" ValidationExpression="^[a-zA-Z]+$" ErrorMessage="Alphabets only" Display="Dynamic" ForeColor="Red" SetFocusOnError="true" ValidationGroup="ValidationGroupAddBData"></asp:RegularExpressionValidator>
                                    </td>
                                    <td>
                                        <asp:RequiredFieldValidator runat="server" ControlToValidate="Text_FuelTankCapacity" ErrorMessage="FuelTankCapacity required" Display="Dynamic" ForeColor="Red" SetFocusOnError="true" ValidationGroup="ValidationGroupAddBData"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator runat="server" ControlToValidate="Text_FuelTankCapacity" ValidationExpression="^\d+$" ErrorMessage="Numbers only" Display="Dynamic" ForeColor="Red" SetFocusOnError="true" ValidationGroup="ValidationGroupAddBData"></asp:RegularExpressionValidator>
                                    </td>
                                    <td>
                                        <asp:RequiredFieldValidator runat="server" ControlToValidate="Text_Mileage" ErrorMessage="Mileage required" Display="Dynamic" ForeColor="Red" SetFocusOnError="true" ValidationGroup="ValidationGroupAddBData"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator runat="server" ControlToValidate="Text_Mileage" ValidationExpression="^\d+$" ErrorMessage="Numbers only" Display="Dynamic" ForeColor="Red" SetFocusOnError="true" ValidationGroup="ValidationGroupAddBData"></asp:RegularExpressionValidator>
                                    </td>
                                    <td>
                                        <asp:RequiredFieldValidator runat="server" ControlToValidate="Text_Price" ErrorMessage="Price required" Display="Dynamic" ForeColor="Red" SetFocusOnError="true" ValidationGroup="ValidationGroupAddBData"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator runat="server" ControlToValidate="Text_Price" ValidationExpression="^\d+$" ErrorMessage="Numbers only" Display="Dynamic" ForeColor="Red" SetFocusOnError="true" ValidationGroup="ValidationGroupAddBData"></asp:RegularExpressionValidator>
                                    </td>
                                </tr>
                            </tbody>
                        </table>

                        <%--Gridview--%>
                        <asp:GridView ID="Grd_View" PagerStyle-CssClass="pager" ShowHeader="false" RowStyle-CssClass="rows" runat="server" AutoGenerateColumns="false"
                            DataKeyNames="Row_Id"
                            OnRowDataBound="Grd_View_RowDataBound"
                            OnRowEditing="Grd_View_RowEditing"
                            OnRowCancelingEdit="Grd_View_RowCancelingEdit"
                            PageSize="5" AllowPaging="true"
                            OnPageIndexChanging="Grd_View_PageIndexChanging"
                            OnRowUpdating="Grd_View_RowUpdating"
                            OnRowDeleting="Grd_View_RowDeleting"
                            EmptyDataText="No records has been added."
                            Width="100%">
                            <Columns>
                                <asp:TemplateField ItemStyle-Width="150px" ItemStyle-CssClass="form-group">
                                    <ItemTemplate>
                                        <asp:Label ID="Lbl_BrandCode" runat="server" Text='<%# Eval("BrandCode") %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="Text_BrandCode" runat="server" Text='<%# Eval("BrandCode") %>' Width="140px" CssClass="form-control" Enabled="false"></asp:TextBox>
                                    </EditItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField ItemStyle-Width="150px">
                                    <ItemTemplate>
                                        <asp:Label ID="Lbl_Brand" runat="server" Text='<%# Eval("Brand") %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="Text_Brand" runat="server" Text='<%# Eval("Brand") %>' Width="140px" CssClass="form-control"></asp:TextBox>
                                        <asp:RequiredFieldValidator runat="server" ControlToValidate="Text_Brand" ErrorMessage="Brand required" Display="Dynamic" ForeColor="Red" SetFocusOnError="true" ValidationGroup="ValidationGroupEditData"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator runat="server" ControlToValidate="Text_Brand" ValidationExpression="^[a-zA-Z]+$" ErrorMessage="Alphabets only" Display="Dynamic" ForeColor="Red" SetFocusOnError="true" ValidationGroup="ValidationGroupEditData"></asp:RegularExpressionValidator>
                                    </EditItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField ItemStyle-Width="150px">
                                    <ItemTemplate>
                                        <asp:Label ID="Lbl_ModelCode" runat="server" Text='<%# Eval("ModelCode") %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="Text_ModelCode" runat="server" Text='<%# Eval("ModelCode") %>' Width="140px" CssClass="form-control"></asp:TextBox>
                                        <asp:RequiredFieldValidator runat="server" ControlToValidate="Text_ModelCode" ErrorMessage="Model Code required" Display="Dynamic" ForeColor="Red" SetFocusOnError="true" ValidationGroup="ValidationGroupEditData"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator runat="server" ControlToValidate="Text_ModelCode" ValidationExpression="^[A-Za-z]\d+$" ErrorMessage="Alphabets only" Display="Dynamic" ForeColor="Red" SetFocusOnError="true" ValidationGroup="ValidationGroupEditData"></asp:RegularExpressionValidator>
                                    </EditItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField ItemStyle-Width="150px">
                                    <ItemTemplate>
                                        <asp:Label ID="Lbl_Prod_ModelDescription" runat="server" Text='<%# Eval("ModelDescription") %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="Text_ModelDescription" runat="server" Text='<%# Eval("ModelDescription") %>' Width="140px" CssClass="form-control"></asp:TextBox>
                                        <asp:RequiredFieldValidator runat="server" ControlToValidate="Text_ModelDescription" ErrorMessage="Model Description required" Display="Dynamic" ForeColor="Red" SetFocusOnError="true" ValidationGroup="ValidationGroupEditData"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator runat="server" ControlToValidate="Text_ModelDescription" ValidationExpression="^[a-zA-Z]+$" ErrorMessage="Alphabets only" Display="Dynamic" ForeColor="Red" SetFocusOnError="true" ValidationGroup="ValidationGroupEditData"></asp:RegularExpressionValidator>
                                    </EditItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField ItemStyle-Width="150px">
                                    <ItemTemplate>
                                        <asp:Label ID="Lbl_EngineCapacity" runat="server" Text='<%# Eval("EngineCapacity") %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="Text_EngineCapacity" runat="server" Text='<%# Eval("EngineCapacity") %>' Width="140px" CssClass="form-control"></asp:TextBox>
                                        <asp:RequiredFieldValidator runat="server" ControlToValidate="Text_EngineCapacity" ErrorMessage="Engine Capacity required" Display="Dynamic" ForeColor="Red" SetFocusOnError="true" ValidationGroup="ValidationGroupEditData"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator runat="server" ControlToValidate="Text_EngineCapacity" ValidationExpression="^\d+$" ErrorMessage="Numbers only" Display="Dynamic" ForeColor="Red" SetFocusOnError="true" ValidationGroup="ValidationGroupEditData"></asp:RegularExpressionValidator>
                                    </EditItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField ItemStyle-Width="150px">
                                    <ItemTemplate>
                                        <asp:Label ID="Lbl_GearType" runat="server" Text='<%# Eval("GearType") %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="Text_GearType" runat="server" Text='<%# Eval("GearType") %>' Width="140px" CssClass="form-control"></asp:TextBox>
                                        <asp:RequiredFieldValidator runat="server" ControlToValidate="Text_GearType" ErrorMessage="GearType required" Display="Dynamic" ForeColor="Red" SetFocusOnError="true" ValidationGroup="ValidationGroupEditData"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator runat="server" ControlToValidate="Text_GearType" ValidationExpression="^[a-zA-Z]+$" ErrorMessage="Alphabets only" Display="Dynamic" ForeColor="Red" SetFocusOnError="true" ValidationGroup="ValidationGroupEditData"></asp:RegularExpressionValidator>
                                    </EditItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField ItemStyle-Width="150px">
                                    <ItemTemplate>
                                        <asp:Label ID="Lbl_FuelTankCapacity" runat="server" Text='<%# Eval("FuelTankCapacity") %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="Text_FuelTankCapacity" runat="server" Text='<%# Eval("FuelTankCapacity") %>' Width="140px" CssClass="form-control"></asp:TextBox>
                                        <asp:RequiredFieldValidator runat="server" ControlToValidate="Text_FuelTankCapacity" ErrorMessage="FuelTank Capacity required" Display="Dynamic" ForeColor="Red" SetFocusOnError="true" ValidationGroup="ValidationGroupEditData"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator runat="server" ControlToValidate="Text_FuelTankCapacity" ValidationExpression="^\d+$" ErrorMessage="Numbers only" Display="Dynamic" ForeColor="Red" SetFocusOnError="true" ValidationGroup="ValidationGroupEditData"></asp:RegularExpressionValidator>
                                    </EditItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField ItemStyle-Width="150px">
                                    <ItemTemplate>
                                        <asp:Label ID="Lbl_Mileage" runat="server" Text='<%# Eval("Mileage") %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="Text_Mileage" runat="server" Text='<%# Eval("Mileage") %>' Width="140px" CssClass="form-control"></asp:TextBox>
                                        <asp:RequiredFieldValidator runat="server" ControlToValidate="Text_Mileage" ErrorMessage="Mileage required" Display="Dynamic" ForeColor="Red" SetFocusOnError="true" ValidationGroup="ValidationGroupEditData"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator runat="server" ControlToValidate="Text_Mileage" ValidationExpression="^\d+$" ErrorMessage="Numbers only" Display="Dynamic" ForeColor="Red" SetFocusOnError="true" ValidationGroup="ValidationGroupEditData"></asp:RegularExpressionValidator>
                                    </EditItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField ItemStyle-Width="150px">
                                    <ItemTemplate>
                                        <asp:Label ID="Lbl_Price" runat="server" Text='<%# Eval("Price") %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="Text_Price" runat="server" Text='<%# Eval("Price") %>' Width="140px" CssClass="form-control"></asp:TextBox>
                                        <asp:RequiredFieldValidator runat="server" ControlToValidate="Text_Price" ErrorMessage="Price required" Display="Dynamic" ForeColor="Red" SetFocusOnError="true" ValidationGroup="ValidationGroupEditData"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator runat="server" ControlToValidate="Text_Price" ValidationExpression="^\d+$" ErrorMessage="Numbers only" Display="Dynamic" ForeColor="Red" SetFocusOnError="true" ValidationGroup="ValidationGroupEditData"></asp:RegularExpressionValidator>
                                    </EditItemTemplate>
                                </asp:TemplateField>
                             <%--   <asp:CommandField ButtonType="button" ShowEditButton="true"
                                    ItemStyle-Width="180" ControlStyle-CssClass="btn btn-info" ValidationGroup="ValidationGroupEditData" />--%>
                                <%--<asp:CommandField ButtonType="button" ShowDeleteButton="true"
                                    ItemStyle-Width="140" ControlStyle-ForeColor="white" ControlStyle-BackColor="Red"/>--%>
                                <%--<asp:TemplateField HeaderText="Action" ItemStyle-Width="150">
                                    <ItemTemplate>
                                        <asp:Button runat="server" Text="Update" CommandName="Update" BackColor="Yellow" OnClientClick="return confirm('Are you sure you want to update this order? ');" />
                                    </ItemTemplate>
                                </asp:TemplateField>--%>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:Button runat="server" CssClass="btn btn-info" Text="Edit" CommandName="Edit" />
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:Button runat="server" CssClass="btn btn-warning" Text="Update" CommandName="Update"/>
                                        <asp:Button runat="server" CssClass="btn btn-danger" Text="Cancel" CommandName="Cancel" />
                                    </EditItemTemplate>                                   
                                </asp:TemplateField>                                
                                <asp:TemplateField>                                    
                                    <ItemTemplate>
                                        <asp:Button runat="server" CssClass="btn btn-danger" Text="Delete" CommandName="Delete" BackColor="Orange" OnClientClick="return confirm('Are you sure you want to delete this order? ');" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>
    </form>
</body>

</html>
