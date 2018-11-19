using IPS_Prototype.DAL;
using IPS_Prototype.RetrieveClass;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IPS_Prototype
{
    public partial class Member_MemberRenewal : System.Web.UI.Page
    {
        DALMembership mem = new DALMembership();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                QuestionOptions.SelectedIndex = 0;
                if (QuestionOptions.SelectedIndex == 0)
                {
                    panPerson.Attributes.CssStyle.Add("display", "none");
                    panOrg.Attributes.CssStyle.Add("display", "block");
                }
                else if (QuestionOptions.SelectedIndex == 1)
                {
                    panPerson.Attributes.CssStyle.Add("display", "block");
                    panOrg.Attributes.CssStyle.Add("display", "none");
                }

                gvOrg.DataSource = mem.getAllMembershipRenewalDetailOrg();
                gvOrg.DataBind();
                gvOrg.HeaderRow.TableSection = TableRowSection.TableHeader;
                Session.Add("OrganisationID", null);
                Session.Add("ContributionIdOrg", null);

                gvPerson.DataSource = mem.getAllMembershipRenewalDetailPerson();
                gvPerson.DataBind();
                gvPerson.UseAccessibleHeader = true;
                gvPerson.HeaderRow.TableSection = TableRowSection.TableHeader;
                Session.Add("IndividualID", null);
                Session.Add("ContributionID", null);
            }
            else
            {
                if (QuestionOptions.SelectedIndex == 0)
                {
                    panPerson.Attributes.CssStyle.Add("display", "none");
                    panOrg.Attributes.CssStyle.Add("display", "block");
                }
                else if (QuestionOptions.SelectedIndex == 1)
                {
                    panPerson.Attributes.CssStyle.Add("display", "block");
                    panOrg.Attributes.CssStyle.Add("display", "none");
                }
                //If error, display failure message
                ScriptManager.RegisterStartupScript(Page, GetType(), "AlertFailureDisplay", "displayFailure();", true);
            }
        }

        public DataTable GetData()
        {
           return mem.getAllMembershipRenewalDetailOrg();
        }

        protected void gvPerson_RowEditing(object sender, GridViewEditEventArgs e)
        {
            //Get values from rows in table where edit button event is triggered
            string indname = gvPerson.Rows[e.NewEditIndex].Cells[1].Text;
            string email = gvPerson.Rows[e.NewEditIndex].Cells[2].Text;
            string expirydate = gvPerson.Rows[e.NewEditIndex].Cells[4].Text;
            string personId = gvPerson.Rows[e.NewEditIndex].Cells[0].Text;
            string contributionId = gvPerson.Rows[e.NewEditIndex].Cells[6].Text;

            //Store values taken from table in session and redirect to User_Add.aspx
            Session.Add("ContributionID", contributionId);
            Session.Add("IndividualID", email);
            Session.Add("PersonId", personId);
            Response.Redirect("Member_MemberRenewalInd.aspx");
        }

        protected void gvOrg_RowEditing(object sender, GridViewEditEventArgs e)
        {//ContributionIdOrg
            PutValuesInSession(e.NewEditIndex);
            string contributionId = gvOrg.Rows[e.NewEditIndex].Cells[5].Text;
            Session.Add("ContributionIdOrg", contributionId);
            Response.Redirect("Member_MemberRenewalOrg.aspx");
        }

        protected void btnRenewOrg_Click(object sender, EventArgs e)
        {
            GridViewRow row = (GridViewRow)((Button)sender).NamingContainer;
            string name = row.Cells[0].Text;
            string expirydate = row.Cells[2].Text;
            string orgId = row.Cells[3].Text;
            Session.Add("OrganisationID", name);
            Session.Add("OrgId", orgId);
            string contributionId = row.Cells[5].Text;
            Session.Add("ContributionIdOrg", contributionId);
            Response.Redirect("Member_MemberRenewalOrg.aspx");
        }

        protected void btnViewContributionOrg_Click(object sender, EventArgs e)
        {
            GridViewRow row = (GridViewRow)((Button)sender).NamingContainer;
            string name = row.Cells[0].Text;
            string expirydate = row.Cells[2].Text;
            string orgId = row.Cells[3].Text;
            Session.Add("OrganisationID", name);
            Session.Add("OrgId", orgId);
            Response.Redirect("Member_MemberDetailsOrg.aspx");
        }
        private void PutValuesInSession(int rowIndex)
        {
            string name = gvOrg.Rows[rowIndex].Cells[0].Text;
            string expirydate = gvOrg.Rows[rowIndex].Cells[2].Text;
            string orgId = gvOrg.Rows[rowIndex].Cells[3].Text;
            Session.Add("OrganisationID", name);
            Session.Add("OrgId", orgId);
        }

        protected string HasMemberPaid(int personId)
        {
            return mem.HasMemberPaid(personId) ? "true" : "false";
        }
        protected string HasMemberPaidOrg(int orgId)
        {
            return mem.HasMemberPaidOrg(orgId) ? "true" : "false";
        }

        protected void btnTER_Click(object sender, EventArgs e)
        {
            //Add IndividualID to session and redirect to Member_MemberTerInd.aspx
            GridViewRow row = (GridViewRow)((Button)sender).NamingContainer;
            string indname = row.Cells[1].Text;
            string expirydate = row.Cells[4].Text;

            string email = row.Cells[2].Text;
            string contributionId = row.Cells[6].Text;
            string personId = row.Cells[0].Text;

            Session.Add("IndividualID", email);
            Session.Add("ContributionID", contributionId);
            Response.Redirect("Member_MemberTerInd.aspx");
        }
        protected void btnTEROrg_Click(object sender, EventArgs e)
        {
            GridViewRow row = (GridViewRow)((Button)sender).NamingContainer;
            string name = row.Cells[0].Text;
            string expirydate = row.Cells[2].Text;
            string contributionId = row.Cells[5].Text;

            Session.Add("ContributionIdOrg", contributionId);
            Session.Add("OrganisationID", name);
            Response.Redirect("Member_MemberTerOrg.aspx");
        }

        protected void gvPerson_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            int statuscolumnIndex = 5; // check in your gridview
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                string status = DataBinder.Eval(e.Row.DataItem, "CONTRIBUTION_STATUS").ToString();
                if (status == "Full")
                    e.Row.Cells[statuscolumnIndex].ForeColor = System.Drawing.Color.SeaGreen;
                else if (status == "Installment")
                {
                    e.Row.Cells[statuscolumnIndex].ForeColor = System.Drawing.Color.DarkOrange;
                }
            }
        }

        protected void gvOrg_RowDataBound(object sender, GridViewRowEventArgs e)
        {
          
           
        }

        protected void gvOrg_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvOrg.PageIndex = e.NewPageIndex;
            DataTable dt1 = mem.getAllMembershipRenewalDetailOrg();
            gvOrg.DataSource = dt1;
            gvOrg.DataBind();
        }

        protected void gvPerson_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvPerson.PageIndex = e.NewPageIndex;
            DataTable dt1 = mem.getAllMembershipRenewalDetailPerson();
            gvPerson.DataSource = dt1;
            gvPerson.DataBind();
        }

        protected void btnRenewInd_Click(object sender, EventArgs e)
        {
            //Get values from rows in table where edit button event is triggered
            GridViewRow row = (GridViewRow)((Button)sender).NamingContainer;
            string indname = row.Cells[1].Text;
            string email = row.Cells[2].Text;
            string expirydate = row.Cells[4].Text;
            string personId = row.Cells[0].Text;
            string contributionId = row.Cells[6].Text;

            //Store values taken from table in session and redirect to User_Add.aspx
            Session.Add("ContributionID", contributionId);
            Session.Add("IndividualID", email);
            Session.Add("PersonId", personId);
            Response.Redirect("Member_MemberRenewalInd.aspx");
        }

        protected void btnViewContributionInd_Click(object sender, EventArgs e)
        {
            GridViewRow row = (GridViewRow)((Button)sender).NamingContainer;
            string email = row.Cells[2].Text;
            string personId = row.Cells[0].Text;
            Session.Add("IndividualID", email);
            Session.Add("PersonId", personId);
            Response.Redirect("Member_MemberDetailsInd.aspx");
        }
    }
}
