using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Configuration;
using System.Text;

namespace FWP_Net
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {          
            
            if (!IsPostBack)
            {
                //LoadGridData_1stInn();
                //LoadGridData_2ndInn();
            }           
        }
        //private void fillTable_Data()
        //{
        //    int rowCnt = Table1.Rows.Count;
        //    HtmlTableRow row = new HtmlTableRow();
        //    HtmlTableCell cellScore = new HtmlTableCell();
        //    HtmlTableCell cellUnitMeasure = new HtmlTableCell();
        //    HtmlTableCell cellPartNumber = new HtmlTableCell();
        //    HtmlTableCell cellDescription = new HtmlTableCell();
        //    HtmlTableCell cellUnit = new HtmlTableCell();
        //    HtmlTableCell cellTotal = new HtmlTableCell();
        //    //HtmlTableCell cellComments = new HtmlTableCell();

        //    TextBox txtScore = new TextBox();
        //    TextBox txtUnitMeasure = new TextBox();
        //    TextBox txtPartNumber = new TextBox();
        //    TextBox txtDescription = new TextBox();
        //    TextBox txtUnit = new TextBox();
        //    TextBox txtTotal = new TextBox();
        //    TextBox txtComments = new TextBox();

        //    txtScore.Width = Unit.Pixel(35);
        //    for (int i = 1; i < 100; i++)
        //    {
        //        txtScore.Text =i.ToString();

        //    }
        //    //txtQty.TextChanged += new EventHandler(txtUnit1_TextChanged);
        //    cellScore.Controls.Add(txtScore);
        //    cellScore.Align = "Center";

        //    txtUnitMeasure.Width = Unit.Pixel(50);
        //    txtUnitMeasure.ID = "txtUnitMeasure" + rowCnt;
        //    cellUnitMeasure.Controls.Add(txtUnitMeasure);
        //    cellUnitMeasure.Align = "Center";

        //    txtPartNumber.ID = "txtPartNumber" + rowCnt;
        //    cellPartNumber.Controls.Add(txtPartNumber);
        //    cellPartNumber.Align = "Center";

        //    txtDescription.ID = "txtDescription" + rowCnt;
        //    txtDescription.Width = Unit.Percentage(100);
        //    cellDescription.Controls.Add(txtDescription);
        //    cellDescription.Align = "Center";

        //    txtUnit.Width = Unit.Pixel(65);
        //    txtUnit.Text = "0";
        //    txtUnit.ID = "txtUnit" + rowCnt;
        //    cellUnit.Controls.Add(txtUnit);
        //    cellUnit.Align = "Center";

        //    txtTotal.Width = Unit.Pixel(85);
        //    txtTotal.Text = "0";
        //    txtTotal.ID = "txtTotal" + rowCnt;
        //    txtTotal.Enabled = false;
        //    cellTotal.Controls.Add(txtTotal);
        //    cellTotal.Align = "Center";

        //    txtComments.Width = Unit.Percentage(95);
        //    txtComments.ID = "txtComments" + rowCnt;
        //    //cellComments.Controls.Add(txtComments);
        //    //cellComments.Align = "Center";

        //    row.Cells.Add(cellScore);
        //    row.Cells.Add(cellUnitMeasure);
        //    row.Cells.Add(cellPartNumber);
        //    row.Cells.Add(cellDescription);
        //    row.Cells.Add(cellUnit);
        //    row.Cells.Add(cellTotal);
        //    //row.Cells.Add(cellComments);
        //    Table1.Rows.Add(row);









        //    //HtmlTableRow tRow = new HtmlTableRow();
        //    //for (int i = 1; i < 100; i++)
        //    //{
        //    //    HtmlTableCell tb = new HtmlTableCell();
        //    //    tb.InnerText = i.ToString();
        //    //    tRow.Controls.Add(tb);
        //    //}
        //    //Table1.Rows.Add(tRow);
        //}
        private void LoadGridData_1stInn()
        {
            //I am adding dummy data here. You should bring data from your repository.
            DataTable dt = new DataTable();
            dt.Columns.Add("Score");
            dt.Columns.Add("Total Spots");
            dt.Columns.Add("Entry Spots");
            dt.Columns.Add("Remaining Spots");
            dt.Columns.Add("Prize");
            dt.Columns.Add("Entry");
            int n = 1000;
            for (int i = 1; i < 100; i++)
            {
                DataRow dr = dt.NewRow();
                dr["Score"] = i;
                dr["Total Spots"] = n;
                n -= 10;
                dt.Rows.Add(dr);
            }
            grd1stInnings.DataSource = dt;
            grd1stInnings.DataBind();
           
        }
        protected void grdData_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grd1stInnings.PageIndex = e.NewPageIndex;
            LoadGridData_1stInn();
        }
        private void LoadGridData_2ndInn()
        {
            //I am adding dummy data here. You should bring data from your repository.
            DataTable dt = new DataTable();
            dt.Columns.Add("Score");
            dt.Columns.Add("Total Spots");
            dt.Columns.Add("Entry Spots");
            dt.Columns.Add("Remaining Spots");
            dt.Columns.Add("Prize");
            dt.Columns.Add("Entry");
            int n = 1000;
            for (int i = 1; i < 100; i++)
            {
                DataRow dr = dt.NewRow();
                dr["Score"] = i;
                dr["Total Spots"] = n;
                n -= 10;
                dt.Rows.Add(dr);
            }
            grd2ndInnings.DataSource = dt;
            grd2ndInnings.DataBind();
        }
        protected void grdData_PageIndexChanging_2ndInn(object sender, GridViewPageEventArgs e)
        {
            grd2ndInnings.PageIndex = e.NewPageIndex;
            LoadGridData_2ndInn();
        }
        protected void MyButtonClick(object sender, System.EventArgs e)
        {
            //Get the button that raised the event
            Button btn = (Button)sender;

            //Get the row that contains this button
            GridViewRow gvr = (GridViewRow)btn.NamingContainer;
            // DataRow row = gvr as DataRow;
            

            try
            {
                if ((Convert.ToInt32(gvr.Cells[2].Text)>=1))
                gvr.Cells[2].Text = (Convert.ToInt32(gvr.Cells[2].Text) + 1).ToString();
            }
            catch {
                gvr.Cells[2].Text = (1).ToString();
            }
            gvr.Cells[3].Text = (Convert.ToInt32(gvr.Cells[1].Text) - Convert.ToInt32(gvr.Cells[2].Text)).ToString();
            //gvr["Entry Spots"] =gvr["Total Spots"] - 1;
        }
       
       
        protected void MyButtonClick1(object sender, System.EventArgs e)
        {
            //Get the button that raised the event
            Button btn = (Button)sender;

            //Get the row that contains this button
            GridViewRow gvr = (GridViewRow)btn.NamingContainer;
            // DataRow row = gvr as DataRow;


            try
            {
                if ((Convert.ToInt32(gvr.Cells[2].Text) >= 1))
                    gvr.Cells[2].Text = (Convert.ToInt32(gvr.Cells[2].Text) + 1).ToString();
            }
            catch
            {
                gvr.Cells[2].Text = (1).ToString();
            }
            gvr.Cells[3].Text = (Convert.ToInt32(gvr.Cells[1].Text) - Convert.ToInt32(gvr.Cells[2].Text)).ToString();
            //gvr["Entry Spots"] =gvr["Total Spots"] - 1;
        }

        protected void drpInnings_SelectedIndexChanged(object sender, EventArgs e)
        {
           
            if(drpInnings.SelectedIndex==1)
            {
                this.grd1stInnings.Visible = true;
                LoadGridData_1stInn();
                this.grd2ndInnings.Visible = false;
                //grd1stInnings.DataBind();
            }
            else
            {
                this.grd2ndInnings.Visible = true;
                LoadGridData_2ndInn();
                this.grd1stInnings.Visible = false;
            }
        }
        //public class CricketHub : Hub
        //{
        //    public void UpdateScore(string teams)
        //    {
        //        Clients.All.UpdateScore(teams);
        //    }
        //    public void MatchFinished(string result)
        //    {
        //        Clients.All.MatchFinished(result);
        //    }
        //}


    }
}