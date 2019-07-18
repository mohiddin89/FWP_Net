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



        table {
            border-collapse: separate;
            border-spacing: 0;
            color: #4a4a4d;
            font: 14px/1.4 "Helvetica Neue", Helvetica, Arial, sans-serif;
        }

        th,
        td {
            padding: 10px 15px;
            vertical-align: middle;
        }

        thead {
            background: #395870;
            color: #fff;
        }
    </style>
    <script src="Scripts/jquery-1.8.2.min.js"></script>
    <script src="Scripts/jquery.signalR-1.0.1.min.js"></script>
    <script src="signalr/hubs"></script>
    <script src="Scripts/knockout-2.2.0.js"></script>
    <script type="text/javascript">
        // Here we start
        $(function () {
            var chat = $.connection.cricketHub,
                viewModel = {
                    teams: ko.observableArray([
                    { team: 'india', runs: 0, wickets: 0, balls: 0, oversText: '0.0' },
                    { team: 'pakistan', runs: 0, wickets: 0, balls: 0, oversText: '0.0' }])
                },
                index = 0;// index represant the position of the current batting team
            chat.client.updateScore = function (t) {
                viewModel.teams(JSON.parse(t));
            };
            chat.client.matchFinished = function (result) {
                alert(result);
            };
            $.connection.hub.start().done(function () {
                $('#updateScoreLink').click(function () {
                    var teams = viewModel.teams(),
                        team1 = teams[index],
                        team2 = teams[(index + 1) % 2],
                        wicketFalled = getRandomInt(0, 5) == 3 ? true : false;
                    // Assuming that the wicket will only fall when  a 0-5 random number is 3
                    team1.runs += getRandomInt(0, 6); // Get a random score between 0 to 6
                    team1.wickets += wicketFalled ? 1 : 0;
                    team1.balls += 1;
                    team1.oversText = truncate(team1.balls / 6).toString() + '.' + (team1.balls % 6).toString();
                    chat.server.updateScore(JSON.stringify(teams));
                    if (team1.balls === 12 && team2.balls === 12) {
                        $('#updateScoreLink').hide();
                        var message = (team1.runs > team2.runs ? team1.team : team2.team) + ' won';
                        message = team1.runs === team2.runs ? 'match tied' : message;
                        message += '\n' + team1.team + ': ' + team1.runs + '/' + team1.wickets + ' overs: ' + team1.oversText;
                        message += '\n' + team2.team + ': ' + team2.runs + '/' + team2.wickets + ' overs: ' + team2.oversText;
                        chat.server.matchFinished(message);
                    }
                    else if (team1.balls === 12) {
                        index = 1;// second team batting
                    }
                    viewModel.teams([team1, team2]);
                });
            });
            ko.applyBindings(viewModel);
            if (isAdmin()) {
                $('#updateScore').show();
            }

            function getRandomInt(min, max) {
                return Math.floor(Math.random() * (max - min + 1)) + min;
            }
            function truncate(n) {
                return Math[n > 0 ? "floor" : "ceil"](n);
            }
            function isAdmin() {
                // For demo, assuming that only admin can update the score 
                // and the admin will be user which have admin querystring.
                return location.href.indexOf('admin=') > -1
            }
        });
    </script>
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
            <div>
                <asp:Label ID="lbljoinContest" runat="server">Join Contest</asp:Label>
            </div>
            <div>
                <asp:GridView ID="grd1stInnings" runat="server"
                    AutoGenerateColumns="False" CellPadding="4" PageSize="10"
                    ForeColor="#333333" GridLines="None" Width="600" AllowPaging="True"
                    OnPageIndexChanging="grdData_PageIndexChanging">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775"></AlternatingRowStyle>
                    <Columns>
                        <asp:BoundField DataField="Score" HeaderText="Score"></asp:BoundField>
                        <asp:BoundField DataField="Total Spots" HeaderText="Total Spots"></asp:BoundField>
                        <asp:BoundField DataField="Entry Spots" HeaderText="Entry Spots"></asp:BoundField>
                        <asp:BoundField DataField="Remaining Spots" HeaderText="Remaining Spots"></asp:BoundField>
                        <asp:BoundField DataField="Prize" HeaderText="Prize"></asp:BoundField>
                        <%--<asp:BoundField DataField="Entry" HeaderText="Entry"></asp:BoundField>--%>
                        <asp:TemplateField ShowHeader="False" HeaderText="Entry">
                            <ItemTemplate>
                                <asp:Button ID="Button_1stInn" runat="server" CausesValidation="false" CommandName="Entry"
                                    Text="Submit" OnClick="MyButtonClick" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <EditRowStyle BackColor="#999999"></EditRowStyle>
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True"
                        ForeColor="White"></FooterStyle>
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True"
                        ForeColor="White"></HeaderStyle>
                    <PagerStyle BackColor="#284775" ForeColor="White"
                        HorizontalAlign="Center"></PagerStyle>
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333"></RowStyle>
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333"></SelectedRowStyle>
                    <SortedAscendingCellStyle BackColor="#E9E7E2"></SortedAscendingCellStyle>
                    <SortedAscendingHeaderStyle BackColor="#506C8C"></SortedAscendingHeaderStyle>
                    <SortedDescendingCellStyle BackColor="#FFFDF8"></SortedDescendingCellStyle>
                    <SortedDescendingHeaderStyle BackColor="#6F8DAE"></SortedDescendingHeaderStyle>
                </asp:GridView>
            </div>
            <div style="margin-top: 50px;">
                <asp:GridView ID="grd2ndInnings" runat="server"
                    AutoGenerateColumns="False" CellPadding="4" PageSize="10"
                    ForeColor="#333333" GridLines="None" Width="600" AllowPaging="True"
                    OnPageIndexChanging="grdData_PageIndexChanging_2ndInn">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775"></AlternatingRowStyle>
                    <Columns>
                        <asp:BoundField DataField="Score" HeaderText="Score"></asp:BoundField>
                        <asp:BoundField DataField="Total Spots" HeaderText="Total Spots"></asp:BoundField>
                        <asp:BoundField DataField="Entry Spots" HeaderText="Entry Spots"></asp:BoundField>
                        <asp:BoundField DataField="Remaining Spots" HeaderText="Remaining Spots"></asp:BoundField>
                        <asp:BoundField DataField="Prize" HeaderText="Prize"></asp:BoundField>
                        <%--<asp:BoundField DataField="Entry" HeaderText="Entry"></asp:BoundField>--%>
                        <asp:TemplateField ShowHeader="False" HeaderText="Entry">
                            <ItemTemplate>
                                <asp:Button ID="Button_2ndInn" runat="server" CausesValidation="false" CommandName="Entry"
                                    Text="Submit" OnClick="MyButtonClick1" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <EditRowStyle BackColor="#999999"></EditRowStyle>
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True"
                        ForeColor="White"></FooterStyle>
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True"
                        ForeColor="White"></HeaderStyle>
                    <PagerStyle BackColor="#284775" ForeColor="White"
                        HorizontalAlign="Center"></PagerStyle>
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333"></RowStyle>
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333"></SelectedRowStyle>
                    <SortedAscendingCellStyle BackColor="#E9E7E2"></SortedAscendingCellStyle>
                    <SortedAscendingHeaderStyle BackColor="#506C8C"></SortedAscendingHeaderStyle>
                    <SortedDescendingCellStyle BackColor="#FFFDF8"></SortedDescendingCellStyle>
                    <SortedDescendingHeaderStyle BackColor="#6F8DAE"></SortedDescendingHeaderStyle>
                </asp:GridView>
            </div>
            <div>
                <div id="updateScore" style="display: none;">
                    <input type="button" id="updateScoreLink" value="Update Score" />
                </div>
                <br />
                <div data-bind="foreach: teams">
                    <div>
                        <span class="team" data-bind=" html: team "></span>
                        <span class="runs" data-bind=" html: runs"></span>/<span class="wickets" data-bind="    html: wickets "></span>
                        <b>Overs</b> <span class="overs" data-bind=" html: oversText "></span>
                    </div>
                </div>

            </div>

        </div>

    </form>
</body>
</html>
