<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" Theme="" %>

<%@ Register Assembly="DevExpress.Web.v13.1" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Editors - Options selection on client-side via two ListBoxes</title>
    <link rel="stylesheet" type="text/css" href="Styles/Styles.css" />
    <script type="text/javascript" src="Scripts/MovingItems.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div class="lb1">
                <dx:ASPxListBox ID="lbAvailable" runat="server" ClientInstanceName="lbAvailable" Height="200px" Width="100px" SelectionMode="CheckColumn">
                    <Items>
                        <dx:ListEditItem Text="Option 1" Value="1" />
                        <dx:ListEditItem Text="Option 2" Value="2" />
                        <dx:ListEditItem Text="Option 3" Value="3" />
                        <dx:ListEditItem Text="Option 4" Value="4" />
                        <dx:ListEditItem Text="Option 5" Value="5" />
                        <dx:ListEditItem Text="Option 6" Value="6" />
                        <dx:ListEditItem Text="Option 7" Value="7" />
                        <dx:ListEditItem Text="Option 8" Value="8" />
                        <dx:ListEditItem Text="Option 9" Value="9" />
                        <dx:ListEditItem Text="Option 10" Value="10" />
                    </Items>
                    <ClientSideEvents SelectedIndexChanged="UpdateButtons" Init="OnLBAvailableInit" />
                </dx:ASPxListBox>
            </div>
            <div class="buttonsContainer">
                <div class="buttons">
                    <dx:ASPxButton ID="btAdd" runat="server" Text=">" AutoPostBack="False" ClientInstanceName="btAdd">
                        <ClientSideEvents Click="AddSelectedItems" />
                    </dx:ASPxButton>
                    <dx:ASPxButton ID="btAddAll" runat="server" Text=">>" AutoPostBack="False" ClientInstanceName="btAddAll">
                        <ClientSideEvents Click="AddAllItems" />
                    </dx:ASPxButton>
                    <dx:ASPxButton ID="btRemoveAll" runat="server" Text="<<" AutoPostBack="False" ClientInstanceName="btRemoveAll">
                        <ClientSideEvents Click="RemoveAllItems" />
                    </dx:ASPxButton>
                    <dx:ASPxButton ID="btRemove" runat="server" Text="<" AutoPostBack="False" ClientInstanceName="btRemove">
                        <ClientSideEvents Click="RemoveSelectedItems" />
                    </dx:ASPxButton>
                </div>
            </div>
            <div class="lb2">
                <dx:ASPxListBox ID="lbChoosen" runat="server" ClientInstanceName="lbChoosen" Height="200px" Width="100px" SelectionMode="CheckColumn">
                    <ClientSideEvents SelectedIndexChanged="UpdateButtons" />
                </dx:ASPxListBox>
            </div>
        </div>
    </form>
</body>
</html>
