using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GridViewTable
{
    public partial class GridView : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                this.BindGrid();
            }

        }
        private void BindGrid(string searchTerm = "")
        {
            string constr = ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString;

            string query = "SELECT * FROM CarModel";
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter(query, con))
                {
                    using (DataTable dt = new DataTable())
                    {
                        sda.Fill(dt);
                        Grd_View.DataSource = dt;
                        Grd_View.DataBind();
                    }
                }
            }
        }         
               
 
        protected void Grd_View_RowDataBound(object sender, GridViewRowEventArgs e)
        {

        }

        protected void Grd_View_RowEditing(object sender, GridViewEditEventArgs e)
        {
            Grd_View.EditIndex = e.NewEditIndex;
            this.BindGrid();

        }

        protected void Grd_View_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            Grd_View.EditIndex = -1;
            this.BindGrid();
        }

        protected void Grd_View_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            Grd_View.PageIndex = e.NewPageIndex;
            this.BindGrid();
        }

        protected void Grd_View_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int Row_Id = Convert.ToInt32(Grd_View.DataKeys[e.RowIndex].Value.ToString());

            //GridViewRow row = Grd_View.Rows[e.RowIndex];
            //int RowId = Convert.ToInt32(e.RowIndex);
            //string name = (row.FindControl("txtName") as TextBox).Text;


            string BrandCode = (Grd_View.Rows[e.RowIndex].FindControl("Text_BrandCode") as TextBox).Text;
            string Brand = (Grd_View.Rows[e.RowIndex].FindControl("Text_Brand") as TextBox).Text;
            string ModelCode = (Grd_View.Rows[e.RowIndex].FindControl("Text_ModelCode") as TextBox).Text;
            string ModelDescription = (Grd_View.Rows[e.RowIndex].FindControl("Text_ModelDescription") as TextBox).Text;
            string EngineCapacity = (Grd_View.Rows[e.RowIndex].FindControl("Text_EngineCapacity") as TextBox).Text;
            string GearType = (Grd_View.Rows[e.RowIndex].FindControl("Text_GearType") as TextBox).Text;
            string FuelTankCapacity = (Grd_View.Rows[e.RowIndex].FindControl("Text_FuelTankCapacity") as TextBox).Text;
            string Mileage = (Grd_View.Rows[e.RowIndex].FindControl("Text_Mileage") as TextBox).Text;
            string Price = (Grd_View.Rows[e.RowIndex].FindControl("Text_Price") as TextBox).Text;


            //  string query = "UPDATE Customers SET Name=@Name, Country=@Country WHERE CustomerId=@CustomerId";
            string query = "UPDATE CarModel SET BrandCode='" + BrandCode + "', Brand='" + Brand + "', ModelCode='" + ModelCode + "', ModelDescription='" + ModelDescription + "', EngineCapacity='" + EngineCapacity + "', GearType='" + GearType + "', FuelTankCapacity='" + FuelTankCapacity + "', Mileage='" + Mileage + "', Price='" + Price + "' WHERE Row_Id='" + Row_Id + "' ";

            string constr = ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand(query))
                {
                    // cmd.Parameters.AddWithValue("@CustomerId", customerId);
                    //  cmd.Parameters.AddWithValue("@Name", name);
                    //  cmd.Parameters.AddWithValue("@Country", country);
                    cmd.Connection = con;
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                    Lbl_MessageType.Text = "Success";
                    
                } 
            }
            Grd_View.EditIndex = -1;
            this.BindGrid();
            
        }
        protected void Grd_View_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int Row_Id = Convert.ToInt32(Grd_View.DataKeys[e.RowIndex].Value.ToString());

            //int RowId = Convert.ToInt32(Grd_View.DataKeys[e.RowIndex]);
            string query = "DELETE FROM CarModel WHERE Row_Id='" + Row_Id + "'";
            string constr = ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand(query))
                {
                    //  cmd.Parameters.AddWithValue("@CustomerId", customerId);
                    cmd.Connection = con;
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }
            this.BindGrid();
        }

        protected void Btn_Add_Click(object sender, EventArgs e)
        {

            string BrandCode = Text_BrandCode.Text;
            string Brand = Text_Brand.Text;
            string ModelCode = Text_ModelCode.Text;
            string ModelDescription = Text_ModelDescription.Text;
            string EngineCapacity = Text_EngineCapacity.Text;
            string GearType = Text_GearType.Text;
            string FuelTankCapacity = Text_FuelTankCapacity.Text;
            string Mileage = Text_Mileage.Text;
            string Price = Text_Price.Text;

            //string query = "INSERT INTO Customers VALUES(@Name, @Country)";
            string query = "INSERT INTO CarModel (BrandCode,Brand,ModelCode,ModelDescription,EngineCapacity,GearType,FuelTankCapacity,Mileage,Price) VALUES('" + BrandCode + "', '" + Brand + "','" + ModelCode + "','" + ModelDescription + "','" + EngineCapacity + "','" + GearType + "','" + FuelTankCapacity + "','" + Mileage + "','" + Price + "')";
            string constr = ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand(query))
                {
                    // cmd.Parameters.AddWithValue("@Name", name);
                    // cmd.Parameters.AddWithValue("@Country", country);
                    cmd.Connection = con;
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                    //ScriptManager.RegisterClientScriptBlock(this,this.GetType(),"Message","alert('Success')",true);
                }
            }
            Text_BrandCode.Text = "";
            Text_Brand.Text = "";
            Text_ModelCode.Text = "";
            Text_ModelDescription.Text = "";
            Text_EngineCapacity.Text = "";
            Text_GearType.Text = "";
            Text_FuelTankCapacity.Text = "";
            Text_Mileage.Text = "";
            Text_Price.Text = "";
            this.BindGrid();
            Lbl_MessageType.Text = "Success";
        }       
    }
}