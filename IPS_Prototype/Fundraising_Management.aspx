<%@ Page Title="" Language="C#" MasterPageFile="~/IPS_Vertical.Master" AutoEventWireup="true" CodeBehind="Fundraising_Management.aspx.cs" Inherits="IPS_Prototype.Fundraising_Management" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/Pagination.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <label class="title">Fundraising Management</label>
    <br />
    <h3 style="font-family: Arial, Helvetica, sans-serif;font-size:25px;">Donors</h3>
    <hr />
   <%-- <p>
        Status:
        <asp:DropDownList ID="ddlDate" runat="server" DataValueField="DONATION_ID" AutoPostBack="true" DataTextField="DONATION_DT" OnSelectedIndexChanged="ddlDate_SelectedIndexChanged">
            <asp:ListItem>Latest Date</asp:ListItem>
            <asp:ListItem>Earliest Date</asp:ListItem>
        </asp:DropDownList>
    </p>--%>

        <div id="fr_donors" runat="server">
            <asp:GridView PagerStyle-HorizontalAlign="Right" CssClass="table table-hover BlueTable pagination-ys" AllowPaging="true" PageSize="10" OnPageIndexChanging="gvDonors_PageIndexChanging" ID="gvDonors" OnRowEditing="gvDonors_RowEditing" AutoGenerateColumns="false" AutoGenerateEditButton="false" runat="server" EmptyDataText="No Records Found" ShowHeaderWhenEmpty="true" GridLines="None" UseAccessibleHeader="true" BorderStyle="None">
            <Columns>
                <asp:BoundField DataField="PERSON_ID" ItemStyle-CssClass="hiddencol" HeaderStyle-CssClass="hiddencol" />
                <asp:BoundField DataField="ORG_ID" ItemStyle-CssClass="hiddencol" HeaderStyle-CssClass="hiddencol" />
                <asp:BoundField DataField="FULLNAME_NAMETAGS" ItemStyle-CssClass="hiddencol" HeaderStyle-CssClass="hiddencol" />
                <asp:BoundField DataField="DONATION_ID" ItemStyle-CssClass="hiddencol" HeaderStyle-CssClass="hiddencol" />
                <asp:BoundField DataField="PROSPECTIVE_ID" ItemStyle-CssClass="hiddencol" HeaderStyle-CssClass="hiddencol" />
                <asp:TemplateField HeaderText="Donor Name" HeaderStyle-BackColor="#007bff" HeaderStyle-ForeColor="White">
                    <ItemTemplate>
                        <asp:Label ID="lblname" runat="server" Text='<%#Eval("FULLNAME_NAMETAGS")%>'></asp:Label>
                        <asp:Label ID="lblPros" runat="server" Text='<%#Eval("Indicator")%>' />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="DONATION_AMOUNT" HtmlEncode="False" DataFormatString="{0:c}" HeaderText="Donation Amount" HeaderStyle-BackColor="#007bff" HeaderStyle-ForeColor="White" />
                <asp:BoundField DataField="DONATION_DT" HtmlEncode="False" DataFormatString="{0:d}" HeaderText="Donation Date" HeaderStyle-BackColor="#007bff" HeaderStyle-ForeColor="White" />
                <asp:BoundField DataField="EVENT_NAME" HeaderText="Related to Events" HeaderStyle-BackColor="#007bff" HeaderStyle-ForeColor="White" />
                <asp:CommandField EditText="Select" ShowEditButton="true" HeaderStyle-BackColor="#007bff" HeaderStyle-ForeColor="White" />
            </Columns>
        </asp:GridView>
            </div>

       <%--     <div id="fr_donors2" runat="server" style="display:none;">
            <asp:gridview pagerstyle-horizontalalign="right" cssclass="table table-hover bluetable pagination-ys" allowpaging="true" pagesize="10" onpageindexchanging="gvdonors1_PageIndexChanging" id="gvdonors1" onrowediting="gvdonors1_RowEditing" autogeneratecolumns="false" autogenerateeditbutton="false" runat="server" emptydatatext="no records found" showheaderwhenempty="true" gridlines="none" useaccessibleheader="true" borderstyle="none">
            <columns>
                <asp:boundfield datafield="person_id" itemstyle-cssclass="hiddencol" headerstyle-cssclass="hiddencol" />
                <asp:boundfield datafield="org_id" itemstyle-cssclass="hiddencol" headerstyle-cssclass="hiddencol" />
                <asp:boundfield datafield="fullname_nametags" itemstyle-cssclass="hiddencol" headerstyle-cssclass="hiddencol" />
                <asp:boundfield datafield="donation_id" itemstyle-cssclass="hiddencol" headerstyle-cssclass="hiddencol" />
                <asp:boundfield datafield="prospective_id" itemstyle-cssclass="hiddencol" headerstyle-cssclass="hiddencol" />
                <asp:templatefield headertext="donor name" headerstyle-backcolor="#007bff" headerstyle-forecolor="white">
                    <itemtemplate>
                        <asp:Label ID="lblname" runat="server" Text='<%#Eval("FULLNAME_NAMETAGS")%>'></asp:Label>
                    </itemtemplate>
                </asp:templatefield>
                <asp:boundfield datafield="donation_amount" htmlencode="false" dataformatstring="{0:c}" headertext="donation amount" headerstyle-backcolor="#007bff" headerstyle-forecolor="white" />
                <asp:boundfield datafield="donation_dt" htmlencode="false" dataformatstring="{0:d}" headertext="donation date" headerstyle-backcolor="#007bff" headerstyle-forecolor="white" />
                <asp:boundfield datafield="event_name" headertext="related to events" headerstyle-backcolor="#007bff" headerstyle-forecolor="white" />
                <asp:commandfield edittext="select" showeditbutton="true" headerstyle-backcolor="#007bff" headerstyle-forecolor="white" />
            </columns>
        </asp:gridview>
    </div>--%>
</asp:Content>
    