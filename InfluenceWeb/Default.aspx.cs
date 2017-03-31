using System;
using System.Collections.Generic;
using System.Data;
using System.Xml;
using System.Web.UI;
using System.Web.UI.WebControls;
using InfluenceWeb.Models;
namespace InfluenceWeb
{
    public partial class _Default : Page
    {
        private readonly string strXMLFileName = @"C:\ImpactAnalysisFile\NextGenImpact.xml";

        FunctionalDetailss lstFunctionalDetails = new FunctionalDetailss();
        DatabaseDetailsList lstDataBaseDetails = new DatabaseDetailsList();
        OtherDetailsList lstOtherDetails = new OtherDetailsList();

        protected void Page_Load(object sender, EventArgs e)
        {

        }


        protected void TreeView1_SelectedNodeChanged(object sender, EventArgs e)
        {
            XmlDocument xmlDoc = new XmlDocument();
            xmlDoc.Load(strXMLFileName);
            
            XmlElement root = xmlDoc.DocumentElement;
            XmlNodeList nodes = root.SelectNodes("//Node");

            foreach (XmlNode node in nodes)
            {
                if (node.Attributes["name"].Value == TreeView1.SelectedValue)
                {
                    treeviewpath.Text = TreeView1.SelectedValue;
                    BuildFunctionalDetails(node);
                    grdFunctional.DataSource = lstFunctionalDetails;
                    grdFunctional.DataBind();

                    BuildDatabaseDetails(node);
                    grdDatabase.DataSource = lstDataBaseDetails;
                    grdDatabase.DataBind();

                    BuildOtherDetails(node);
                    grdOtherDetails.DataSource = lstOtherDetails;
                    grdOtherDetails.DataBind();

                    break;
                }
            }
        }

        private void BuildFunctionalDetails(XmlNode xmlnode)
        {
            lstFunctionalDetails.Clear();
            foreach (XmlNode xmln in xmlnode.ChildNodes)
            {
                if (xmln.Name == "Functional")
                {
                    FunctionalDetails f = new FunctionalDetails();
                    f.ImpactDescription = xmln.Attributes["Impact"].Value;
                    f.ProductName = xmln.Attributes["Product"].Value;
                    f.ModuleName = xmln.Attributes["Module"].Value;
                    f.Complexity = xmln.Attributes["Complexity"].Value;
                    lstFunctionalDetails.Add(f);
                }
            }
        }
        private void BuildDatabaseDetails(XmlNode xmlnode)
        {
            lstDataBaseDetails.Clear();
            foreach (XmlNode xmln in xmlnode.ChildNodes)
            {
                if (xmln.Name == "Database")
                {
                    DataBaseDetails f = new DataBaseDetails();
                    f.Description = xmln.Attributes[0].Value;
                    f.Typename = xmln.Attributes[1].Value;
                    f.Type = xmln.Attributes[2].Value;
                    lstDataBaseDetails.Add(f);
                }
            }
        }
        private void BuildOtherDetails(XmlNode xmlnode)
        {
            lstOtherDetails.Clear();
            foreach (XmlNode xmln in xmlnode.ChildNodes)
            {
                if (xmln.Name == "OtherDetails")
                {
                    OtherDetails f = new OtherDetails();
                    f.Description = xmln.Attributes[0].Value;
                    f.Type = xmln.Attributes[1].Value;
                    f.Module = xmln.Attributes[2].Value;
                    f.Complexity = xmln.Attributes[3].Value;
                    lstOtherDetails.Add(f);
                }
            }
        }
    }
}