using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Drawing;

namespace gridOnSelect
{
    public partial class _default : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!this.IsPostBack)
            {
                Binddata();
            }
        }

        protected void Binddata()
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("sp_tbl_record_details", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@type", 1);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();
            grd.DataSource=dt;
            grd.DataBind();

        }
        protected void btnSave_Click(object sender, EventArgs e)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("sp_tbl_record", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@type",1);
            cmd.Parameters.AddWithValue("@companyName",txtCName.Text);
            cmd.Parameters.AddWithValue("@CurrentStatus",ddlCurrentStatus.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@ContactPerson",txtPerson.Text);
            cmd.Parameters.AddWithValue("@FPerformance",ddlFinStatus.SelectedItem.Text);
            cmd.ExecuteNonQuery();
            con.Close();
            Binddata();
        }

        protected void grd_SelectedIndexChanged(object sender, EventArgs e)
        {
            foreach (GridViewRow row in grd.Rows)
            {
                if (row.RowIndex == grd.SelectedIndex)
                {
                    row.BackColor = ColorTranslator.FromHtml("#A1DCF2");
                    row.ToolTip = string.Empty;
                    ViewState["eid"] = grd.SelectedDataKey.Value.ToString();
                    //lblmsg.Text = grd.SelectedDataKey.Value.ToString();
                    //txtCName.Text= grd.SelectedDataKey.Value.ToString();
                    //grd.SelectedDataKey
                }
                else
                {
                    row.BackColor = ColorTranslator.FromHtml("#FFFFFF");
                    row.ToolTip = "Click to select this row.";
                }
            }
        }

        
        protected void grd_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Attributes["onclick"] = Page.ClientScript.GetPostBackClientHyperlink(grd, "Select$" + e.Row.RowIndex);
                e.Row.ToolTip = "Click to select this row.";
            }
        }

        protected void btnRemove_Click(object sender, EventArgs e)
        {
            try
            {
                if (ViewState["eid"] != null)
                {
                    int iid = Convert.ToInt32(ViewState["eid"]);
                    con.Open();
                    SqlCommand cmd = new SqlCommand("sp_tbl_record", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@type", 3);
                    cmd.Parameters.AddWithValue("@ID", iid);
                    cmd.ExecuteNonQuery();
                    con.Close();
                    Binddata();
                }
            }
            catch(Exception ex)
            {
                string Message = ex.Message;
            }
        }
    }
}