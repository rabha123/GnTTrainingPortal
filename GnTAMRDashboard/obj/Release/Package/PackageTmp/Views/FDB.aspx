<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="FDB.aspx.cs" Inherits="GnTAMRDashboard.Views.FDB" %>

<%@ Register Src="~/Custom/FDBControl.ascx" TagPrefix="uc1" TagName="FDBControl" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <uc1:FDBControl runat="server" id="FDBControl" />
</asp:Content>
