<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="APR.aspx.cs" Inherits="GnTAMRDashboard.Views.APR" %>

<%@ Register Src="~/Custom/ApprovalControl.ascx" TagPrefix="uc1" TagName="ApprovalControl" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <uc1:ApprovalControl runat="server" ID="ApprovalControl" />
</asp:Content>
