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
                    BuildFunctionalDetails(node);
                    GridView1.DataSource = lstFunctionalDetails;
                    GridView1.DataBind();
                    break;
                }
            }
        }

        private void BuildFunctionalDetails(XmlNode xmlnode)
        {
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
    }
}