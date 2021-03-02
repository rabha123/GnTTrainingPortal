<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="PWR.aspx.cs" Inherits="GnTAMRDashboard.Views.PWR" %>

<%@ Register Src="~/Custom/AdminControl.ascx" TagPrefix="uc1" TagName="AdminControl" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <uc1:AdminControl runat="server" ID="AdminControl" />
</asp:Content>
