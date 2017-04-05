<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="InfluenceWeb._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <asp:XmlDataSource ID="Xmldatasource1" runat="server" DataFile="C:\ImpactAnalysisFile\NextGenImpact.xml"></asp:XmlDataSource>
    <style>
        body {
            background: #fff;
            color: #505050;
            font: 14px 'Segoe UI', tahoma, arial, helvetica, sans-serif;
            margin: 20px;
            padding: 0;
        }

        #header {
            background: #efefef;
            padding: 0;
        }

        h1 {
            font-size: 48px;
            font-weight: normal;
            margin: 0;
            padding: 0 30px;
            line-height: 150px;
        }

        p {
            font-size: 20px;
            color: #fff;
            background: #969696;
            padding: 0 30px;
            line-height: 50px;
        }

        #main {
            padding: 5px 30px;
        }

        .section {
            width: 30.7%;
            float: left;
            margin: 0 0 0 4%;
        }

            .section h2 {
                font-size: 13px;
                text-transform: uppercase;
                margin: 0;
                border-bottom: 1px solid silver;
                padding-bottom: 12px;
                margin-bottom: 8px;
            }

            .section.first {
                margin-left: 0;
            }

                .section.first h2 {
                    font-size: 24px;
                    text-transform: none;
                    margin-bottom: 25px;
                    border: none;
                }

                .section.first li {
                    border-top: 1px solid silver;
                    padding: 8px 0;
                }

            .section.last {
                margin-right: 0;
            }

        ul {
            list-style: none;
            padding: 0;
            margin: 0;
            line-height: 20px;
        }

        li {
            padding: 4px 0;
        }

        a {
            color: #267cb2;
            text-decoration: none;
        }

            a:hover {
                text-decoration: underline;
            }

            .AspNet-TreeView {
    width: 200px;
    border-top: solid 1px #DDD;
}
 
.AspNet-TreeView ul {
    list-style: none; 
}
 
.AspNet-TreeView-Leaf {
    border-bottom: solid 1px #DDD;
    background: url(../../images/structure/node-dot.gif) 8px 9px no-repeat;  
}
 
.AspNet-TreeView-Root {
    border-bottom: solid 1px #DDD; 
}
 
.AspNet-TreeView-Root a {
    display: block;
    width: 170px;
    margin-left: 20px;
    padding: 5px 5px 5px 5px; 
}
 
.AspNet-TreeView-Selected {
    background: #F6F6F6 url(../../images/structure/arrow-right.gif) 8px 9px no-repeat;
}
 
.AspNet-TreeView-Expand {
    display: block;
    float: left;
    margin: 9px 0px 0px 8px;
    padding: 6px 4px 5px 4px;
    height: 0px !important;
    background: url(../../images/structure/node-plus.gif) 0px 0px no-repeat;
    cursor: pointer;
}
 
.AspNet-TreeView-Collapse {
    display: block;
    float: left;
    margin: 9px 0px 0px 8px;
    padding: 6px 4px 5px 4px;
    height: 0px !important;
    background: url(../../images/structure/node-minus.gif) 0px 0px no-repeat;
    cursor: pointer;
}
 
.AspNet-TreeView-Show li {
      border-top: solid 1px #DDD;
      background-position: 28px 9px;
}
 
.AspNet-TreeView-Hide {
    display: none;
}
 
.AspNet-TreeView ul li ul li {
    text-indent: 20px;
    border-bottom: none;
    font-size: 11px;
}
    </style>
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/angularjs/1.3.0-rc.0/angular.min.js"></script>
    <script type="text/javascript"></script>
<div class="container">
<nav class="navbar navbar-light" style="background-color: #ffffff;">
    <div class="navbar-header">
      <img src="Logo.jpg" class="img-responsive"  alt="Cinque Terre" width = 350 >
    </div>
	
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav navbar-right">
		<button type="button" class="btn btn-default my-2 my-sm-0" width="30" height="30">		
	
			<span class="glyphicon glyphicon-refresh" tooltip = "Refresh">
				
			</span>
			
		</button>
		<button type="button" class="btn btn-default">
			<span class="glyphicon glyphicon-cog" tooltip = "Refresh">
				
			</span>
		</button>
		<button type="button" class="btn btn-default">			
			<span class="glyphicon glyphicon-file" tooltip = "Refresh">
				
			</span>
		</button>
		<button type="button" class="btn btn-default">			
			<span class="glyphicon glyphicon-signal" tooltip = "Refresh">
				
			</span>
		</button>
		<button type="button" class="btn btn-default">			
			<span class="glyphicon glyphicon-equalizer" tooltip = "Refresh">
				
			</span>
		</button>
		<button type="button" class="btn btn-default">			
			<span class="glyphicon glyphicon-open" tooltip = "Refresh">
				
			</span>
		</button>
      </ul>
    </div>
</nav>
</div>

<div id="main">
    <div class="section first">

        <asp:TextBox ID="txtSearch" runat ="server" Width="201px" height="30" OnTextChanged="Unnamed1_TextChanged" ></asp:TextBox>
        <button type="button" class="btn btn-default my-2 my-sm-0" width="30" height="30">
            <span class="glyphicon glyphicon-search" tooltip = "Refresh"></span>
		</button>
        <button type="button" class="btn btn-default my-2 my-sm-0" width="30" height="30">
            <span class="glyphicon glyphicon-remove" tooltip = "Refresh"></span>
		</button>

        <div class="card text-center">
            <div class="card-header">
                <ul class="nav nav-tabs card-header-tabs">
                    <li class="active">
                        <a href="#tab_list" data-toggle="tab" style="background-color: #e3f2fd;" >
                            <span class="glyphicon glyphicon-th-list" tooltip = "List"></span>
                        </a>
                    </li>
                    <li><a href="#tab_Result" data-toggle="tab" style="background-color: #e3f2fd;" >
                        <span class="glyphicon glyphicon-list-alt" tooltip = "Search Results"></span>
                        </a></li>
                    <li><a href="#tab_Export" data-toggle="tab" style="background-color: #e3f2fd;" >
                        <span class="glyphicon glyphicon-share" tooltip = "Multiple Export List"></span>
                        </a></li>
                </ul>
            </div>
        </div>
        <div class="tab-content">
            <div class="tab-pane active" id="tab_list">
                <asp:TreeView ID="TreeView1" runat="server" DataSourceID="Xmldatasource1" ShowLines="true" ExpandDepth="1" OnSelectedNodeChanged="TreeView1_SelectedNodeChanged">
                <DataBindings>
                <asp:TreeNodeBinding DataMember="node" TextField="Name" ValueField="Name" />
                </DataBindings>
                </asp:TreeView>	
            </div>
            <div class="tab-pane" id="tab_Result">
                Show Search result here..
                <asp:ListBox ID ="lstsearchresult" runat="server"/>
            </div>
            <div class="tab-pane" id="tab_Export">
                Show Export result here..
            </div>
        </div>
    </div>
    <div class="section">
        <asp:Label ID="treeviewpath" runat="server" />
        <div class="card text-center">
            <div class="card-header">
                <ul class="nav nav-tabs card-header-tabs ">
                <li class="active"><a href="#tab_a" data-toggle="tab" style="background-color: #e3f2fd;" >Functional</a></li>
                <li><a href="#tab_b" data-toggle="tab" style="background-color: #e3f2fd;" >Database</a></li>
                <li><a href="#tab_c" data-toggle="tab" style="background-color: #e3f2fd;" >Other Details</a></li>
                </ul>
            </div>
        </div>
            <div class="tab-content">
                <div class="tab-pane active" id="tab_a">
                    <asp:GridView ID="grdFunctional"  CssClass="table table-striped table-bordered table-hover"
                        runat="server" AutoGenerateColumns="true" Width="1111px" >
                    </asp:GridView>
                </div>
                <div class="tab-pane" id="tab_b">
                    <asp:GridView ID="grdDatabase"  CssClass="table table-striped table-bordered table-hover"
                        runat="server" AutoGenerateColumns="true" Width="1111px" >
                    </asp:GridView>
                </div>
                <div class="tab-pane" id="tab_c">
                    <asp:GridView ID="grdOtherDetails"  CssClass="table table-striped table-bordered table-hover"
                        runat="server" AutoGenerateColumns="true" Width="1111px" >
                    </asp:GridView>
                </div>
            </div>
 
    </div>
</div>
    </div>
</asp:Content>
