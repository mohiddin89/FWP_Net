<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="FWP_Net.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        h1 {
            padding-top: 10px;
            font-size: 36px;
            padding: 0px;
            margin: 0px;
            line-height: 100px;
            text-shadow: 0 -1px 1px rgba(0,0,0,0.25);
            width: 310px;
            float: left;
        }

        .slogan {
            float: right;
            margin: 75px 20px 0px 0px;
            font-size: 20px;
        }

        .banner {
            width: 100%;
            height: 300px;
            margin: 7px auto;
            -moz-box-shadow: 0 1px 3px rgba(0,0,0,0.5);
            -webkit-box-shadow: 0 1px 3px rgba(0,0,0,0.5);
            -moz-border-radius: 15px;
            -webkit-border-radius: 15px;
            padding-left: 0px;
            background: #a08c60 url(Running.jpg) no-repeat center left;
        }

        .banner5 {
            color: #37535B;
            background: #C6CC10 url(banner5.png) no-repeat center left;
            font-family: "Trebuchet MS";
        }

        .banner6 {
            color: white;
            /*background: #b8d8fb url(banner6.png) no-repeat center left;*/
            font-family: "Arial Narrow";
            text-transform: uppercase;
            letter-spacing: 4px;
        }

        .banner7 {
            color: #6e9cf9;
            background: #a08c60 url(banner7.png) no-repeat center left;
            font-family: "Arial Narrow";
            font-style: italic;
        }

        .auto-style1 {
            margin-left: 21px;
        }

        .auto-style2 {
            width: 115px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div class="banner banner6">
                <div>
                    <img style="height: 280px; width: 100%;" src="Images/Batting.jpeg" />
                </div>
                <%--<div><img style="height:80px; width:80px;" src="Images/1WP.png"/></div>--%>
            </div>
            <div style="margin-top: 50px;">
                <label id="lblSelectInnings">Select Innings:&nbsp; </label>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:DropDownList ID="drpInnings" runat="server">
                        <asp:ListItem Text="---Select----"></asp:ListItem>
                        <asp:ListItem Text="---1st Innings----"></asp:ListItem>
                        <asp:ListItem Text="---2nd Innings----"></asp:ListItem>
                    </asp:DropDownList>
                <br />
                <br />
                <br />
                Upcoming Matches :
                    <br />
            </div>
            <div><asp:Label ID="lbljoinContest" runat="server">Join Contest</asp:Label></div>
            <table>
                <tr>
                   
                </tr>
                <tr>
                    
                </tr>
            </table>


        </div>
    </form>
</body>
</html>
