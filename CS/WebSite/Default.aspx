<%-- BeginRegion Page setup --%>
<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="MakeItemVisible" %>

<%@ Register Assembly="DevExpress.Web.v13.1" Namespace="DevExpress.Web.ASPxHiddenField"
    TagPrefix="dxhf" %>

<%@ Register Assembly="DevExpress.Web.v13.1" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dxe" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%-- EndRegion --%>
<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Editors - Options selection on client-side via two ListBoxes</title>
    <style type="text/css">
        .btmargins { margin-bottom: 4px;}
        .btspace { margin-top: 11px;}
    </style>
    <script type="text/javascript">
        function UpdateButtons() {
            btSelect.SetEnabled(lbOptions.GetSelectedItem() != null);
            btSelectAll.SetEnabled(lbOptions.GetItemCount() > 0);
            btUnselect.SetEnabled(lbSelectedOptions.GetSelectedItem() != null);
            btUnselectAll.SetEnabled(lbSelectedOptions.GetItemCount() > 0);
        }
        function MoveItems(lb1, lb2) {
            lb2.BeginUpdate();
            var itemCount = lb1.GetItemCount();
            for (var i = 0; i < itemCount; i++) {
                var item = lb1.GetItem(0);
                lb2.InsertItem(GetCurrentIndex(item.value, lb2), item.text, item.value);
                lb1.RemoveItem(0);
            }
            lb2.EndUpdate();
            UpdateButtons();
        }
        function MoveSelectedItem(lb1, lb2) {
            var item = lb1.GetSelectedItem();
            if (item != null) {
                lb2.InsertItem(GetCurrentIndex(item.value, lb2), item.text, item.value);
                lb1.RemoveItem(item.index);
            }
            UpdateButtons();
        }
        
        function SelectOption() {
            MoveSelectedItem(lbOptions, lbSelectedOptions);
        }
        function SelectAllOptions() {
            MoveItems(lbOptions, lbSelectedOptions);
        }
        function UnselectOption() {
            MoveSelectedItem(lbSelectedOptions, lbOptions);
        }
        function UnselectAllOptions() {
            MoveItems(lbSelectedOptions, lbOptions);
        }
        function GetPrimaryIndex(value){
            var options = GetPrimaryOptions();
            for(var i = 0; i < options.length; i++)
                if(options[i] == value)
                    return i;
        }
        function GetCurrentIndex(value, lbDestination){
            var options = GetPrimaryOptions();
            for(var i = (GetPrimaryIndex(value) - 1); i >= 0; i--){
                var neighborIndex = GetItemIndexByValue(options[i], lbDestination);
                if( neighborIndex != -1)
                    return neighborIndex + 1;
            }
            return 0;
        }
        function GetItemIndexByValue(value, listBox){
            var itemCount = listBox.GetItemCount();
            for (var i = 0; i < itemCount; i++)
               if(listBox.GetItem(i).value == value)
                    return i;
            return -1;
        }
        function GetPrimaryOptions(){
            return hiddenField.Get("options");
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        

        <table>
            <tr>
                <td valign="top">
                    <dxe:ASPxListBox ID="lbOptions" runat="server" ClientInstanceName="lbOptions" EnableViewState="False" Height="200px" Width="100px">
                         <Items>
                             <dxe:ListEditItem Text="Option 1" Value="1" />
                             <dxe:ListEditItem Text="Option 2" Value="2" />
                             <dxe:ListEditItem Text="Option 3" Value="3" />
                             <dxe:ListEditItem Text="Option 4" Value="4" />
                             <dxe:ListEditItem Text="Option 5" Value="5" />
                             <dxe:ListEditItem Text="Option 6" Value="6" />
                             <dxe:ListEditItem Text="Option 7" Value="7" />
                             <dxe:ListEditItem Text="Option 8" Value="8" />
                             <dxe:ListEditItem Text="Option 9" Value="9" />
                             <dxe:ListEditItem Text="Option 10" Value="10" />
                         </Items>
                        <ClientSideEvents SelectedIndexChanged="UpdateButtons" Init="UpdateButtons" />
                     </dxe:ASPxListBox>
                </td>
                <td>
                    <dxe:ASPxButton ID="btSelect" runat="server" Text=">" AutoPostBack="False" ClientInstanceName="btSelect" CssClass="btmargins">
                        <ClientSideEvents Click="SelectOption" />
                    </dxe:ASPxButton>
                    <dxe:ASPxButton ID="btSelectAll" runat="server" Text=">>" AutoPostBack="False" ClientInstanceName="btSelectAll" CssClass="btmargins">
                        <ClientSideEvents Click="SelectAllOptions" />
                    </dxe:ASPxButton>
                    <dxe:ASPxButton ID="btUnselect" runat="server" Text="<" AutoPostBack="False" ClientInstanceName="btUnselect" CssClass="btmargins btspace">
                        <ClientSideEvents Click="UnselectOption" />
                    </dxe:ASPxButton>
                    <dxe:ASPxButton ID="btUnselectAll" runat="server" Text="<<" AutoPostBack="False" ClientInstanceName="btUnselectAll" CssClass="btmargins">
                        <ClientSideEvents Click="UnselectAllOptions" />
                    </dxe:ASPxButton>
                </td>
                <td valign="top">
                    <dxe:ASPxListBox ID="lbSelectedOptions" runat="server" ClientInstanceName="lbSelectedOptions" EnableViewState="False" Height="200px" Width="100px">
                        <ClientSideEvents SelectedIndexChanged="UpdateButtons" />
                     </dxe:ASPxListBox>
                </td>
            </tr>
        </table>
    </div>
        <dxhf:ASPxHiddenField id="hiddenField" ClientInstanceName="hiddenField" runat="server" SyncWithServer="False">
        </dxhf:ASPxHiddenField>
    
</form>
</body>
</html>