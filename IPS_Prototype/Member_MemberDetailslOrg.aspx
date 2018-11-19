<%@ Page Title="" Language="C#" MasterPageFile="~/IPS_Vertical.Master" AutoEventWireup="true" CodeBehind="Member_MemberDetailslOrg.aspx.cs" Inherits="IPS_Prototype.Member_MemberDetailslOrg" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <label style="line-height: 1.5; font-size: 36px; font-family: 'Segoe UI'; font-weight: 400; margin: 10px 0;">Contribution History -  <label runat="server" id="lblOrgName"></label></label>
    <hr />
    <br />
    <div class="form-group">
        <strong style="margin-left:7px;">Donor Tier:</strong>
        <label runat="server" id="lblDonorTier"></label>
    </div>
    <div class="form-group">
        <strong>Expiry Date:</strong>
        <label runat="server" id="lblExpiryDate"></label>
    </div> 

    <br />
    <asp:HiddenField ID="orgName" runat="server" />

    <asp:GridView ID="GridView1" CssClass="table table-hover BlueTableContribution" runat="server" GridLines="None" UseAccessibleHeader="true" BorderStyle="None" OnRowDataBound="GridView1_RowDataBound" ShowHeaderWhenEmpty="true" EmptyDataText="No Contribution Made Yet" DataKeyNames="Contribution_Id" AutoGenerateColumns="False">
        <Columns>
            <asp:TemplateField HeaderStyle-BackColor="#007bff" HeaderStyle-ForeColor="White">
                <ItemTemplate>
                    <a href="JavaScript:collapseDiv
				('div<%# Eval("Contribution_Id") %>');">
                        <img style="display: unset !important; text-align: unset !important; width: unset !important; height: unset !important; padding-top: unset !important; border-radius: unset !important; background-color: transparent !important; color: black !important; transition-duration: unset !important;" alt="Transactions" id="imgdiv<%# Eval
					("Contribution_Id") %>"
                            src="images/plus1.png" />
                    </a>
                    <div style="display: none" id="div<%# Eval("Contribution_Id") %>">
                        <asp:GridView ID="GridView2" runat="server" DataKeyNames="Contribution_Id" AutoGenerateColumns="False">
                            <Columns>
                                <asp:TemplateField HeaderStyle-BackColor="#007bff" HeaderStyle-ForeColor="White">
                                    <ItemTemplate>
                                        <%#Container.DataItemIndex+1 %>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="CREATED_DT" DataFormatString="{0:d}" HtmlEncode="False" HeaderText="Transaction Date " HeaderStyle-BackColor="#007bff" HeaderStyle-ForeColor="White" />
                                <asp:BoundField DataField="Amount" HtmlEncode="False" DataFormatString="{0:c}" HeaderText="Amount Paid" HeaderStyle-BackColor="#007bff" HeaderStyle-ForeColor="White" />
                                <asp:BoundField DataField="PAYMENT_DETAILS" NullDisplayText="-" HtmlEncode="False" DataFormatString="{0:c}" HeaderText="Payment Details" HeaderStyle-BackColor="#007bff" HeaderStyle-ForeColor="White" />
                                <asp:BoundField DataField="PAYMENT_MODE" HtmlEncode="False" HeaderText="Payment Mode" HeaderStyle-BackColor="#007bff" HeaderStyle-ForeColor="White" />
                                <asp:BoundField DataField="PAYMENT_RECEIVED_DT" DataFormatString="{0:d}" HtmlEncode="False" HeaderText="Payment Received Date" HeaderStyle-BackColor="#007bff" HeaderStyle-ForeColor="White" />
                            </Columns>
                        </asp:GridView>
                    </div>
                </ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderStyle-BackColor="#007bff" HeaderStyle-ForeColor="White" HeaderText="S/N">
                <ItemTemplate >
                    <%#Container.DataItemIndex+1 %>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="CONTRIBUTION_ID" ItemStyle-CssClass="hiddencol" HeaderStyle-CssClass="hiddencol" />
            <asp:BoundField DataField="CONTRIBUTION_DT" DataFormatString="{0:d}" HtmlEncode="False" HeaderText="Contribution Date" HeaderStyle-BackColor="#007bff" HeaderStyle-ForeColor="White" />
            <asp:BoundField DataField="TOTAL_AMOUNT" DataFormatString="{0:c}" HtmlEncode="False" HeaderText="Total Amount" HeaderStyle-BackColor="#007bff" HeaderStyle-ForeColor="White" />
            <asp:BoundField DataField="Amount_Paid" DataFormatString="{0:c}" HtmlEncode="False" HeaderText="Amount Paid" HeaderStyle-BackColor="#007bff" HeaderStyle-ForeColor="White" />
            <asp:BoundField DataField="Times_Paid" HtmlEncode="False" HeaderText="Times Paid" HeaderStyle-BackColor="#007bff" HeaderStyle-ForeColor="White" />        
            <asp:BoundField DataField="CONTRIBUTION_STATUS" HtmlEncode="False" HeaderText="Status" HeaderStyle-BackColor="#007bff" HeaderStyle-ForeColor="White" />
            <asp:BoundField DataField="TER_SENT_DT" NullDisplayText="-" DataFormatString="{0:d}" HtmlEncode="False" HeaderText="TER Sent Date" HeaderStyle-BackColor="#007bff" HeaderStyle-ForeColor="White" />
            <asp:BoundField DataField="TER_RECEIVED_DT" NullDisplayText="-" DataFormatString="{0:d}" HtmlEncode="False" HeaderText="TER Received Date" HeaderStyle-BackColor="#007bff" HeaderStyle-ForeColor="White" />
            <asp:BoundField DataField="TER_DETAILS" NullDisplayText="-" HtmlEncode="False" HeaderText="TER Details" HeaderStyle-BackColor="#007bff" HeaderStyle-ForeColor="White" />
        </Columns>
    </asp:GridView>

    <script>
        function collapseDiv(divName) {
            var divImg = "img" + divName;
            if ($("#" + divImg).attr("src") == "images/plus1.png") {
                $("#" + divImg)
                    .closest("tr")
                    .after("<tr><td></td><td colspan = '100%'>" + $("#" + divName).html() + "</td></tr>")
                $("#" + divImg).attr("src", "images/minus1.png");
            } else {
                $("#" + divImg).closest("tr").next().remove();
                $("#" + divImg).attr("src", "images/plus1.png");
            }
        }
    </script>

</asp:Content>
