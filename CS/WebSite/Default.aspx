<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGlobalEvents" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxPopupControl" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxMenu" TagPrefix="dx" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>How to check a type of the DevExpress control's client-side instance</title>
    <style type="text/css">
        #instanceofResults span {
            color: green;
        }
    </style>
    <script type="text/javascript">
        function OnControlsInitialized(s, e) {
            var div = document.getElementById("instanceofResults");

            DisplayInstanceOfResults(div, "ASPxMenu", "ASPxClientMenu", menu, ASPxClientMenu);
            DisplayInstanceOfResults(div, "ASPxDateEdit", "ASPxClientDateEdit", dateEdit, ASPxClientDateEdit);
            DisplayInstanceOfResults(div, "ASPxGridView", "ASPxClientGridView", gridView, ASPxClientGridView);
            DisplayInstanceOfResults(div, "ASPxPopupControl", "ASPxClientPopupControl", popupControl, ASPxClientPopupControl);
            DisplayInstanceOfResults(div, "ASPxButton", "ASPxClientButton", button, ASPxClientButton);
        }

        function DisplayInstanceOfResults(outputElement, controlName, controlClietType, control, constructor) {
            var st = outputElement.innerHTML;
            st = st + controlName + " is " + controlClietType + " = <span>" + (control instanceof constructor).toString() +
                "</span>; is ASPxClientControl = <span>" + (control instanceof ASPxClientControl).toString() + "</span><br />";
            outputElement.innerHTML = st;
        }
    </script>
</head>
<body>
    <form id="form2" runat="server">
        <dx:ASPxMenu ID="mn" runat="server" ClientInstanceName="menu">
            <Items>
                <dx:MenuItem>
                </dx:MenuItem>
            </Items>
        </dx:ASPxMenu>
        <dx:ASPxDateEdit ID="de" runat="server" ClientInstanceName="dateEdit"></dx:ASPxDateEdit>
        <dx:ASPxGridView ID="gv" runat="server" ClientInstanceName="gridView"></dx:ASPxGridView>
        <dx:ASPxPopupControl ID="pc" runat="server" ClientInstanceName="popupControl"></dx:ASPxPopupControl>
        <dx:ASPxButton ID="btn" runat="server" Text="ASPxButton" ClientInstanceName="button">
        </dx:ASPxButton>
        <dx:ASPxGlobalEvents ID="ge" runat="server">
            <ClientSideEvents ControlsInitialized="OnControlsInitialized" />
        </dx:ASPxGlobalEvents>
        <div id="instanceofResults"></div>
    </form>
</body>
</html>
