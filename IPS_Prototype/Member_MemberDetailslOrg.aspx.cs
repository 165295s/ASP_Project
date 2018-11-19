using IPS_Prototype.DAL;
using IPS_Prototype.RetrieveClass;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IPS_Prototype
{
    public partial class Member_MemberDetailslOrg : System.Web.UI.Page
    {
        DALMembership dao = new DALMembership();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["OrgId"] != null)
            {
                string orgId = Session["OrgId"].ToString();
                GridView1.DataSource = dao.GetOrganizationMembershipContribution(orgId);
                GridView1.DataBind();
            }

            if (!IsPostBack)
            {
                string OrganisationName = (string)(Session["OrganisationID"]);
                DALMembership dao = new DALMembership();
                MemberInfo member = new MemberInfo();
                member = dao.GetOrganisationDataRenewal(OrganisationName);
                if (member.DonorTier != null)
                {
                    lblExpiryDate.InnerText = member.ExpiryDate;
                    lblDonorTier.InnerText = member.DonorTier;
                    orgName.Value = member.IndividualName;
                    orgName.Value = OrganisationName;
                    lblOrgName.InnerText = orgName.Value;
                }
                else
                {
                    ScriptManager.RegisterStartupScript(Page, GetType(), "AlertFailureDisplay", "displayFailure();", true);
                }           
            }
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            int statuscolumnIndex = 7; // check in your gridview
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

            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                string contributionId = GridView1.DataKeys[e.Row.RowIndex].Value.ToString();
                GridView gridView = (GridView)e.Row.FindControl("GridView2");
                if (gridView != null)
                {
                    gridView.DataSource = dao.GetContributionTransaction(contributionId);
                    gridView.DataBind();
                }
            }
        }

    }
}