<%-- BeginRegion Page setup --%>
<%@ Page Language="vb" AutoEventWireup="true" CodeFile="Default.aspx.vb" Inherits="MakeItemVisible" %>
<%@ Register Assembly="DevExpress.Web.v14.1" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>

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
				lb2.AddItem(item.text, item.value);
				lb1.RemoveItem(0);
			}
			lb2.EndUpdate();
			UpdateButtons();
		}
		function MoveSelectedItem(lb1, lb2) {
			var item = lb1.GetSelectedItem();
			if (item != null) {
				lb2.AddItem(item.text, item.value);
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
</form>
</body>
</html>